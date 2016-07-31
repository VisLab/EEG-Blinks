%% Setup
correlationThresholdTop = 0.98;
correlationThresholdBottom = 0.90; 
correlationThresholdMiddle = 0.95;
dumpWeb = true;
maxAmp = 600;
baseLevel = 0;
numberThresholds = 50;

%% BCIT Examples
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNew';
type = 'EOGUnrefNew';

%% Shooter Examples
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
% type = 'EOGUnrefNew';
% %type = 'ChannelUnref';

%% NCTU blinks
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
% experiment = 'NCTU_LK';
% type = 'ChannelMastNew';

%% BCI2000 blinks
% type = 'Channel';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';

%% DREAMS
% type = 'EOGMast';
% experiment = 'Dreams';
% blinkDir = 'E:\CTADATA\WholeNightDreams\data\blinks';

%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);

%% Open the index file
indexFile = [experiment type 'maxFrameDist.html'];
if dumpWeb
    fid = fopen(indexFile, 'w'); 
else
    fid = 1; %#ok<UNRCH>
end
fprintf(fid, '<h1>Experiment %s Type %s</h1>\n', experiment, type);
fprintf(fid, '<p>Top correlation: %d   Bottom correlation: %d</p>\n', ...
        correlationThresholdTop, correlationThresholdBottom);
%% Process the data
splitCount = 0;
columnLabels = {'Channel', 'NumberBlinks', 'GoodBlinks', ...
                'BlinkAmpRatio', ...
                'Cutoff', 'Median', 'Rstd', 'TMax', 'GRatioTMax', ...
                'GRatioM2Std', 'GRatioM1Std', 'GRatioMed', ...
                'GRatio1Std', 'GRatio2Std'};
baseStruct = struct('channelLabels', [], 'columnLabels', [], 'cutoffValues', []);
blinkCutoffs = cell(length(blinks), 1);
for k = 1:length(blinks)
    dBlinks = blinks(k);
    [thePath, theName, theExt] = fileparts(dBlinks.fileName);
    candidates = dBlinks.candidateSignals;
    positions = dBlinks.blinkPositions;
    blinkValues = cell(size(candidates, 1), 1);
    sIndices = dBlinks.signalIndices;
    if isempty(sIndices) || isnan(dBlinks.usedSignal)
       fprintf('%d: %s has no blinks\n', k, theName); 
       continue;
    end
    channelLabels = cell(length(sIndices), 1);
    cutVals = nan(length(sIndices), length(columnLabels));
    for n = 1:size(candidates, 1)
        cutVals(n, 1) = sIndices(n);
        channelInfo = dBlinks.signalInfo;
        labelPos = find(channelInfo.signalIndices == sIndices(n));
        channelLabels{n} = channelInfo.signalLabels{labelPos};
        thisName = [theName '_Ch' num2str(sIndices(n))];
        blinkParams = zeros(length(positions{n}), 4);
        dFits = fitBlinks(candidates(n, :), positions{n}, baseLevel);
        if isempty(dFits)
            fprintf('%d: %s channel %d has no blinks\n', k, theName, dBlinks.signalIndices(n));
            continue;
        end
        maxValues = {dFits.maxValue};
        leftR2 = {dFits.leftR2};
        rightR2 = {dFits.rightR2};
        indicesNaN = cellfun(@isnan, leftR2) | cellfun(@isnan, rightR2) ...
            | cellfun(@isnan, maxValues);
        cellfun(@isnan, maxValues)       ;
        leftR2 = cellfun(@double, leftR2);
        rightR2 = cellfun(@double, rightR2);
        maxValues = cellfun(@double, maxValues);

        blinkParams(:, 1) = maxValues';
        blinkParams(:, 2) = leftR2';
        blinkParams(:, 3) = rightR2';
        blinkParams(:, 4) = indicesNaN;
        blinkValues{n} = blinkParams;
        goodMaskTop = getGoodBlinkMask(dFits, correlationThresholdTop);
        goodMaskBottom = getGoodBlinkMask(dFits, correlationThresholdBottom);
        if isempty(goodMaskTop) || isempty(goodMaskBottom)
           fprintf('%d: %s channel %d empty top or bottom mask\n', ...
                     k, thisName, dBlinks.signalIndices(n));
            continue;
        end
        bestValues = maxValues(goodMaskTop & ~indicesNaN);
        worstValues = maxValues(~goodMaskBottom & ~indicesNaN);
        goodValues = maxValues(goodMaskBottom & ~indicesNaN);
        allValues = maxValues(~indicesNaN);
        bestMedian = nanmedian(bestValues);
        bestRobustStd = 1.4826*mad(bestValues, 1);
        worstMedian = nanmedian(worstValues);
        
        worstRobustStd = 1.4826*mad(worstValues, 1);
        overallMedian = nanmedian(maxValues);
        overallRobustStd = 1.4826*mad(maxValues, 1);
        cutoff = (bestMedian*worstRobustStd + worstMedian*bestRobustStd)/...
            (bestRobustStd + worstRobustStd);
        cutVals(n, 2) = dBlinks.numberBlinks(n);
        cutVals(n, 3) = dBlinks.goodBlinks(n);
        cutVals(n, 4) = dBlinks.blinkAmpRatios(n);
        cutVals(n, 5) = cutoff;
        cutVals(n, 6) = bestMedian;
        cutVals(n, 7) = bestRobustStd;
        upperBest = 3*bestRobustStd + max(bestMedian, cutoff);
        
        xhist = linspace(min(allValues), upperBest, numberThresholds);
        thresholds = xhist;
        goodRatios = zeros(length(thresholds), 1);
        for j = 1:length(goodRatios)
            good = sum(goodValues >= thresholds(j));
            all = sum(allValues >= thresholds(j));
            if all == 0
                continue;
            end
            goodRatios(j) = good/all;
        end
        [maxValue, maxIndex] = max(goodRatios);
        cutVals(n, 8) = thresholds(maxIndex);
        cutVals(n, 9) = maxValue;
        cutVals(n, 10) = findInterpolatedValue(thresholds, goodRatios, cutoff);
        cutVals(n, 11) = findInterpolatedValue(thresholds, goodRatios, ...
            bestMedian - 2*bestRobustStd);
        cutVals(n, 12) = findInterpolatedValue(thresholds, goodRatios, ...
            bestMedian - bestRobustStd);
        cutVals(n, 13) = findInterpolatedValue(thresholds, goodRatios, ...
            bestMedian);
        cutVals(n, 14) = findInterpolatedValue(thresholds, goodRatios, ...
            bestMedian  + bestRobustStd);
        cutVals(n, 15) = findInterpolatedValue(thresholds, goodRatios, ...
            bestMedian + 2*bestRobustStd);
        if (worstMedian + worstRobustStd) <= cutoff && ...
                (bestMedian - bestRobustStd) >= cutoff
            labelColor = [1, 0, 0];
            splitCount = splitCount + 1;
            fprintf('%d: %s split\n', k, blinks(k).fileName);
        elseif bestMedian + bestRobustStd <= cutoff 
            labelColor = [1, 0, 1];
        else
            labelColor = [0, 0, 0];
        end
        propMaskA =  ~indicesNaN & goodMaskBottom & ...
            maxValues >= bestMedian - 2*bestRobustStd & ...
            maxValues <= bestMedian + 2*bestRobustStd;

        %% Now compute the histograms

        if min(worstValues) >= max(bestValues)
            fprintf(fid, ['<p>%d, %s has bad blinks above good blinks: ' ...
                ' xmin: %g xmax: %g</p>\n'], k, thisName, ...
                min(worstValues), max(bestValues));
            continue;
        end
        [n1, x1] = hist(allValues, xhist);
        [n2, x2] = hist(goodValues, xhist);
        [n3, x3] = hist(bestValues, xhist);
        [n4, x4] = hist(maxValues(propMaskA), xhist);
        theTitle =  [num2str(k) ': ' blinks(k).uniqueName ...
            ' Cutoff=' num2str(cutoff) ...
            ' Ch=' num2str(dBlinks.signalIndices(n)) '(' channelLabels{n} ')' ...
            'used=' num2str(dBlinks.usedSignal)]; 

        h = figure('Color', [1, 1, 1], 'Name', theTitle);
        hold on
        [ax, h1, h2] = plotyy(x1, n1, thresholds, goodRatios);% 'Color', [0.85, 0.85, 0.85], 'LineWidth', 2)
        plot(ax(1), x2, n2, 'Color', [0.3, 0.3, 0.85], 'LineWidth', 2, 'LineStyle', '--')
        plot(ax(1), x3, n3, 'Color', [0, 0, 0], 'LineStyle', '-', 'LineWidth', 2)
        plot(ax(1), x4, n4, 'Color', [0.85, 0.3, 0.85], 'LineStyle', '-', 'LineWidth', 2);
        legend('All', 'Good', 'Best', 'PropA','Ratio');
        set(h1, 'Color', [0.3, 0.85, 0.3], 'LineWidth', 2, 'LineStyle', '--')
        set(h2, 'LineStyle', 'None', 'Marker', 'o', 'MarkerSize', 8, ...
               'LineWidth', 2, 'Color', [0, 0, 0]);
        xlabel(ax(1), ['Blink max amplitude [' num2str(min(allValues)) ...
            ', ' num2str(max(allValues)) ']']);
        xlabel(ax(2), '');
        ylabel(ax(1), 'Count')
        ylabel(ax(2), 'Good/All ratio');
        yLimits = get(ax(1), 'YLim');
        gca = ax(1);
        line([cutoff, cutoff], [0, yLimits(2)], 'LineStyle', ...
            '-', 'Color', [0.8, 0.8, 0.8]);
        line([bestMedian, bestMedian], ...
            [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
        line([bestMedian + 2*bestRobustStd, bestMedian + 2*bestRobustStd], ...
            [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
        line([bestMedian - 2*bestRobustStd, bestMedian - 2*bestRobustStd], ...
            [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
        set(ax(2), 'YLim', [0, 1], 'YTick', [0, 0.25, 0.5, 0.75, 1]);
        hold off
        title(theTitle, 'Interpreter', 'None', 'Color', labelColor);
        box on
       
        if dumpWeb
            fileName = [thisName '.png'];
            saveas(gcf, fileName, 'png');
            fprintf(fid, '<p><img src=''%s''  alt=''%s''/></p>\n', fileName, theName);
        else
            fileName = [thisName '.fig'];
            saveas(gcf, fileName, 'fig');
        end

        close(gcf);
    end
    s = baseStruct;
    s.channelLabels = channelLabels;
    s.columnLabels = columnLabels;
    s.cutoffValues = cutVals;
    blinkCutoffs{k} = s;
end
fclose(fid);
fprintf('Number of split files %d\n', splitCount);

%% Save the blinks for future processing
cutoffFile = [experiment 'BlinksNew' type 'BlinkCutoffs.mat'];
save([blinkDir filesep cutoffFile], 'blinkCutoffs', '-v7.3');


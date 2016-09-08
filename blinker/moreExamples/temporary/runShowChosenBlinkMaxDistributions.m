%% Setup
correlationThresholdTop = 0.98;
correlationThresholdBottom = 0.90;
correlationThresholdMiddle = 0.95;
dumpWeb = true;
maxAmp = 600;
baseLevel = 0;

%% BCIT Examples
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNew';
typeBlinks = 'EOGUnrefNewBoth';
typeBlinkProperties = 'EOGUnrefNewBoth';
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
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' typeBlinkProperties '.mat'];
% load([blinkDir filesep blinkFile]);
% load([blinkDir filesep blinkPropertiesFile]);

%% Open the index file
indexFile = [experiment typeBlinks 'maxFrameDist.html'];
if dumpWeb
    fid = fopen(indexFile, 'w');
else
    fid = 1; %#ok<UNRCH>
end
fprintf(fid, '<h1>Experiment %s Type %s</h1>\n', experiment, typeBlinks);
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

for k = 1:length(blinks)
    dBlinks = blinks(k);
    [thePath, theName, theExt] = fileparts(dBlinks.fileName);
    candidates = dBlinks.candidateSignals;
    sIndices = dBlinks.signalIndices;
    if isempty(sIndices) || isnan(dBlinks.usedSignal)
        fprintf('%d: %s has no blinks\n', k, theName);
        continue;
    end
    used = abs(dBlinks.usedSignal);
    thisName = [theName '_Ch' num2str(used)];
    pos = find(sIndices == used, 1, 'first');
    candidateSignal = dBlinks.candidateSignals(pos, :);
    candidatePositions = dBlinks.blinkPositions{pos};
    channelInfo = dBlinks.signalInfo;
    labelPos = find(channelInfo.signalIndices == used);
    channelLabel = channelInfo.signalLabels{labelPos};
    dFitsBase = fitBlinks(candidateSignal, candidatePositions, baseLevel);
    if isempty(dFitsBase)
        fprintf('%d: %s channel %d has no blinks\n', k, theName, dBlinks.signalIndices(n));
        continue;
    end
    maxValues = cellfun(@double, {dFitsBase.maxValue});
    leftR2 = cellfun(@double, {dFitsBase.leftR2});
    rightR2 = cellfun(@double, {dFitsBase.rightR2});
    indicesNaN = isnan(leftR2) | isnan(rightR2) | isnan(maxValues);
    
    goodMaskTop = ~indicesNaN & leftR2 >= correlationThresholdTop & ...
                   rightR2 >= correlationThresholdTop;
    goodMaskBottom = ~indicesNaN & leftR2 >= correlationThresholdBottom & ...
                   rightR2 >= correlationThresholdBottom;
  
    if isempty(goodMaskTop) || isempty(goodMaskBottom)
        fprintf('%d: %s channel %d empty top or bottom mask\n', ...
            k, thisName, dBlinks.usedSignal);
        continue;
    end
    bestValues = maxValues(goodMaskTop & ~indicesNaN);
    worstValues = maxValues(~goodMaskBottom & ~indicesNaN);
    goodValues = maxValues(goodMaskBottom & ~indicesNaN);
    allValues = maxValues(~indicesNaN);
 
    bestMedian = dBlinks.bestMedian(pos);
    bestRobustStd = dBlinks.bestRobustStd(pos);
    upperBest = bestMedian + 3*bestRobustStd;
    xhist = linspace(min(allValues), upperBest, numberThresholds);
    labelColor = [0, 0, 0];
    dFit = blinkFits{k};
    usedValues = cellfun(@double, {dFit.maxValue});
    usedValues(isnan(usedValues)) = [];
    %% Now compute the histograms
    [n1, x1] = hist(allValues, xhist);
    [n2, x2] = hist(goodValues, xhist);
    [n3, x3] = hist(bestValues, xhist);
    [n4, x4] = hist(usedValues, xhist);
    theTitle =  [num2str(k) ': ' blinks(k).uniqueName ...
        ' Ratio=' num2str(dBlinks.goodRatios(pos)) ...
        ' Ch=' num2str(dBlinks.usedSignal) ' (' channelLabel ')'];
    
      figure('Color', [1, 1, 1], 'Name', theTitle);
        hold on
        h = plot(x1, n1, 'Color', [0.3, 0.85, 0.3], 'LineWidth', 3, 'LineStyle', '-');
     
        plot(x2, n2, 'Color', [0.3, 0.3, 0.85], 'LineWidth', 3, 'LineStyle', '-')
        plot(x3, n3, 'Color', [0, 0, 0], 'LineStyle', '-', 'LineWidth', 2)
        plot(x4, n4, 'Color', [0.85, 0.3, 0.85], 'LineStyle', '-', 'LineWidth', 2);
 
        yLimits = get(gca, 'YLim');
        line([bestMedian, bestMedian], ...
            [0, yLimits(2)], 'LineStyle', '-', 'Color', [0.6, 0.6, 0.85]);
        line([bestMedian + 2*bestRobustStd, bestMedian + 2*bestRobustStd], ...
            [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
        line([bestMedian - 2*bestRobustStd, bestMedian - 2*bestRobustStd], ...
            [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
        hold off
               legend('All', 'Good', 'Best', 'Used');
       
        xlabel(['Blink max amplitude [' num2str(min(allValues)) ...
            ', ' num2str(max(allValues)) ']']);
 
        ylabel('Count')
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
    
    %close(gcf);
    
end
if dumpWeb
   fclose(fid);
end



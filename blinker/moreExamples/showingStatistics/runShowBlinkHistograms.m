%% Show blink histograms
numExp = 4;
theColors = [0.7, 0.7, 0.7; 0.5, 0.5, 0.5; 0, 1, 0; 0, 0, 1];
theShapes = {'o', 's', 'x', '^'};
experiments(numExp) = struct('experiment', [], 'blinkDir', [], ...
                             'type', [], 'blinkHistograms', [], ...
                             'goodBlinkHistograms', []);

experiments(1).experiment = 'BCITLevel0';
experiments(1).blinkDir = 'O:\ARL_Data\BCITBlinks';
experiments(1).type = 'ChannelUnref';
experiments(1).excludeTasks = {};
experiments(2).experiment = 'BCI2000';
experiments(2).blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
experiments(2).type = 'Channel';
experiments(2).excludeTasks = {'EyesOpen', 'EyesClosed'};
experiments(3).experiment = 'NCTU_LK';
experiments(3).blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
experiments(3).type = 'Channel';
experiments(3).excludeTasks = {};
experiments(4).experiment = 'Shooter';
experiments(4).blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
experiments(4).type = 'ChannelUnref';
experiments(4).excludeTasks = {'EC', 'EO'};

%% Read in the occular indices for these collections
expOIndices = cell(numExp, 1);
for k = 1:numExp
   blinkHistogramFile = [experiments(k).blinkDir filesep ...
                     experiments(k).experiment 'BlinksNewHistograms' ...
                       experiments(k).type '.mat'];
   if ~exist(blinkHistogramFile, 'file')
      continue;
   end
   load( blinkHistogramFile);
   experiments(k).blinkHistograms = blinkHistograms;
   experiments(k).goodBlinkHistograms = goodBlinkHistograms;
end

%% Get the masks
theFields = fieldnames(blinkHistograms);
numFields = length(theFields);
for k = 1:numFields
    theTitle = [theFields{k} ' all blinks'];
    figure('Name', theTitle, 'Color', [1, 1, 1])
    hold on
    legendStrings = cell(1, numExp);
    numLegends = 0;
    for n = 1:numExp
        hists = experiments(n).blinkHistograms;
        if ~isstruct(hists)
            continue;
        elseif isempty(hists)
            continue;
        end
        numLegends = numLegends + 1;
        legendStrings{numLegends} = experiments(n).experiment;
        centers = hists.(theFields{k}).binCenters;
        counts = hists.(theFields{k}).binCounts;
        plot(centers, counts/sum(counts), 'Color', theColors(n, :), ...
            'LineWidth', 2);
    end
    hold off
    xlabel(theFields{k});
    ylabel('Fraction');
    title(theTitle)
    legend(legendStrings(1:numLegends), 'Interpreter', 'None')
    box on
    
    theTitle = [theFields{k} ' prototypical blinks'];
    figure('Name', theTitle, 'Color', [1, 1, 1])
    hold on
    numLegends = 0;
    legendStrings = cell(1, numExp);
    for n = 1:numExp
        histsGood = experiments(n).goodBlinkHistograms;
        if ~isstruct(histsGood )
            continue;
        elseif isempty(histsGood )
            continue;
        end
        numLegends = numLegends + 1;
        legendStrings{numLegends} = experiments(n).experiment;
        centersGood = histsGood.(theFields{k}).binCenters;
        countsGood = histsGood.(theFields{k}).binCounts;
        plot(centersGood , countsGood /sum(countsGood ), 'Color', theColors(n, :), ...
            'LineWidth', 2);
    end
    hold off
    xlabel(theFields{k});
    ylabel('Fraction');
    title(theTitle)
    legend(legendStrings(1:numLegends), 'Interpreter', 'None')
    box on
    
    theTitle = [theFields{k} ' combined overlays'];
    figure('Name', theTitle, 'Color', [1, 1, 1])
    hold on
    legendStrings = cell(1, 2*numExp);
    numLegends = 0;
    for n = 1:numExp
        histsGood = experiments(n).goodBlinkHistograms;
        hists = experiments(n).blinkHistograms;
        if ~isstruct(hists) || ~isstruct(histsGood)
            continue;
        elseif isempty(hists) || isempty(histsGood)
            continue;
        end
        numLegends = numLegends + 1;
        legendStrings{numLegends} = [experiments(n).experiment '-all']; 
        numLegends = numLegends + 1;
        legendStrings{numLegends} = [experiments(n).experiment '-good']; 
        centers = hists.(theFields{k}).binCenters;
        counts = hists.(theFields{k}).binCounts;
        plot(centers, counts/sum(counts), 'Color', theColors(n, :), ...
            'LineWidth', 2);
        centersGood = histsGood.(theFields{k}).binCenters;
        countsGood = histsGood.(theFields{k}).binCounts;
        plot(centersGood, countsGood/sum(countsGood), 'Color', theColors(n, :), ...
            'LineWidth', 2, 'LineStyle', '--');
    end
    hold off
    xlabel(theFields{k});
    ylabel('Fraction');
    title(theTitle)
    legend(legendStrings(1:numLegends), 'Interpreter', 'None')
    box on
end 

%% Compute the totals
counts = 0;
countsGood = 0;
for n = 1:numExp
    x = sum(experiments(n).blinkHistograms.pAVRZ.binCounts);
    xGood = sum(experiments(n).goodBlinkHistograms.pAVRZ.binCounts);
    fprintf('Experiment %s: %d blinks,  %d good blinks\n', ...
        experiments(n).experiment, x, xGood);
    counts = counts + x;
    countsGood = countsGood + xGood;
end
fprintf('Total blinks: %d, good blinks %d\n', counts, countsGood);


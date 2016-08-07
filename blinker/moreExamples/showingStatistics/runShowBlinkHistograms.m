%% Show blink histograms
numExp = 4;
theColors = [0.7, 0.7, 0.7; 0.5, 0.5, 0.5; 0, 1, 0; 0, 0, 1];
theShapes = {'o', 's', 'x', '^'};
experiments(numExp) = struct('experiment', [], 'blinkDir', [], ...
    'type', [], 'excludeTasks', [],'blinkHistograms', []);

experiments(1).experiment = 'BCITLevel0';
experiments(1).blinkDir = 'O:\ARL_Data\BCITBlinksNew';
experiments(1).type = 'ChannelUnrefNewBoth';
experiments(1).excludeTasks = {};
experiments(2).experiment = 'BCI2000';
experiments(2).blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
experiments(2).type = 'ChannelMastNewBothCombined';
experiments(2).excludeTasks = {'EyesOpen', 'EyesClosed'};
experiments(3).experiment = 'NCTU_LK';
experiments(3).blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
experiments(3).type = 'ChannelMastNewBoth';
experiments(3).excludeTasks = {};
experiments(4).experiment = 'Shooter';
experiments(4).blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
experiments(4).type = 'ChannelUnrefNewBothCombined';
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
 
    hold off
    xlabel(theFields{k});
    ylabel('Fraction');
    title(theTitle)
    legend(legendStrings(1:numLegends), 'Interpreter', 'None')
    box on
end


%% Compute the totals
counts = 0;
for n = 1:numExp
    x = sum(experiments(n).blinkHistograms.pAVRZ.binCounts);
    fprintf('Experiment %s: %d blinks\n', experiments(n).experiment, x);
    counts = counts + x;
end
fprintf('Total blinks: %d%d\n', counts);


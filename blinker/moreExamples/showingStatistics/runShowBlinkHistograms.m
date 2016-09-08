numExp = 4;
experiments = cell(numExp, 1);
experiments{1} = ['O:\ARL_Data\BCITBlinksNewRefactored' filesep ...
                  'BCITLevel0AllUnrefNewBothBlinksHistograms.mat']; 
experiments{2} = ['O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored' filesep ...
                  'BCI2000AllMastNewBothCombinedHistograms.mat'];
experiments{3} = ['O:\ARL_Data\NCTU\NCTUBlinksNewRefactored' filesep ...
                  'NCTU_LKAllMastNewBothHistograms.mat'];
experiments{4} = ['O:\ARL_Data\Shooter\ShooterBlinksNewRefactored' filesep ...
                  'ShooterAllMastNewBothCombinedHistograms.mat'];
experimentNames = {'ARL-BCIT', 'BCI-2000', 'NCTU-LK', 'ARL-Shoot'};

%% Show blink histograms
numExp = 4;
theColors = [0.7, 0.7, 0.7; 0.5, 0.5, 0.5; 0, 1, 0; 0, 0, 1];
theShapes = {'o', 's', 'x', '^'};

%% Read in the occular indices for these collections
theHistograms = cell(numExp, 1);
for k = 1:numExp
    load(experiments{k});
    theHistograms{k} = blinkHistograms;
end

%% Get the masks
theFields = {blinkHistograms.name};
numFields = length(theFields);
for k = 1:numFields
    theTitle = [theFields{k} ' all blinks'];
    figure('Name', theTitle, 'Color', [1, 1, 1])
    hold on
    legendStrings = cell(1, numExp);
    numLegends = 0;
    limits = [inf, -inf];
    for n = 1:numExp
        hists = theHistograms{n}(k);
        numLegends = numLegends + 1;
        legendStrings{numLegends} = experimentNames{n};
        centers = hists.binCenters;
        counts = hists.binCounts;
        plot(centers, counts/sum(counts), 'Color', theColors(n, :), ...
            'LineWidth', 2);
        limits(1) = min(limits(1), hists.limits(1));
        limits(2) = max(limits(2), hists.limits(2));
    end
    set(gca, 'XLim', limits);
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
% counts = 0;
% for n = 1:numExp
%     x = sum(experiments(n).blinkHistograms.pAVRZ.binCounts);
%     fprintf('Experiment %s: %d blinks\n', experiments(n).experiment, x);
%     counts = counts + x;
% end
% fprintf('Total blinks: %d%d\n', counts);


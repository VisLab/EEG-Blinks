%% Show normplots of means of different ocular indices 
% Assumes that the blink summary file has been extracted for the collection

%% Set up to read in the summary files for the figure
numExp = 4;
experiments(numExp) = struct('experiment', nan, 'summaryDir', nan, ...
                             'summaryFile', nan, 'blinkSummary', nan);
for k = 1:numExp
    experiments(k) = experiments(numExp);
end
experiments(1).experiment = 'ARL-BCIT';
experiments(1).summaryDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
experiments(1).summaryFile = 'BCITLevel0AllUnrefNewBothBlinksSummary.mat';
experiments(2).experiment = 'BCI-2000';
experiments(2).summaryDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
experiments(2).summaryFile = 'BCI2000AllMastNewBothCombinedSummary.mat';
experiments(3).experiment = 'NCTU-LK';
experiments(3).summaryDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
experiments(3).summaryFile = 'NCTU_LKAllMastNewBothSummary.mat';
experiments(4).experiment = 'ARL-Shoot';
experiments(4).summaryDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
experiments(4).summaryFile = 'ShooterAllMastNewBothCombinedSummary.mat';

%% Load the summary files
for k = 1:numExp
    clear blinkSummary;
    load([experiments(k).summaryDir filesep experiments(k).summaryFile]);
    experiments(k).blinkSummary = blinkSummary;
end

%% Set up the colors for the different datasets
theColors = [0.7, 0.7, 0.7; 0.5, 0.5, 0.5; 0, 1, 0; 0, 0, 1];

%% Create a composite normplot of blink half-zero duration
theHandlesHZ = cell(numExp, 1);
legendHandlesHZ = zeros(1, numExp);
legendEntriesHZ = cell(1, numExp);
theTitle = 'Half zero blink duration';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationHZ = getSummaryValues(experiments(k).blinkSummary, 'durationHZ', 1);
   theHandlesHZ{k} = normplot(durationHZ);
   set(theHandlesHZ{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesHZ{k}(2), 'LineWidth', 2);
   set(theHandlesHZ{k}(3), 'LineWidth', 2);
   legendHandlesHZ(k) = theHandlesHZ{k}(1);
   legendEntriesHZ{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Duration (s) for blinks')
legend(legendHandlesHZ, legendEntriesHZ, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

% %% Blink duration
% theHandlesGHZ = cell(numExp, 1);
% legendHandlesGHZ = zeros(1, numExp);
% legendEntriesGHZ = cell(1, numExp);
% theTitle = 'Half zero blink duration prototypical';
% figure ('Color', [1, 1, 1], 'Name', theTitle)
% hold on
% for k = 1:numExp
%    durationHZ = getSummaryValues(experiment{k}, 'durationHZ', 1);
%    theHandlesGHZ{k} = normplot(durationHZ);
%    set(theHandlesGHZ{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesGHZ{k}(2), 'LineWidth', 2);
%    set(theHandlesGHZ{k}(3), 'LineWidth', 2);
%    legendHandlesGHZ(k) = theHandlesGHZ{k}(1);
%    legendEntriesGHZ{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('Duration (s) for prototypical blinks')
% legend(legendHandlesGHZ, legendEntriesGHZ, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% set(gca, 'XLim', [0.05, 0.35])
% title(theTitle);
% %% Blink duration
% theHandlesHB = cell(numExp, 1);
% legendHandlesHB = zeros(1, numExp);
% legendEntriesHB = cell(1, numExp);
% theTitle = 'Half-base duration all blinks';
% figure ('Color', [1, 1, 1], 'Name', theTitle)
% hold on
% for k = 1:numExp
%    durationHB = experiments(k).durationHB(:, 1);
%    theHandlesHB{k} = normplot(durationHB);
%    set(theHandlesHB{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesHB{k}(2), 'LineWidth', 2);
%    set(theHandlesHB{k}(3), 'LineWidth', 2);
%    legendHandlesHB(k) = theHandlesHB{k}(1);
%    legendEntriesHB{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('Blink duration (s)')
% legend(legendHandlesHB, legendEntriesHB, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% set(gca, 'XLim', [0.05, 0.35])
% title(theTitle);

% %% Blink duration 
% theHandlesGHB = cell(numExp, 1);
% legendHandlesGHB = zeros(1, numExp);
% legendEntriesGHB = cell(1, numExp);
% theTitle = 'Half base blink duration prototypical';
% figure ('Color', [1, 1, 1], 'Name', theTitle)
% hold on
% for k = 1:numExp
%    durationGHB = experiments(k).durationHB(:, 3);
%    theHandlesGHB{k} = normplot(durationGHB);
%    set(theHandlesGHB{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesGHB{k}(2), 'LineWidth', 2);
%    set(theHandlesGHB{k}(3), 'LineWidth', 2);
%    legendHandlesGHB(k) = theHandlesGHB{k}(1);
%    legendEntriesGHB{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('Duration (s) for prototypical blinks')
% legend(legendHandlesGHB, legendEntriesGHB, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% set(gca, 'XLim', [0.05, 0.35])
% title(theTitle);

% %% Blink duration
% theHandlesHB = cell(numExp, 1);
% legendHandlesHB = zeros(1, numExp);
% legendEntriesHB = cell(1, numExp);
% theTitle = 'Half-base duration all blinks';
% figure ('Color', [1, 1, 1], 'Name', theTitle)
% hold on
% for k = 1:numExp
%    durationHB = experiments(k).durationHB(:, 1);
%    theHandlesHB{k} = normplot(durationHB);
%    set(theHandlesHB{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesHB{k}(2), 'LineWidth', 2);
%    set(theHandlesHB{k}(3), 'LineWidth', 2);
%    legendHandlesHB(k) = theHandlesHB{k}(1);
%    legendEntriesHB{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('Blink duration (s)')
% legend(legendHandlesHB, legendEntriesHB, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% set(gca, 'XLim', [0.05, 0.35])
% title(theTitle);
% 
% %% Blink aPVZ
% theHandlesP = cell(numExp, 1);
% legendHandlesP = zeros(1, numExp);
% legendEntriesP = cell(1, numExp);
% figure ('Color', [1, 1, 1])
% hold on
% for k = 1:numExp
%    pAVRZ = experiments(k).pAVRZ(:, 1);
%    theHandlesP{k} = normplot(pAVRZ);
%    set(theHandlesP{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesP{k}(2), 'LineWidth', 2);
%    set(theHandlesP{k}(3), 'LineWidth', 2);
%    legendHandlesP(k) = theHandlesP{k}(1);
%    legendEntriesP{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('pAVRZ')
% legend(legendHandlesP, legendEntriesP, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% %% Blink aPVZ
% theHandlesGP = cell(numExp, 1);
% legendHandlesGP = zeros(1, numExp);
% legendEntriesGP = cell(1, numExp);
% figure ('Color', [1, 1, 1])
% hold on
% for k = 1:numExp
%    pAVRZ = experiments(k).pAVRZ(:, 3);
%    theHandlesGP{k} = normplot(pAVRZ);
%    set(theHandlesGP{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesGP{k}(2), 'LineWidth', 2);
%    set(theHandlesGP{k}(3), 'LineWidth', 2);
%    legendHandlesGP(k) = theHandlesGP{k}(1);
%    legendEntriesGP{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('pAVRZ for prototypical blinks')
% legend(legendHandlesGP, legendEntriesGP, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% 
% %% Blink nPVZ
% theHandlesN = cell(numExp, 1);
% legendHandlesN = zeros(1, numExp);
% legendEntriesN = cell(1, numExp);
% figure ('Color', [1, 1, 1])
% hold on
% for k = 1:numExp
%    nAVRZ = experiments(k).nAVRZ(:, 1);
%    theHandlesN{k} = normplot(nAVRZ);
%    set(theHandlesN{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesN{k}(2), 'LineWidth', 2);
%    set(theHandlesN{k}(3), 'LineWidth', 2);
%    legendHandlesN(k) = theHandlesN{k}(1);
%    legendEntriesN{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('nAVRZ')
% legend(legendHandlesN, legendEntriesN, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
%   
% %% Good blink nPVZ
% theHandlesGN = cell(numExp, 1);
% legendHandlesGN = zeros(1, numExp);
% legendEntriesGN = cell(1, numExp);
% figure ('Color', [1, 1, 1])
% hold on
% for k = 1:numExp
%    nAVRZ = experiments(k).nAVRZ(:, 3);
%    theHandlesGN{k} = normplot(nAVRZ);
%    set(theHandlesGN{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesGN{k}(2), 'LineWidth', 2);
%    set(theHandlesGN{k}(3), 'LineWidth', 2);
%    legendHandlesGN(k) = theHandlesGN{k}(1);
%    legendEntriesGN{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('nAVRZ for prototypical blinks')
% legend(legendHandlesGN, legendEntriesGN, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% 
%%
% theTitle = 'Blinks per minute';
% figure ('Color', [1, 1, 1], 'Name', theTitle)
% hold on
% for k = 1:numExp
%    blinksPerMin = experiments(k).blinksPerMin(:, 1);
%    theHandlesB{k} = normplot(blinksPerMin);
%    set(theHandlesB{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesB{k}(2), 'LineWidth', 1);
%    set(theHandlesB{k}(3), 'LineWidth', 1);
%    legendHandlesB(k) = theHandlesB{k}(1);
%    legendEntriesB{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('Blinks/min')
% legend(legendHandlesB, legendEntriesB, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% title(theTitle);
% 
% %% Good blinks/min
% theTitle = 'Blinks per minute prototypical blinks';
% theHandlesGB = cell(numExp, 1);
% legendHandlesGB = zeros(1, numExp);
% legendEntriesGB = cell(1, numExp);
% figure ('Color', [1, 1, 1], 'Name', theTitle)
% hold on
% for k = 1:numExp
%    blinksPerMin = experiments(k).blinksPerMin(:, 3);
%    theHandlesGB{k} = normplot(blinksPerMin);
%    set(theHandlesGB{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesGB{k}(2), 'LineWidth', 1);
%    set(theHandlesGB{k}(3), 'LineWidth', 1);
%    legendHandlesGB(k) = theHandlesGB{k}(1);
%    legendEntriesGB{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('Prototypical blinks/min')
% legend(legendHandlesGB, legendEntriesGB, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% title(theTitle);
% 
% 
% %% Blink duration
% theHandlesGHB = cell(numExp, 1);
% legendHandlesGHB = zeros(1, numExp);
% legendEntriesGHB = cell(1, numExp);
% theTitle = 'Half base blink duration prototypical';
% figure ('Color', [1, 1, 1], 'Name', theTitle)
% hold on
% for k = 1:numExp
%    durationGHB = experiments(k).durationHB(:, 3);
%    theHandlesGHB{k} = normplot(durationGHB);
%    set(theHandlesGHB{k}(1), 'MarkerSize', 8, ...
%        'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
%    set(theHandlesGHB{k}(2), 'LineWidth', 2);
%    set(theHandlesGHB{k}(3), 'LineWidth', 2);
%    legendHandlesGHB(k) = theHandlesGHB{k}(1);
%    legendEntriesGHB{k} = experiments(k).experiment;
% end
% hold off
% box on
% xlabel('Duration (s) for prototypical blinks')
% legend(legendHandlesGHB, legendEntriesGHB, 'Location', 'SouthEast', ...
%       'Interpreter', 'None')
% set(gca, 'XLim', [0.05, 0.35])
% title(theTitle);
% 

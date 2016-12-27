%% Show normplots of means of different ocular indices 
% Assumes that the blink summary file has been extracted for the collection
%
%
% BLINKER extracts blinks and ocular indices from time series. 
% Copyright (C) 2016  Kay A. Robbins, Kelly Kleifgas, UTSA
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% Set up the list of files for VEP and shooter
experimentNames = {'vep'; 'shooter'};
summaryFiles = ...
    {'O:\ARL_Data\VEP\BlinkOutput\vep_oddball_ALLUnRef_summary.mat'; ...
    'O:\ARL_Data\Shooter\BlinkOutput\shooter_AllMastRefCombined_summary.mat'};

%% Set up the
numExp = length(summaryFiles);
experiments(numExp) = struct('experiment', nan, 'summaryFile', nan, ...
                              'blinkSummary', nan);
%% Load the summary files
for k = 1:numExp
    clear blinkStatisticsSummary;
    load(summaryFiles{k});
    experiments(k) = experiments(end);
    experiments(k).blinkSummary = blinkStatisticsSummary;
    experiments(k).experiment = experimentNames{k};
    experiments(k).summaryFile = summaryFiles{k};
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
xlabel('Blink duration(s)')
legend(legendHandlesHZ, legendEntriesHZ, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration half zero prototypical
theHandlesGHZ = cell(numExp, 1);
legendHandlesGHZ = zeros(1, numExp);
legendEntriesGHZ = cell(1, numExp);
theTitle = 'Half zero blink duration prototypical';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationGHZ = getSummaryValues(experiments(k).blinkSummary, 'durationHZ', 5);
   theHandlesGHZ{k} = normplot(durationGHZ);
   set(theHandlesGHZ{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGHZ{k}(2), 'LineWidth', 2);
   set(theHandlesGHZ{k}(3), 'LineWidth', 2);
   legendHandlesGHZ(k) = theHandlesGHZ{k}(1);
   legendEntriesGHZ{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Duration (s) for prototypical blinks')
legend(legendHandlesGHZ, legendEntriesGHZ, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration half base
theHandlesHB = cell(numExp, 1);
legendHandlesHB = zeros(1, numExp);
legendEntriesHB = cell(1, numExp);
theTitle = 'Half-base duration all blinks';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationHB = getSummaryValues(experiments(k).blinkSummary, 'durationHB', 1);
   theHandlesHB{k} = normplot(durationHB);
   set(theHandlesHB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesHB{k}(2), 'LineWidth', 2);
   set(theHandlesHB{k}(3), 'LineWidth', 2);
   legendHandlesHB(k) = theHandlesHB{k}(1);
   legendEntriesHB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesHB, legendEntriesHB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration half base prototypical
theHandlesGHB = cell(numExp, 1);
legendHandlesGHB = zeros(1, numExp);
legendEntriesGHB = cell(1, numExp);
theTitle = 'Half base blink duration prototypical';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationGHB = getSummaryValues(experiments(k).blinkSummary, 'durationHB', 5);
   theHandlesGHB{k} = normplot(durationGHB);
   set(theHandlesGHB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGHB{k}(2), 'LineWidth', 2);
   set(theHandlesGHB{k}(3), 'LineWidth', 2);
   legendHandlesGHB(k) = theHandlesGHB{k}(1);
   legendEntriesGHB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesGHB, legendEntriesGHB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration base
theHandlesB = cell(numExp, 1);
legendHandlesB = zeros(1, numExp);
legendEntriesB = cell(1, numExp);
theTitle = 'Base duration all blinks';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationB = getSummaryValues(experiments(k).blinkSummary, 'durationB', 1);   
   theHandlesB{k} = normplot(durationB);
   set(theHandlesB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesB{k}(2), 'LineWidth', 2);
   set(theHandlesB{k}(3), 'LineWidth', 2);
   legendHandlesB(k) = theHandlesB{k}(1);
   legendEntriesB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesB, legendEntriesB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration base prototypical
theHandlesGB = cell(numExp, 1);
legendHandlesGB = zeros(1, numExp);
legendEntriesGB = cell(1, numExp);
theTitle = 'Base duration prototypical blinks';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationGB = getSummaryValues(experiments(k).blinkSummary, 'durationB', 5);   
   theHandlesGB{k} = normplot(durationGB);
   set(theHandlesGB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGB{k}(2), 'LineWidth', 2);
   set(theHandlesGB{k}(3), 'LineWidth', 2);
   legendHandlesGB(k) = theHandlesGB{k}(1);
   legendEntriesGB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesGB, legendEntriesGB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink zero duration
theHandlesZ = cell(numExp, 1);
legendHandlesZ = zeros(1, numExp);
legendEntriesZ = cell(1, numExp);
theTitle = 'Zero duration all blinks';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationZ = getSummaryValues(experiments(k).blinkSummary, 'durationZ', 1);   
   theHandlesZ{k} = normplot(durationZ);
   set(theHandlesZ{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesZ{k}(2), 'LineWidth', 2);
   set(theHandlesZ{k}(3), 'LineWidth', 2);
   legendHandlesZ(k) = theHandlesZ{k}(1);
   legendEntriesZ{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesZ, legendEntriesZ, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration base prototypical
theHandlesGZ = cell(numExp, 1);
legendHandlesGZ = zeros(1, numExp);
legendEntriesGZ = cell(1, numExp);
theTitle = 'Zero duration prototypical blinks';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationGZ = getSummaryValues(experiments(k).blinkSummary, 'durationZ', 5);   
   theHandlesGZ{k} = normplot(durationGZ);
   set(theHandlesGZ{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGZ{k}(2), 'LineWidth', 2);
   set(theHandlesGZ{k}(3), 'LineWidth', 2);
   legendHandlesGZ(k) = theHandlesGZ{k}(1);
   legendEntriesGZ{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesGZ, legendEntriesGZ, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration tent
theHandlesT = cell(numExp, 1);
legendHandlesT = zeros(1, numExp);
legendEntriesT = cell(1, numExp);
theTitle = 'Tent duration all blinks';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationT = getSummaryValues(experiments(k).blinkSummary, 'durationB', 1);   
   theHandlesT{k} = normplot(durationT);
   set(theHandlesT{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesT{k}(2), 'LineWidth', 2);
   set(theHandlesT{k}(3), 'LineWidth', 2);
   legendHandlesT(k) = theHandlesT{k}(1);
   legendEntriesT{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesT, legendEntriesT, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink duration tent prototypical
theHandlesGT = cell(numExp, 1);
legendHandlesGT = zeros(1, numExp);
legendEntriesGT = cell(1, numExp);
theTitle = 'Tent duration prototypical blinks';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   durationGT = getSummaryValues(experiments(k).blinkSummary, 'durationT', 5);   
   theHandlesGT{k} = normplot(durationGT);
   set(theHandlesGT{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGT{k}(2), 'LineWidth', 2);
   set(theHandlesGT{k}(3), 'LineWidth', 2);
   legendHandlesGT(k) = theHandlesGT{k}(1);
   legendEntriesGT{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesGT, legendEntriesGT, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%set(gca, 'XLim', [0.05, 0.35])
title(theTitle);

%% Blink aPVZ
theHandlesP = cell(numExp, 1);
legendHandlesP = zeros(1, numExp);
legendEntriesP = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   pAVRZ = getSummaryValues(experiments(k).blinkSummary, 'pAVRZ', 1);
   theHandlesP{k} = normplot(pAVRZ);
   set(theHandlesP{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesP{k}(2), 'LineWidth', 2);
   set(theHandlesP{k}(3), 'LineWidth', 2);
   legendHandlesP(k) = theHandlesP{k}(1);
   legendEntriesP{k} = experiments(k).experiment;
end
hold off
box on
xlabel('pAVRZ')
title('pAVR zero baseline all blinks')
legend(legendHandlesP, legendEntriesP, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%% Blink pAVZ prototypical
theHandlesGP = cell(numExp, 1);
legendHandlesGP = zeros(1, numExp);
legendEntriesGP = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   pAVRZG = getSummaryValues(experiments(k).blinkSummary, 'pAVRZ', 5);
   theHandlesGP{k} = normplot(pAVRZG);
   set(theHandlesGP{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGP{k}(2), 'LineWidth', 2);
   set(theHandlesGP{k}(3), 'LineWidth', 2);
   legendHandlesGP(k) = theHandlesGP{k}(1);
   legendEntriesGP{k} = experiments(k).experiment;
end
hold off
box on
xlabel('pAVRZ')
title('Positive AVR zero baseline for prototypical blinks');
legend(legendHandlesGP, legendEntriesGP, 'Location', 'SouthEast', ...
      'Interpreter', 'None')

%% Blink nPVZ
theHandlesN = cell(numExp, 1);
legendHandlesN = zeros(1, numExp);
legendEntriesN = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   nAVRZ = getSummaryValues(experiments(k).blinkSummary, 'nAVRZ', 1);
   theHandlesN{k} = normplot(nAVRZ);
   set(theHandlesN{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesN{k}(2), 'LineWidth', 2);
   set(theHandlesN{k}(3), 'LineWidth', 2);
   legendHandlesN(k) = theHandlesN{k}(1);
   legendEntriesN{k} = experiments(k).experiment;
end
hold off
box on
title('Negative AVR zero baseline all blinks')
xlabel('nAVRZ')
legend(legendHandlesN, legendEntriesN, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
  
%% Good blink nAVZ
theHandlesGN = cell(numExp, 1);
legendHandlesGN = zeros(1, numExp);
legendEntriesGN = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   nAVRZG = getSummaryValues(experiments(k).blinkSummary, 'nAVRZ', 5);
   theHandlesGN{k} = normplot(nAVRZG);
   set(theHandlesGN{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGN{k}(2), 'LineWidth', 2);
   set(theHandlesGN{k}(3), 'LineWidth', 2);
   legendHandlesGN(k) = theHandlesGN{k}(1);
   legendEntriesGN{k} = experiments(k).experiment;
end
hold off
box on
title ('Negative AVR zero baseline for prototypical blinks');
xlabel('nAVRZ')
legend(legendHandlesGN, legendEntriesGN, 'Location', 'SouthEast', ...
      'Interpreter', 'None')

%% Blinks per min
theHandlesBM = cell(numExp, 1);
legendHandlesBM = zeros(numExp, 1);
legendEntriesBM = cell(numExp, 1);
theTitle = 'Blinks per minute';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   blinksPerMin = getSummaryValues(experiments(k).blinkSummary, 'blinksPerMin', 1);
   theHandlesBM{k} = normplot(blinksPerMin);
   set(theHandlesBM{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesBM{k}(2), 'LineWidth', 2);
   set(theHandlesBM{k}(3), 'LineWidth', 2);
   legendHandlesBM(k) = theHandlesBM{k}(1);
   legendEntriesBM{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blinks/min')
legend(legendHandlesBM, legendEntriesBM, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
title(theTitle);


%% Blinks per min
theHandlesBMG = cell(numExp, 1);
legendHandlesBMG = zeros(numExp, 1);
legendEntriesBMG = cell(numExp, 1);
theTitle = 'Prototypical blinks per minute';
figure ('Color', [1, 1, 1], 'Name', theTitle)
hold on
for k = 1:numExp
   blinksPerMinG = getSummaryValues(experiments(k).blinkSummary, 'blinksPerMin', 5);
   theHandlesBMG{k} = normplot(blinksPerMinG);
   set(theHandlesBMG{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesBMG{k}(2), 'LineWidth', 2);
   set(theHandlesBMG{k}(3), 'LineWidth', 2);
   legendHandlesBMG(k) = theHandlesBMG{k}(1);
   legendEntriesBMG{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blinks/min')
legend(legendHandlesBMG, legendEntriesBMG, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
title(theTitle);

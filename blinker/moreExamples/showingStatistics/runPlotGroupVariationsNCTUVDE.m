% Show plots of the indicators in different groups for the shooter data
% This script produced Figure 4 of the paper

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

%% NCTU_RWN_VDE
experiment = 'NCTU_RWN_VDE';
blinkDir = 'J:\CTAData\NCTU_RWN_VDE\Blinks';
blinkDirInd = [blinkDir filesep 'AllMastRefCombinedWithDate'];
typeBlinks = 'AllMastRefCombined';
summaryFile = 'NCTU_RWN_VDE_AllMastRefCombinedWithDate_summary.mat';
excludedTasks = {'Pre_EXP_resting', 'Post_EXP_resting'};
blinkFileList = [blinkDir filesep experiment '_blinkFileList.mat'];
taskTypes = {'PVT', 'LKT', 'DAS_High', 'DAS_Low'};
excludedGroups = {};

%% Load the summary file
load([blinkDir filesep summaryFile]);

%% Set up the groups
srate = cellfun(@double, {blinkStatisticsSummary.srate});
componentValid = ~isnan(srate);

%% Extract the subject IDs and tasks
blinkStatisticsSummary = blinkStatisticsSummary(componentValid);
subjects = {blinkStatisticsSummary.subjectID};
tasks = {blinkStatisticsSummary.task};
used = cellfun(@double, {blinkStatisticsSummary.usedNumber});
uniqueNames = {blinkStatisticsSummary.uniqueName};
uniqueSubjects = unique(subjects);

%% Extract the fatigue levels
fatigueLevels = cell(size(subjects));
for k = 1:length(subjects)
    pieces = strsplit(uniqueNames{k}, '_');
    if sum(strcmpi(pieces, 'HighFatigue')) > 0
        fatigueLevels{k} = 'High';
    elseif sum(strcmpi(pieces, 'Normal')) > 0
        fatigueLevels{k} = 'Normal';
    elseif sum(strcmpi(pieces, 'LowFatigue')) > 0
        fatigueLevels{k} = 'Low'; 
    else
        fatigueLevels{k} = 'Unknown';
        warning('%d: %s does not have a correct fatigue level', k, uniqueNames{k});
    end
end

%% Calculate masks for excluded tasks
tasksExcluded = false(size(tasks));
if ~isempty(excludedTasks)
    for k = 1:length(tasks)
        if strcmpi(excludedTasks, tasks{k})
            tasksExcluded(k) = true;
        end
    end
end
%% Load the summary file
load([blinkDir filesep summaryFile]);

%% Set up the groups


%% Initialize the structures
baseStruct = struct('occularIndex', NaN, 'aNovaType', NaN, ...
                    'p', NaN, 'pTable', NaN, 'pStats', NaN);
indicatorType = {'pAVRZ', 'nAVRZ', 'durationZ', 'durationHB', 'durationHZ', 'blinksPerMin'};
numAnovaVariations = 9;
pValues = cell(length(indicatorType), numAnovaVariations);  % 6 variations of anova

indicatorBase = cellfun(@double, {blinkStatisticsSummary.srate});
newStatistics = blinkStatisticsSummary(~isnan(indicatorBase));
for k = 1%:length(indicatorType)
    fprintf('Indicator %d: %s\n', k, indicatorType{k});
    subjectInd = ['subject' indicatorType{k}];
    
    indicatorBase = {newStatistics.(indicatorType{k})};
    theseIndicators = nan(length(indicatorBase), 1);
    for m = 1:length(theseIndicators)
       theseIndicators(m) = indicatorBase{m}(1);
    end
    
    %% Compute subject subtraction and division scaling
    indicatorsSub = theseIndicators;
    indicatorsDiv = theseIndicators;
   
    for s = 1:length(uniqueSubjects)
        thisSubject = uniqueSubjects{s};
        fatigueMask = strcmpi(fatigueLevels, 'Normal');
        thisIndex = strcmpi(subjects, thisSubject);
        thisAverage = mean(theseIndicators(thisIndex & fatigueMask));
        indicatorsSub(thisIndex) = indicatorsSub(thisIndex) - thisAverage;
        indicatorsDiv(thisIndex) = indicatorsDiv(thisIndex)./thisAverage;
    end
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped']);
    boxplot(theseIndicators, fatigueLevels, 'notch', 'on', ...
          'colors', [0, 0, 0], 'groupOrder', {'Low', 'Normal', 'High'})
    ylabel(indicatorType{k})
    box on
    set(gca, 'YGrid', 'on');
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': grouped']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/DIV']);
    boxplot(indicatorsDiv, fatigueLevels, 'notch', 'on', ...
         'colors', [0, 0, 0], ...
        'datalim', [0, 2.5], 'groupOrder', {'Low', 'Normal', 'High'})
    ylabel(indicatorType{k})
    box on
    set(gca, 'YGrid', 'on');
    set(gca, 'LineWidth', 1)
    %set(gca, 'GridLineStyle', ':', 'XGrid', 'on', 'YGrid', 'off');
    title([indicatorType{k} ': grouped/DIV']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/SUB']);
    boxplot(indicatorsSub, fatigueLevels, 'notch', 'on', ...
         'colors', [0, 0, 0], 'groupOrder', {'Low', 'Normal', 'High'})
    ylabel(indicatorType{k})
    box on
    set(gca, 'YGrid', 'on');
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': grouped/SUB']);
    
   %% Plot subjects using boxplots
    figure('Name', [indicatorType{k}]);
    boxplot(theseIndicators, subjects,  ...
        'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    xlabel('Subjects')
    box on
    set(gca, 'LineWidth', 1, 'YLim', [0, 30])
    set(gca, 'YGrid', 'on');
    title([indicatorType{k}]);
    
    %%
    figure('Name', [indicatorType{k} ': Div']);
    boxplot(indicatorsDiv, subjects,  ...
        'colors', [0, 0, 0])
    ylabel([indicatorType{k} ': scaled'])
    xlabel('Subjects')
    box on
    set(gca, 'YGrid', 'on');
    set(gca, 'LineWidth', 1, 'YLim', [0, 3])
    title([indicatorType{k} ': Subject Div']);
    
    %%
    figure('Name', [indicatorType{k} ': Sub']);
    boxplot(indicatorsSub, subjects, ...
        'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    xlabel('Subjects')
    box on
    set(gca, 'YGrid', 'on');
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': Subject Sub']);
  
end

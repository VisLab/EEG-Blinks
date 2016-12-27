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

%% Shooter blinks
experiment = 'Shooter';
blinkDir = 'O:\ARL_Data\Shooter\BlinkOutput';
summaryFile = 'shooter_AllMastRefCombined_summary.mat';
aNovaFile = 'shooter_AllMastRefCombined_ANOVA.mat';
taskTypes = {'SEF2', 'SEF4', 'SEO2', 'SEO4', ...
             'DEF2', 'DEF4', 'DEO2', 'DEO4', 'ARIT', ...
             'EC', 'EO'};
taskGroupList = {{'SEF2', 'SEF4', 'SEO2', 'SEO4'};
              {'DEF2', 'DEF4', 'DEO2', 'DEO4', 'ARIT'};
              {'EC', 'EO'}};
excludedGroups = 3; 
excludedTasks = {'EC', 'EO'};
theVersion = 'SingleVSDualArit';

%% Load the summary file
load([blinkDir filesep summaryFile]);

%% Set up the groups
srate = cellfun(@double, {blinkStatisticsSummary.srate});
componentValid = ~isnan(srate);

%% Remove the Nan entries
blinkStatisticsSummary = blinkStatisticsSummary(componentValid);
subjects = {blinkStatisticsSummary.subjectID};
tasks = {blinkStatisticsSummary.task};
used = cellfun(@double, {blinkStatisticsSummary.usedNumber});
taskTimes = 1:length(blinkStatisticsSummary);

%% Compute the order variables
uniqueSubjects = unique(subjects);
taskOrder = zeros(size(subjects));
taskGroups = getTaskGroups(tasks, taskGroupList);
datasetIndex = 1:length(blinkStatisticsSummary);
for k = 1:length(uniqueSubjects)
    theseSubjects = strcmpi(subjects, uniqueSubjects{k});
    theseTimes = taskTimes(theseSubjects);
    [sortTimes, sortIndex] = sort(theseTimes);
    thesePositions = datasetIndex(theseSubjects);
    taskOrder(theseSubjects) = sortIndex;
end

%% Calculate masks for excluded tasks and excluded groups
tasksExcluded = false(size(tasks));
if ~isempty(excludedTasks)
    for k = 1:length(tasks)
        if sum(strcmpi(excludedTasks, tasks{k}))
            tasksExcluded(k) = true;
        end
    end
end
%%
groupsExcluded = false(size(tasks));
if ~isempty(excludedGroups)
    for k = 1:length(tasks)
        if sum(excludedGroups == taskGroups(k))
            groupsExcluded(k) = true;
        end
    end
end

%% Initialize the structures
baseStruct = struct('occularIndex', NaN, 'aNovaType', NaN, ...
                    'p', NaN, 'pTable', NaN, 'pStats', NaN);
indicatorType = {'pAVRZ', 'nAVRZ', 'durationZ', 'durationHB', 'durationHZ', 'blinksPerMin'};
numAnovaVariations = 9;
pValues = cell(length(indicatorType), numAnovaVariations);  % 6 variations of anova

for k = 1:length(indicatorType)
    fprintf('Indicator %d: %s\n', k, indicatorType{k});
    subjectInd = ['subject' indicatorType{k}];
    indicatorBase = nan(length(blinkStatisticsSummary), 1);
    for n = 1:length(indicatorBase)
        value = blinkStatisticsSummary(n).(indicatorType{k});
         if ~isempty(value)
             indicatorBase(n) = value(1);
         end
    end
    %indicatorBase = occularIndices.(indicatorType{k})(:, 1);
    indicatorValid = ~isnan(indicatorBase) & ~tasksExcluded';
    theseSubjects = subjects(indicatorValid);
    theseTasks = tasks(indicatorValid);
    theseGroups = taskGroups(indicatorValid);
    theseIndicators = indicatorBase(indicatorValid);
    theseOrders = taskOrder(indicatorValid);
    %% Compute subject subtraction and division scaling
    indicatorsSub = theseIndicators;
    indicatorsDiv = theseIndicators;
   
    for s = 1:length(uniqueSubjects)
        thisSubject = uniqueSubjects{s};
        thisIndex = strcmpi(theseSubjects, thisSubject);
        thisAverage = mean(theseIndicators(thisIndex & theseGroups == 1));
        indicatorsSub(thisIndex) = indicatorsSub(thisIndex) - thisAverage;
        indicatorsDiv(thisIndex) = indicatorsDiv(thisIndex)./thisAverage;
    end
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped']);
    boxplot(theseIndicators, theseGroups, 'notch', 'on', ...
        'labels', {'No math', 'Math'}, 'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    box on
    set(gca, 'YGrid', 'on');
%     ax = gca;
%     ax.YGrid = 'on';
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': grouped']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/DIV']);
    boxplot(indicatorsDiv, theseGroups, 'notch', 'on', ...
        'labels', {'No math', 'Math'}, 'colors', [0, 0, 0], ...
        'datalim', [0, 2.5])
    ylabel(indicatorType{k})
    box on
    set(gca, 'YGrid', 'on');
%         ax = gca;
%     ax.YGrid = 'on';
    set(gca, 'LineWidth', 1)
    %set(gca, 'GridLineStyle', ':', 'XGrid', 'on', 'YGrid', 'off');
    title([indicatorType{k} ': grouped/DIV']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/SUB']);
    boxplot(indicatorsSub, theseGroups, 'notch', 'on', ...
        'labels', {'No math', 'Math'}, 'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    box on
    set(gca, 'YGrid', 'on');
%     ax = gca;
%     ax.YGrid = 'on';
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': grouped/SUB']);
    
   %% Plot subjects using boxplots
    figure('Name', [indicatorType{k}]);
    boxplot(theseIndicators, theseSubjects, 'labels', ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'}, ...
        'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    xlabel('Subjects')
    box on
    set(gca, 'LineWidth', 1, 'YLim', [0, 30])
    set(gca, 'YGrid', 'on');
%     ax = gca;
%     ax.YGrid = 'on';
    title([indicatorType{k}]);
    
    %%
    figure('Name', [indicatorType{k} ': Div']);
    boxplot(indicatorsDiv, theseSubjects, 'labels', ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'}, ...
        'colors', [0, 0, 0])
    ylabel([indicatorType{k} ': scaled'])
    xlabel('Subjects')
    box on
    set(gca, 'YGrid', 'on');
%     ax = gca;
%     ax.YGrid = 'on';
    set(gca, 'LineWidth', 1, 'YLim', [0, 3])
    title([indicatorType{k} ': Subject Div']);
    
    %%
    figure('Name', [indicatorType{k} ': Sub']);
    boxplot(indicatorsSub, theseSubjects, 'labels', ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'}, ...
        'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    xlabel('Subjects')
    box on
    set(gca, 'YGrid', 'on');
%     ax = gca;
%     ax.YGrid = 'on';
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': Subject Sub']);
    %%
    numSubjects = length(uniqueSubjects);
    myColors = jet(numSubjects);
    for n = 1:numSubjects
        
    end
end

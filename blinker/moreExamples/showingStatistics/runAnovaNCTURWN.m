%% Run an n-way analysis of variance on a blinkStatisticsSummary data structure
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
aNovaFile = [blinkDir filesep experiment '_aNovaResults.mat'];
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
    elseif sum(strcmpi(pieces, 'LowFatigue')) > 0
        fatigueLevels{k} = 'Low';
    elseif sum(strcmpi(pieces, 'Normal')) > 0
        fatigueLevels{k} = 'Normal';
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

%% Initialize the structures
baseStruct = struct('ocularIndex', NaN, 'aNovaType', NaN, ...
                    'p', NaN, 'pTable', NaN, 'pStats', NaN);
indicatorType = {'pAVRZ', 'nAVRZ', 'durationZ', 'durationHB', 'durationHZ', 'blinksPerMin'};
numAnovaVariations = 8;
pValues = cell(length(indicatorType), numAnovaVariations);  % 6 variations of anova

for k = 1:length(indicatorType)
    fprintf('Indicator %d: %s\n', k, indicatorType{k});
    subjectInd = ['subject' indicatorType{k}];
    taskInd = ['task' indicatorType{k}];
    %% Make sure there are no empty cells to mess up the calculation
    indicatorBase = nan(length(blinkStatisticsSummary), 1);
    for n = 1:length(indicatorBase)
        value = blinkStatisticsSummary(n).(indicatorType{k});
         if ~isempty(value)
             indicatorBase(n) = value(1);
         end
    end
    indicatorValid = ~isnan(indicatorBase);
    theseSubjects = subjects(indicatorValid);
    theseTasks = tasks(indicatorValid);
    theseFatigues = fatigueLevels(indicatorValid);
    theseIndicators = indicatorBase(indicatorValid);
    theseTasksExcluded = tasksExcluded(indicatorValid);

    %% Calculate aNova for subjects versus tasks
    [p, theTable, theStats] = anovan(theseIndicators, {theseSubjects, theseTasks}, ...
          'display', 'off', 'varnames', {subjectInd, 'task'});
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Task';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 1} = b;
    
    
    %% Calculate aNova for subjects versus fatigue
    [p, theTable, theStats] = anovan(theseIndicators, {theseSubjects, theseFatigues}, ...
          'display', 'off', 'varnames', {subjectInd, 'fatigue'});
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Fatigue';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 2} = b;
    
    %% Calculate aNova for task versus fatigue
    [p, theTable, theStats] = anovan(theseIndicators, {theseTasks, theseFatigues}, ...
          'display', 'off', 'varnames', {taskInd, 'fatigue'});
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Task-Fatigue';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 3} = b;
    
    %% ANova with subject-task-fatigue level
    [p, theTable, theStats] = anovan(theseIndicators, ...
        {theseSubjects, theseTasks, theseFatigues}, ...
        'display', 'off', ...
        'varnames', {subjectInd, 'task', 'fatigue' });
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Task-Fatigue';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 4} = b;
    

    %% ANova subject-task-fatigue with excluded tasks eliminated
    theseExSubjects = theseSubjects(~theseTasksExcluded);
    theseExTasks = theseTasks(~theseTasksExcluded);
    exIndicators = theseIndicators(~theseTasksExcluded);
    [p, theTable, theStats] = anovan(exIndicators, ...
          {theseExSubjects, theseExTasks, theseFatigues}, ...
          'display', 'off', 'varnames', {subjectInd, 'taskNoEx', 'fatigue'});
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Task-No-Excluded-Fatigue';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 5} = b;

    %% Compute subject subtraction and division scaling - scaled by low-fatigue
    indicatorSub = theseIndicators;
    indicatorDiv = theseIndicators;
    scaleFatigueTasks = strcmpi(theseFatigues, 'Normal') | ...
                        strcmpi(theseFatigues, 'Low');
    for s = 1:length(uniqueSubjects)
        thisSubject = uniqueSubjects{s};
        thisIndex = strcmpi(theseSubjects, thisSubject);
        thisAverage = mean(theseIndicators(thisIndex & scaleFatigueTasks));
        indicatorSub(thisIndex) = indicatorSub(thisIndex) - thisAverage;
        indicatorDiv(thisIndex) = indicatorDiv(thisIndex)./thisAverage;
    end
    
    %% Anova subject-task using subtraction scaling
    [p, theTable, theStats] = anovan(indicatorSub, {theseSubjects, theseFatigues}, ...
          'display', 'off', 'varnames', {[subjectInd 'Sub'], 'fatigues' });
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Sub-Scaling-Fatigues';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 6} = b;
    
    %% Anova subject-task using subtraction scaling with interactions
    [p, theTable, theStats] = anovan(indicatorSub, {theseSubjects, theseFatigues}, ...
          'display', 'off', 'varnames', {[subjectInd 'Sub'], 'fatigue' }, ...
          'model', 'interaction');
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Fatigue-Interaction-No-Ex-Sub-Scaling';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 7} = b;
    
    %% Anova subject-task using division scaling
    [p, theTable, theStats] = anovan(indicatorDiv, {theseSubjects, theseFatigues}, ...
          'display', 'off', 'varnames', {[subjectInd 'Div'], 'fatigue' });
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Fatigue-No-Ex-Div-Scaling';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 8} = b;
end

%% Save the file
save(aNovaFile, 'pValues', '-v7.3');

%% Print out the indicators
[numIndicators, numVersions] = size(pValues);
for k = 1:numIndicators
    fprintf('%s:\n', pValues{k, 1}.ocularIndex);
    for n = 1:numVersions
        p = pValues{k, n};
        if isempty(p)
            continue;
        end
        
        fprintf('  %s: [', p.aNovaType)
        fprintf(' %g', p.p);
        fprintf(' ]\n');
    end
end

%% Print out the mean squared errors
[numIndicators, numVersions] = size(pValues);
for k = 1:numIndicators
    fprintf('%s:\n', pValues{k, 1}.ocularIndex);
    for n = 1:numVersions
        p = pValues{k, n};
        if isempty(p)
            continue;
        end
        pTable = p.pTable;
        sources = size(pTable, 1);
        fprintf('  %s [', p.aNovaType)
        for m = 2:sources - 1
           fprintf(' %s:%g', pTable{m, 1}, pTable{m, 5});
        end
        fprintf(' ]\n');
    end
end

%% Print out the f table
[numIndicators, numVersions] = size(pValues);
for k = 1:numIndicators
    fprintf('%s:\n', pValues{k, 1}.ocularIndex);
    for n = 1:numVersions
        p = pValues{k, n};
        if isempty(p)
            continue;
        end
        pTable = p.pTable;
        sources = size(pTable, 1);
        fprintf('  %s [\n', p.aNovaType)
        for m = 2:sources - 1
           fprintf('      %s: F(%g, %g) = %g\n', pTable{m, 1}, ...
               pTable{m, 3}, pTable{4, 3}, pTable{m, 6});
        end
        fprintf('\n]\n');
    end
end
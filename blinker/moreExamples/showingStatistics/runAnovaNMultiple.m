%% Run an n-way analysis of variance on a blinks data structure
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

%% Shooter blinks
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\BlinkOutput';
% summaryFile = 'shooter_AllMastRefCombined_summary.mat';
% aNovaFile = 'shooter_AllMastRefCombined_ANOVA.mat';
% taskTypes = {'SEF2', 'SEF4', 'SEO2', 'SEO4', ...
%              'DEF2', 'DEF4', 'DEO2', 'DEO4', 'ARIT', ...
%              'EC', 'EO'};
% taskGroupList = {{'SEF2', 'SEF4', 'SEO2', 'SEO4'};
%               {'DEF2', 'DEF4', 'DEO2', 'DEO4', 'ARIT'};
%               {'EC', 'EO'}};
% excludedGroups = 3; 
% excludedTasks = {'EC', 'EO'};
% theVersion = 'SingleVSDualArit';

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
%% NCTU
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% type = 'Channel';
% taskTypes = {{'Motion'}; {'Motionless'}};
% excludeGroup = 0;

%% BCI2000
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
% experiment = 'BCI2000';
% type = 'Channel';
% taskTypes = {'RealLRFist', 'RealFistFeet', ...
%              'ImagLRFist', 'ImagFistFeet', ...
%              'EyesOpen', 'EyesClosed'};
% taskGroupList = {{'RealLRFist', 'RealFistFeet'}; ...
%                  {'ImagLRFist', 'ImagFistFeet'}; ...
%                  {'EyesOpen', 'EyesClosed'}};
% excludedGroups = 3;
% theVersion = 'RealVsImag';
% excludedTasks = {'EyesOpen', 'EyesClosed'};

% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
% experiment = 'BCI2000';
% type = 'Channel';
% taskTypes = {'RealLRFist', 'RealFistFeet', ...
%              'ImagLRFist', 'ImagFistFeet', ...
%              'EyesOpen', 'EyesClosed'};
% excludedTasks = {'EyesOpen', 'EyesClosed'};
% taskGroupList = {{'RealLRFist'}; {'RealFistFeet'}; ...
%                  {'ImagLRFist'}; {'ImagFistFeet'}; ...
%                  {'EyesOpen', 'EyesClosed'}};
% excludedGroups = 5;
% theVersion = '4Separate';

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
uniqueNames = {blinkStatisticsSummary.uniqueName};
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
% taskTimes = 1:length(blinkStatisticsSummary);
% 
% %% Compute the order variables
% uniqueSubjects = unique(subjects);
% taskOrder = zeros(size(subjects));
% taskGroups = getTaskGroups(tasks, taskGroupList);
% datasetIndex = 1:length(blinkStatisticsSummary);
% for k = 1:length(uniqueSubjects)
%     theseSubjects = strcmpi(subjects, uniqueSubjects{k});
%     theseTimes = taskTimes(theseSubjects);
%     [sortTimes, sortIndex] = sort(theseTimes);
%     thesePositions = datasetIndex(theseSubjects);
%     taskOrder(theseSubjects) = sortIndex;
% end

% %% Calculate masks for excluded tasks and excluded groups
tasksExcluded = false(size(tasks));
if ~isempty(excludedTasks)
    for k = 1:length(tasks)
        if strcmpi(excludedTasks, tasks{k})
            tasksExcluded(k) = true;
        end
    end
end
groupsExcluded = false(size(tasks));
% if ~isempty(excludedGroups)
%     for k = 1:length(tasks)
%         if sum(excludedGroups == taskGroups(k))
%             groupsExcluded(k) = true;
%         end
%     end
% end

%% Initialize the structures
baseStruct = struct('ocularIndex', NaN, 'aNovaType', NaN, ...
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
    %indicatorBase = blinkStatisticsSummary.(indicatorType{k})(:, 1);
    indicatorValid = ~isnan(indicatorBase);
    theseSubjects = subjects(indicatorValid);
    theseTasks = tasks(indicatorValid);
    theseFatigues = fatigueLevels(indicatorValid);
    %theseGroups = taskGroups(indicatorValid);
    theseIndicators = indicatorBase(indicatorValid);
    %theseOrders = taskOrder(indicatorValid);
    theseTasksExcluded = tasksExcluded(indicatorValid);
    theseGroupsExcluded = groupsExcluded(indicatorValid);

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
    
%     %% Calculate aNova for subjects versus taskGroups
%     [p, theTable, theStats] = anovan(theseIndicators, {theseSubjects, theseGroups}, ...
%           'display', 'off', 'varnames', {subjectInd, 'group'});
%     b = baseStruct;
%     b.ocularIndex = indicatorType{k};
%     b.aNovaType = 'Subject-Group';
%     b.p = p;
%     b.pTable = theTable;
%     b.pStats = theStats;
%     pValues{k, 2} = b;
    
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
    pValues{k, 3} = b;
    
    %% ANova with subject-group-taskorder
%     [p, theTable, theStats] = anovan(theseIndicators, ...
%         {theseSubjects, theseGroups, theseOrders}, ...
%         'display', 'off', ...
%         'varnames', {subjectInd, 'group', 'taskOrder' });
%     b = baseStruct;
%     b.ocularIndex = indicatorType{k};
%     b.aNovaType = 'Subject-Group-TaskOrder';
%     b.p = p;
%     b.pTable = theTable;
%     b.pStats = theStats;
%     pValues{k, 4} = b;
    
    %% ANova subject-task with excluded tasks eliminated
    theseExSubjects = theseSubjects(~theseTasksExcluded);
    theseExTasks = theseTasks(~theseTasksExcluded);
    exIndicators = theseIndicators(~theseTasksExcluded);
    [p, theTable, theStats] = anovan(exIndicators, {theseExSubjects, theseExTasks}, ...
          'display', 'off', 'varnames', {subjectInd, 'taskNoEx' });
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Task-No-Excluded';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 5} = b;

    %% Anova subject-taskgroup-no-excludedgroup
%     theseExGroups = theseGroups(~theseGroupsExcluded);
%     theseExGSubjects = theseSubjects(~theseGroupsExcluded);
%     theseExGIndicators = theseIndicators(~theseGroupsExcluded);
%     [p, theTable, theStats] = anovan(theseExGIndicators, ...
%                                      {theseExGSubjects, theseExGroups}, ...
%           'display', 'off', 'varnames', {subjectInd, 'taskGroup'});
%     b = baseStruct;
%     b.ocularIndex = indicatorType{k};
%     b.aNovaType = 'Subject-Group-No-Excluded-Group ';
%     b.p = p;
%     b.pTable = theTable;
%     b.pStats = theStats;
%     pValues{k, 6} = b;
%     
    %% Compute subject subtraction and division scaling - scaled by low-fatigue
    indicatorSub = theseExGIndicators;
    indicatorDiv = theseExGIndicators;
   
    for s = 1:length(uniqueSubjects)
        thisSubject = uniqueSubjects{s};
        thisIndex = strcmpi(theseExGSubjects, thisSubject);
        thisAverage = mean(theseExGIndicators(thisIndex & theseExGroups == 1));
        indicatorSub(thisIndex) = indicatorSub(thisIndex) - thisAverage;
        indicatorDiv(thisIndex) = indicatorDiv(thisIndex)./thisAverage;
    end
    
    %% Anova subject-task using subtraction scaling
    [p, theTable, theStats] = anovan(indicatorSub, {theseExGSubjects, theseExGroups}, ...
          'display', 'off', 'varnames', {[subjectInd 'Sub'], 'taskGroup' });
    b = baseStruct;
    b.ocularIndex = indicatorType{k};
    b.aNovaType = 'Subject-Group-No-Ex-Sub-Scaling';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 7} = b;
    
%     %% Anova subject-task using subtraction scaling with interactions
%     [p, theTable, theStats] = anovan(indicatorSub, {theseExGSubjects, theseExGroups}, ...
%           'display', 'off', 'varnames', {[subjectInd 'Sub'], 'taskGroup' }, ...
%           'model', 'interaction');
%     b = baseStruct;
%     b.ocularIndex = indicatorType{k};
%     b.aNovaType = 'Subject-Group-Interaction-No-Ex-Sub-Scaling';
%     b.p = p;
%     b.pTable = theTable;
%     b.pStats = theStats;
%     pValues{k, 8} = b;
%     
%     %% Anova subject-task using division scaling
%     [p, theTable, theStats] = anovan(indicatorDiv, {theseExGSubjects, theseExGroups}, ...
%           'display', 'off', 'varnames', {[subjectInd 'Div'], 'taskGroup' });
%     b = baseStruct;
%     b.ocularIndex = indicatorType{k};
%     b.aNovaType = 'Subject-Group-No-Ex-Div-Scaling';
%     b.p = p;
%     b.pTable = theTable;
%     b.pStats = theStats;
%     pValues{k, 9} = b;
end

%% Save the file
%save([blinkDir filesep aNovaFile], 'pValues', '-v7.3');

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
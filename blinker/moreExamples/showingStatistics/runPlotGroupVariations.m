% Show plots of the indicators in different groups
%% Shooter blinks
experiment = 'Shooter';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
typeBlinks = 'ChannelUnrefNewBothCombined';
typeBlinkProperties = 'ChannelUnrefNewBothCombined';
typeBlinkSummary = 'ChannelUnrefNewBothCombined';
typeBlinkOccular = 'ChannelUnrefNewBothCombined';
taskTypes = {'SEF2', 'SEF4', 'SEO2', 'SEO4', ...
             'DEF2', 'DEF4', 'DEO2', 'DEO4', 'ARIT', ...
             'EC', 'EO'};
taskGroupList = {{'SEF2', 'SEF4', 'SEO2', 'SEO4'};
              {'DEF2', 'DEF4', 'DEO2', 'DEO4', 'ARIT'};
              {'EC', 'EO'}};
excludedGroups = 3; 
excludedTasks = {'EC', 'EO'};
theVersion = 'SingleVSDualArit';

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

%% Load the files
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];
blinkPropertiesFile = [experiment 'BlinksNew' typeBlinkProperties 'Properties.mat'];
occularFile = [experiment 'BlinksNew' typeBlinkOccular 'Occular.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);
load([blinkDir filesep occularFile]);

%% Set up the groups
subjects = {blinks.subjectID};
tasks = {blinks.task};
used = cellfun(@double, {blinks.usedSignal});
componentValid = ~isnan(used);
taskTimes = cell2mat({blinks.startTime});

%% Compute the order variables
uniqueSubjects = unique(subjects);
taskOrder = zeros(size(subjects));
taskGroups = getTaskGroups(tasks, taskGroupList);
datasetIndex = 1:length(blinks);
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
    indicatorBase = occularIndices.(indicatorType{k})(:, 1);
    indicatorValid = ~isnan(indicatorBase) & componentValid' & ~tasksExcluded';
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
    ax = gca;
    ax.YGrid = 'on';
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': grouped']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/DIV']);
    boxplot(indicatorsDiv, theseGroups, 'notch', 'on', ...
        'labels', {'No math', 'Math'}, 'colors', [0, 0, 0], ...
        'datalim', [0, 2.5])
    ylabel(indicatorType{k})
    box on
        ax = gca;
    ax.YGrid = 'on';
    set(gca, 'LineWidth', 1)
    %set(gca, 'GridLineStyle', ':', 'XGrid', 'on', 'YGrid', 'off');
    title([indicatorType{k} ': grouped/DIV']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/SUB']);
    boxplot(indicatorsSub, theseGroups, 'notch', 'on', ...
        'labels', {'No math', 'Math'}, 'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    box on
    ax = gca;
    ax.YGrid = 'on';
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
    ax = gca;
    ax.YGrid = 'on';
    title([indicatorType{k}]);
    
    %%
    figure('Name', [indicatorType{k} ': Div']);
    boxplot(indicatorsDiv, theseSubjects, 'labels', ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'}, ...
        'colors', [0, 0, 0])
    ylabel([indicatorType{k} ': scaled'])
    xlabel('Subjects')
    box on
    ax = gca;
    ax.YGrid = 'on';
    set(gca, 'LineWidth', 1, 'YLim', [0, 5])
    title([indicatorType{k} ': Subject Div']);
    
    %%
    figure('Name', [indicatorType{k} ': Sub']);
    boxplot(indicatorsSub, theseSubjects, 'labels', ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'}, ...
        'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    xlabel('Subjects')
    box on
    ax = gca;
    ax.YGrid = 'on';
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': Subject Sub']);
    %%
    numSubjects = length(uniqueSubjects);
    myColors = jet(numSubjects);
    for n = 1:numSubjects
        
    end
end

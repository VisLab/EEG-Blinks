% Show plots of the indicators in different groups
%% Shooter blinks
experiment = 'Shooter';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
type = 'EOGUnref';
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
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
occularFile = [experiment 'BlinksNewOccular' type '.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);
load([blinkDir filesep occularFile]);

%% Set up the groups
subjects = {blinks.subjectID};
tasks = {blinks.task};
componentValid = ~isnan(cell2mat({blinks.usedComponent}));
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
    grid on
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': grouped']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/DIV']);
    boxplot(indicatorsDiv, theseGroups, 'notch', 'on', ...
        'labels', {'No math', 'Math'}, 'colors', [0, 0, 0], ...
        'datalim', [0, 2.5])
    ylabel(indicatorType{k})
    box on
    grid on
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': grouped/DIV']);
    
    %% Plot groups using boxplots
    figure('Name', [indicatorType{k} ': grouped/SUB']);
    boxplot(indicatorsSub, theseGroups, 'notch', 'on', ...
        'labels', {'No math', 'Math'}, 'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    box on
    grid on
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
    grid on
    set(gca, 'LineWidth', 1)
    title([indicatorType{k}]);
    
    %%
    figure('Name', [indicatorType{k} ': Div']);
    boxplot(indicatorsDiv, theseSubjects, 'labels', ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'}, ...
        'colors', [0, 0, 0], 'datalim', [0, 2.5])
    ylabel([indicatorType{k} ': scaled'])
    xlabel('Subjects')
    box on
    grid on
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': Subject Div']);
    
    %%
    figure('Name', [indicatorType{k} ': Sub']);
    boxplot(indicatorsSub, theseSubjects, 'labels', ...
        {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'}, ...
        'colors', [0, 0, 0])
    ylabel(indicatorType{k})
    xlabel('Subjects')
    box on
    grid on
    set(gca, 'LineWidth', 1)
    title([indicatorType{k} ': Subject Sub']);
    %%
    numSubjects = length(uniqueSubjects);
    myColors = jet(numSubjects);
    for n = 1:numSubjects
        
    end
end
% 
% %% Save the file
% outFile = [blinkDir filesep experiment 'Version' theVersion 'AnovaN.mat'];
% save(outFile, 'pValues', '-v7.3');
% 
% %% Print out the indicators
% [numIndicators, numVersions] = size(pValues);
% for k = 1:numIndicators
%     fprintf('%s:\n', pValues{k, 1}.occularIndex);
%     for n = 1:numVersions
%         p = pValues{k, n};
%         fprintf('  %s: [', p.aNovaType)
%         fprintf(' %g', p.p);
%         fprintf(' ]\n');
%     end
% end
% 
% %% Print out the mean squared errors
% [numIndicators, numVersions] = size(pValues);
% for k = 1:numIndicators
%     fprintf('%s:\n', pValues{k, 1}.occularIndex);
%     for n = 1:numVersions
%         p = pValues{k, n};
%         pTable = p.pTable;
%         sources = size(pTable, 1);
%         fprintf('  %s [', p.aNovaType)
%         for m = 2:sources - 1
%            fprintf(' %s:%g', pTable{m, 1}, pTable{m, 5});
%         end
%         fprintf(' ]\n');
%     end
% end
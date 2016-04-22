% Calculate the anovan on the shooter blinks
%% Shooter blinks
experiment = 'Shooter';
%blinkDir = 'K:\CTAData\Shooter\ShooterBlinks';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
%type = 'EOGUnref';
type = 'ChannelUnref';

%% Load the files
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
occularFile = [experiment 'BlinksNewOccular' type '.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);
load([blinkDir filesep occularFile]);

%% Set up the indicators
theBlinkIndices = goodBlinkIndices;

%% Set up the groups
subjects = {blinks.subjectID};
tasks = {blinks.task};
componentValid = ~isnan(cell2mat({blinks.usedComponent}));
taskTimes = cell2mat({blinks.startTime});
%% Compute the order variables
uniqueSubjects = unique(subjects);
taskOrder = zeros(size(subjects));
taskGroups = zeros(size(subjects));
datasetIndex = 1:length(blinks);
for k = 1:length(uniqueSubjects)
    theseSubjects = strcmpi(subjects, uniqueSubjects{k});
    theseTimes = taskTimes(theseSubjects);
    [sortTimes, sortIndex] = sort(theseTimes);
    thesePositions = datasetIndex(theseSubjects);
    taskOrder(theseSubjects) = sortIndex;
    theseTasks = tasks(theseSubjects);
    singleTasks = strcmpi(theseTasks, 'SEF2') | strcmpi(theseTasks, 'SEF4') | ...
                  strcmpi(theseTasks, 'SEO2') | strcmpi(theseTasks, 'SEO4');
    dualTasks = strcmpi(theseTasks, 'DEF2') | strcmpi(theseTasks, 'DEF4') | ...
                strcmpi(theseTasks, 'DEO2') | strcmpi(theseTasks, 'DEO4') | ...
                strcmpi(theseTasks, 'ARIT');
    ecoTasks = strcmpi(theseTasks, 'EC') | strcmpi(theseTasks, 'EO');
    theseGroups = taskGroups(theseSubjects);
    theseGroups(ecoTasks) = 0;
    theseGroups(singleTasks) = 1;
    theseGroups(dualTasks) = 2;
    taskGroups(theseSubjects) = theseGroups;
end

%% Initialize the structures
baseStruct = struct('occularIndex', NaN, 'aNovaType', NaN, ...
                    'p', NaN, 'pTable', NaN, 'pStats', NaN);
indexType = {'pAVRZ', 'nAVRZ', 'durZ', 'durHB', 'bperM'};
pValues = cell(length(theBlinkIndices), 6);

for k = 1:length(theBlinkIndices)
    fprintf('Indicator %d: %s\n', k, indexType{k});
    subjectInd = ['subject' indexType{k}];
    indicatorBase = theBlinkIndices{k}(:, 1);
    indicatorValid = ~isnan(indicatorBase) & componentValid';
    theseSubjects = subjects(indicatorValid);
    theseTasks = tasks(indicatorValid);
    indicator = indicatorBase(indicatorValid);
    theseOrders = taskOrder(indicatorValid);
    
    %% Calculate aNova for subjects versus tasks
    [p, theTable, theStats] = anovan(indicator, {theseSubjects, theseTasks}, ...
          'display', 'off', 'varnames', {subjectInd, 'task'});
    b = baseStruct;
    b.occularIndex = indexType{k};
    b.aNovaType = 'Subject-Task';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 1} = b;
    
    %% ANova with subject-task-taskorder
    [p, theTable, theStats] = anovan(indicator, ...
        {theseSubjects, theseTasks, theseOrders}, ...
        'display', 'off', ...
        'varnames', {subjectInd, 'task', 'taskOrder' });
    b = baseStruct;
    b.occularIndex = indexType{k};
    b.aNovaType = 'Subject-Task-TaskOrder';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 2} = b;
    
    %% ANova subject-task with EC/EO eliminated
    noECTasks = strcmpi(tasks, 'EC') | strcmpi(tasks, 'EO');
    indicatorNoEC = indicatorValid(:) & ~noECTasks(:);
    theseSubjects = subjects(indicatorNoEC);
    theseTasks = tasks(indicatorNoEC);
    indicator = indicatorBase(indicatorNoEC);
    [p, theTable, theStats] = anovan(indicator, {theseSubjects, theseTasks}, ...
          'display', 'off', 'varnames', {subjectInd, 'taskNoEC' });
    b = baseStruct;
    b.occularIndex = indexType{k};
    b.aNovaType = 'Subject-Task-No EC/EO';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 3} = b;

    %% Anova subject-taskgroup (single versus with arith)
    theseGroups = taskGroups(indicatorNoEC);
    [p, theTable, theStats] = anovan(indicator, {theseSubjects, theseGroups}, ...
          'display', 'off', 'varnames', {subjectInd, 'taskGroup'});
    b = baseStruct;
    b.occularIndex = indexType{k};
    b.aNovaType = 'Subject-taskgroup (single vs arith)';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 4} = b;
    
    %% Compute subject subtraction and division scaling
    indicatorSub = indicatorBase(indicatorNoEC);
    indicatorDiv = indicatorBase(indicatorNoEC);
    theseSubjects = subjects(indicatorNoEC);
    theseGroups = taskGroups(indicatorNoEC);
    for s = 1:length(uniqueSubjects)
        thisSubject = uniqueSubjects{s};
        thisIndex = strcmpi(theseSubjects, thisSubject);
        thisAverage = mean(indicator(thisIndex & theseGroups == 1));
        indicatorSub(thisIndex) = indicatorSub(thisIndex) - thisAverage;
        indicatorDiv(thisIndex) = indicatorDiv(thisIndex)./thisAverage;
    end
    
    %% Anova subject-task using subtraction scaling
    [p, theTable, theStats] = anovan(indicatorSub, {theseSubjects, theseGroups}, ...
          'display', 'off', 'varnames', {[subjectInd 'Sub'], 'taskGroup' });
    b = baseStruct;
    b.occularIndex = indexType{k};
    b.aNovaType = 'Subject-taskgroup subtraction scaling';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 5} = b;
    
    %% Anova subject-task using division scaling
    [p, theTable, theStats] = anovan(indicatorDiv, {theseSubjects, theseGroups}, ...
          'display', 'off', 'varnames', {[subjectInd 'Div'], 'taskGroup' });
       b = baseStruct;
    b.occularIndex = indexType{k};
    b.aNovaType = 'Subject-taskgroup division scaling';
    b.p = p;
    b.pTable = theTable;
    b.pStats = theStats;
    pValues{k, 6} = b;
end

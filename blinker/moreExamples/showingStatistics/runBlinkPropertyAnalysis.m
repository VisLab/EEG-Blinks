%% This script displays various graphs summarizing blink statistics
individual = 0;
% %type = 'IC';
% type = 'EOGUnref';
%% Set up the input and output files for VEP Summary
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% Set up input and output for BCIT
% blinkDir = 'O:\ARL_Data\BCITBlinks';
% experiment = 'BCITLevel0';
% %experiment = 'Experiment X2 Traffic Complexity';
% %experiment = 'Experiment X6 Speed Control';
% %experiment = 'X3 Baseline Guard Duty';
% %experiment = 'X4 Advanced Guard Duty';
% %experiment = 'X1 Baseline RSVP';
% %experiment = 'Experiment XC Calibration Driving';
% %experiment = 'Experiment XB Baseline Driving';
% %experiment = 'X2 RSVP Expertise';
% subjectFile = 'O:\ARL_Data\BCITNames\subjectMapTimes.mat';

%% NCTU blinks
% type = 'IC';
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% subjectFile = 'O:\ARL_Data\NCTU\NCTU_Blinks\NCTU_LK_subjectMap.mat';

%% Shooter blinks
collectionType = 'FILES2';
experiment = 'Shooter';
%blinkDir = 'K:\CTAData\Shooter\ShooterBlinks';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
type = 'EOGUnref';
%type = 'ChannelUnref';
%% Set up the files for the collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
blinkSummaryFile = [experiment 'BlinksNewSummary' type '.mat'];

%% Load the blink summary file
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);
load([blinkDir filesep blinkSummaryFile]);

%% Compute the blink counts
numberDatasets = length(blinkProperties);
offsetFactor = 1;
runIntervals = 60;
blinkCounts = cell(numberDatasets, 1);
for m = 1:numberDatasets
    if ~isa(blinkProperties{m}, 'struct') && ...
            (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
        fprintf('Dataset %d (%s) does not have blink properties\n', ...
             m, blinks(m).uniqueName);
        continue;
    end
    peaks = cellfun(@double, {blinkProperties{m}.blinkPeakTime});
    timeRange = [0, size(blinks(m).blinkComponents, 2)/blinks(m).srate];
    windowOffset = floor(runIntervals/offsetFactor);
    blinkCounts{m} = getBlinkRate(peaks, runIntervals, windowOffset, timeRange);
end


%% Plot the counts for this
theColors = jet(numberDatasets);
baseInterval = runIntervals/60; % Convert to minutes
myTitle = [experiment ' blink rate (n = ' num2str(numberDatasets) ...
    ' datasets)'];
figure('Color', [1, 1, 1], 'Name', myTitle);
hold on
for m = 1:numberDatasets
    if ~isa(blinkProperties{m}, 'struct') && ...
            (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
        continue;
    end
    plot(blinkCounts{m}, 'Color', theColors(m, :), 'LineWidth', 2)
end
hold off
xlabel('Minutes')
ylabel(['Blinks/min in ' num2str(baseInterval) ' minutes'])
box on


%% Overall blinks per minute
numberDatasets = length(blinkProperties);
offsetFactor = 1;
runIntervals = 60;
blinksOverall = zeros(numberDatasets, 1);
for k = 1:numberDatasets
    usedComponent = blinks(k).usedComponent;
    if isnan(usedComponent) || isempty(usedComponent)
        continue;
    end
    p = find(blinks(k).componentIndices == usedComponent, 1, 'first');
    numberBlinks = blinks(k).numberBlinks(p);
    numberMinutes = size(blinks(k).blinkComponents, 2)/(blinks(k).srate * 60);
    blinksOverall(k) = numberBlinks/numberMinutes;
end


%% Plot the counts for this
theColors = jet(numberDatasets);
myTitle = [experiment ' overall blink rate (n = ' num2str(numberDatasets) ...
    ' datasets)'];
figure('Color', [1, 1, 1], 'Name', myTitle);
hold on
for m = 1:numberDatasets
    if ~isa(blinkProperties{m}, 'struct') && ...
            (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
        continue;
    end
    plot(m, blinksOverall(m), 'Color', theColors(m, :), 'LineWidth', 2)
end
hold off
xlabel('Dataset')
ylabel(['Blinks/min in ' num2str(baseInterval) ' minutes'])
box on

%% Plot the max, min and median blink counts by subject
maxCounts = zeros(numberDatasets, 1);
minCounts = zeros(numberDatasets, 1);
medianCounts = zeros(numberDatasets, 1);
meanCounts = zeros(numberDatasets, 1);
stdCounts = zeros(numberDatasets, 1);
iqrCounts = zeros(numberDatasets, 1);
for m = 1:numberDatasets
    if ~isa(blinkProperties{m}, 'struct') && ...
           (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
       continue;
    end   
        if isempty(blinkCounts{m})
            continue;
        elseif sum(isnan(blinkCounts{m})) == length(blinkCounts{m})
            continue;
        end
            
        maxCounts(m) = max(blinkCounts{m});
        minCounts(m) = min(blinkCounts{m});
        medianCounts(m) = median(blinkCounts{m});
        meanCounts(m) = mean(blinkCounts{m});
        stdCounts(m) = std(blinkCounts{m});
end
datasets = (1:numberDatasets)';

%% Plot counts of the datasets
figure 
hold on
errorbar(datasets, medianCounts, minCounts, maxCounts, ...
        's', 'MarkerSize', 10, 'LineWidth', 1.5)
plot(datasets, meanCounts, 'ro', 'LineWidth', 1.5)
xlabel('Datasets')
ylabel(['Blinks/min in ' num2str(baseInterval) ' minutes'])
hold off
box on
%%
[sortMeans, sortIndex] = sort(meanCounts);
sortStds = stdCounts(sortIndex);
sortSubjects = datasets(sortIndex);
%%
figure('Color', [1, 1, 1])
errorbar(sortMeans, sortStds, 's', 'MarkerSize', 10, 'LineWidth', 1.5)
xlabel('Subject')
ylabel(['Blinks/min in ' num2str(baseInterval) ' minutes'])
box on
title(['Mean blinks/min with SD errorbars (n = ' num2str(length(sortMeans)) ')']);

%% Construct a map to get at the blink positions
uniqueSubjects = unique({blinks.subjectID});
blinkMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
for k = 1:length(blinks)
    key = blinks(k).subjectID;
    if isKey(blinkMap, key)
        thePositions = blinkMap(key);
    else
        thePositions = [];
    end
    thePositions(end + 1) = k; %#ok<SAGROW>
    blinkMap(key) = thePositions;
end

%% Construct a map of number of subjects
numberSubjects = length(uniqueSubjects);
positionsBySubject = cell(numberSubjects, 1);
durationsBySubject = cell(numberSubjects, 1);
for s = 1:numberSubjects
    theSubject = uniqueSubjects{s};
    positionsBySubject{s} = blinkMap(theSubject);
    durationsBySubject{s} = blinksOverall(positionsBySubject{s});
end

%% Plot each subject on the time line.
subjectColors = jet(numberSubjects);
baseInterval = runIntervals/60; % Convert to minutes
myTitle = [experiment ' blink rate (n = ' num2str(numberSubjects) ...
    ' subjects)'];
figure('Color', [1, 1, 1], 'Name', myTitle);
hold on
for s = 1:numberSubjects
    positions = positionsBySubject{s};
    starts = cell2mat({blinks(positions).startTime});
    [sortStart, sortInd] = sort(starts);
    positions = positions(sortInd);
    sortStart = (sortStart - sortStart(1))*24*60;
    if sum(sortStart > 24*60) > 1
        fprintf('Subject %d runs on multiple days and is skipped\n', n);
        continue;
    end
    for p = 1:length(positions)
        m = positions(p);
        
        if ~isa(blinkProperties{m}, 'struct') && ...
                (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
            continue;
        end
        if isempty(blinkCounts{m})
            continue;
        elseif sum(isnan(blinkCounts{m})) == length(blinkCounts{m})
            continue;
        end
        theTimes = 1:length(blinkCounts{m});
        theTimes = (theTimes - 1) + sortStart(p);
        plot(theTimes, blinkCounts{m}, 'Color', subjectColors(s, :), 'LineWidth', 2)
    end
    for p = 2:length(positions)
        bLast = blinkCounts{positions(p-1)};
        lastTime = (length(bLast) - 1) + sortStart(p-1);
        theTimes = (theTimes - 1) + sortStart(p);
      
        bThis = blinkCounts{positions(p)};
        if isempty(bLast) || isempty(bThis)
            continue;
        end
        line([lastTime, sortStart(p)], [bLast(end), bThis(1)], ...
            'LineWidth', 2, 'LineStyle', '--', 'Color', [0.8, 0.8, 0.8]);
    end
end

hold off
xlabel('Minutes')
ylabel(['Blinks/min in ' num2str(baseInterval) ' minutes'])
box on

%% Plot the counts for this
theColors = jet(numberDatasets);
baseInterval = runIntervals/60; % Convert to minutes
myTitle = [experiment ' blink rate (n = ' num2str(numberDatasets) ...
    ' datasets)'];
figure('Color', [1, 1, 1], 'Name', myTitle);
hold on
for m = 1:numberDatasets
    if ~isa(blinkProperties{m}, 'struct') && ...
            (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
        continue;
    end
    plot(blinkCounts{m}, 'Color', theColors(m, :), 'LineWidth', 2)
end
hold off
xlabel('Minutes')
ylabel(['Blinks/min in ' num2str(baseInterval) ' minutes'])
box on


%% Plot each subject's overall blinks/min
subjectColors = jet(numberSubjects);
myTitle = [experiment ' overall blink rate (n = ' ...
           num2str(numberSubjects) ' subjects)'];
figure('Color', [1, 1, 1], 'Name', myTitle);
hold on
for s = 1:numberSubjects
    positions = positionsBySubject{s};
    starts = cell2mat({blinks(positions).startTime});
    [sortStart, sortInd] = sort(starts);
    sortedPositions = positions(sortInd);
    sortStart = (sortStart - sortStart(1))*24*60;
    if sum(sortStart > 24*60) > 1
        fprintf('Subject %d runs on multiple days and is skipped\n', n);
        continue;
    end
    durations = durationsBySubject{s};
    durations = durations(sortInd);
    plot(durations, 'Marker', 's', 'LineStyle', '--', 'Color', subjectColors(s, :),  'LineWidth', 2)
end

hold off
xlabel('Task ordered by time')
ylabel(['Blinks/min in ' num2str(baseInterval) ' minutes'])
title(myTitle);
box on


%% Do overall blinks/min organized by task
[taskIndex, uniqueSubjects, uniqueTasks] = getSubjectTaskIndex(blinks);

%% Plot by subject organized by task
numberSubjects = length(uniqueSubjects);
numberTasks = length(uniqueTasks);
subjectColors = jet(numberSubjects);
blinksPerMin = zeros(numberSubjects, numberTasks);
theTitle = 'Shooter blinks/min organized by subject';
figure('Color', [1, 1, 1], 'Name', theTitle);
hold on
for s = 1:numberSubjects
    subject = uniqueSubjects{s};
    blinksPerMin(s, :) = blinksOverall(taskIndex(s, :))';
    plot(blinksPerMin(s, :), 's--', 'Color', subjectColors(s, :), 'LineWidth', 2)
end
hold off
xlabel('Task')
set(gca, 'XTick', 1:numberTasks, 'XTickLabel', uniqueTasks)
legend(uniqueSubjects)
ylabel('Blinks/Min')
title(theTitle)

%% Show by sorted subject organized by task tasks sorted by most blinks
subjectShapes = {'o', '+', '*', 'x', 's', 'd', '^', 'v', '>', '<', 'p', 'h', 's', 'd'};
meanBlinksPerTask = mean(blinksPerMin, 1);
meanBlinksPerSubject = mean(blinksPerMin, 2);
[~, taskInd] = sort(meanBlinksPerTask);
[~, subjectInd] = sort(meanBlinksPerSubject);
sortedSubjects = uniqueSubjects(subjectInd);
sortedShapes = subjectShapes(subjectInd);
theTitle = [experiment ' [' type '] blinks/min organized by sorted subject'];
figure('Color', [1, 1, 1], 'Name', theTitle);
hold on
for s = 1:numberSubjects
    thisSubject = subjectInd(s);
    theseBlinks = blinksPerMin(thisSubject, :);
    theseBlinks = theseBlinks(taskInd);
    plot(theseBlinks, '--', 'Marker', sortedShapes{s}, ...
        'MarkerSize', 10, ...
        'Color', subjectColors(s, :), 'LineWidth', 2)
end
hold off
xlabel('Task')
set(gca, 'XTick', 1:numberTasks, 'XTickLabel', uniqueTasks(taskInd))
legend(sortedSubjects, 'Location', 'WestOutside')
ylabel('Blinks/Min')
title(theTitle)
box on
%% Show by task sorted by most blinks
taskShapes = {'^', 'd', 'd', 'd', 'd', 'o', 'o', 's', 's', 's', 's'};
taskColors = jet(numberTasks);
meanBlinksPerTask = mean(blinksPerMin, 1);
meanBlinksPerSubject = mean(blinksPerMin, 2);
[~, taskInd] = sort(meanBlinksPerTask);
[~, subjectInd] = sort(meanBlinksPerSubject);
sortedSubjects = uniqueSubjects(subjectInd);
sortedTasks = uniqueTasks(taskInd);
sortedShapes = taskShapes(taskInd);
theTitle = [experiment ' [' type '] blinks/min organized by sorted task'];
figure('Color', [1, 1, 1], 'Name', theTitle);
hold on
for s = 1:numberTasks
    thisTask = taskInd(s);
    theseBlinks = blinksPerMin(:, thisTask);
    theseBlinks = theseBlinks(subjectInd);
    plot(theseBlinks, '--', 'Marker', sortedShapes{s}, ...
        'MarkerSize', 10, ...
        'Color', taskColors(s, :), 'LineWidth', 2)
end
hold off
xlabel('Subject')
set(gca, 'XTick', 1:numberSubjects, 'XTickLabel', sortedSubjects)
legend(sortedTasks, 'Location', 'WestOutside')
ylabel('Blinks/Min')
title(theTitle)
box on
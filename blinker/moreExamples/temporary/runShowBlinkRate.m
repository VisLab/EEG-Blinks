%% This script displays various graphs summarizing blink statistics
individual = 0;
%type = 'IC';
%type = 'EOGUnref';
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

% %% NCTU blinks
% type = 'IC';
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';

%% Shooter blinks
collectionType = 'FILES2';
experiment = 'Shooter';
blinkDir = 'K:\CTAData\Shooter\ShooterBlinks';
type = 'ChannelUnref';
%% Set up the files for the collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
blinkSummaryFile = [experiment 'BlinksNewSummary' type '.mat'];

%% Load the blink summary file
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);
load([blinkDir filesep blinkSummaryFile]);

%%
numberSubjects = length(blinkProperties);
offsetFactor = 3;
runIntervals = [60, 180, 300];
numberCases = length(runIntervals);
blinkCounts = cell(numberSubjects, numberCases);
for m = 1:numberSubjects 
   if ~isa(blinkProperties{m}, 'struct') && ...
       (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
       fprintf('Subject %d does not have blink properties\n', m);
       continue;
   end   
   peaks = cellfun(@double, {blinkProperties{m}.blinkPeakTime});
   timeRange = [0, size(blinks(m).blinkComponents, 2)/blinks(m).srate];
   for n = 1:numberCases
      windowOffset = floor(runIntervals(n)/offsetFactor);
      blinkCounts{m, n} = getBlinkRate(peaks, runIntervals(n), windowOffset, timeRange);
   end
end

%% Plot the counts for this
theColors = jet(numberSubjects);
for n = 1:numberCases
    baseInterval = runIntervals(n)/60; % Convert to minutes
    myTitle = [experiment ' blink rate (n = ' num2str(numberSubjects) ...
        ' subjects)'];
    figure('Color', [1, 1, 1], 'Name', myTitle);
    hold on
    for m = 1:numberSubjects
        if ~isa(blinkProperties{m}, 'struct') && ...
           (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
           continue;
        end   
        plot(blinkCounts{m, n}, 'Color', theColors(m, :), 'LineWidth', 2)
    end
    hold off
    xlabel('Minutes')
    ylabel(['Average blinks in ' num2str(baseInterval) ' minutes'])
    box on
end
%% Plot the max, min and median blink counts by subject
maxCounts = zeros(numberSubjects, numberCases);
minCounts = zeros(numberSubjects, numberCases);
medianCounts = zeros(numberSubjects, numberCases);
meanCounts = zeros(numberSubjects, numberCases);
stdCounts = zeros(numberSubjects, numberCases);
iqrCounts = zeros(numberSubjects, numberCases);
for m = 1:numberSubjects
    if ~isa(blinkProperties{m}, 'struct') && ...
           (isempty(blinkProperties{m}) || isnan(blinkProperties{m}))
       continue;
    end   
    for n = 1:numberCases
        if isempty(blinkCounts{m, n})
            continue;
        elseif sum(isnan(blinkCounts{m, n})) == length(blinkCounts{m, n})
            continue;
        end
            
        maxCounts(m, n) = max(blinkCounts{m, n});
        minCounts(m, n) = min(blinkCounts{m, n});
        medianCounts(m, n) = median(blinkCounts{m, n});
        meanCounts(m, n) = mean(blinkCounts{m, n});
        stdCounts(m, n) = std(blinkCounts{m, n});
    end
end
subjects = (1:numberSubjects)';
%%
caseLegend = cell(numberCases, 1);

for n = 1:numberCases
    caseLegend{n} = num2str(runIntervals(n));
end

%%
subjectsExpanded = repmat(subjects, 1, size(medianCounts, 2));
figure 
hold on
errorbar(subjectsExpanded, medianCounts, minCounts, maxCounts, ...
        's', 'MarkerSize', 10, 'LineWidth', 1.5)
plot(subjects, meanCounts, 'ro', 'LineWidth', 1.5)
xlabel('Subject')
ylabel('Blinks/5 minutes')
hold off
box on
%%
[sortMeans, sortIndex] = sort(meanCounts);
sortStds = stdCounts(sortIndex);
sortSubjects = subjects(sortIndex);
%%

figure
errorbar(sortMeans, sortStds, 's', 'MarkerSize', 10, 'LineWidth', 1.5)

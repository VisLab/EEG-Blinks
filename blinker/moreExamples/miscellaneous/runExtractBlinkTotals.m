%% Computes blink totals for a given list of tasks.  Successful datasets
% match the task and have a 
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% VEP setup
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% Miscellaneous
% blinkDir = 'D:\Research\BlinkerLeftovers\VideoHTML';
% blinkFile = 'ARL_BCIT_T1_M051_S1026PREPICABlinks.mat';
% blinkStatsFiles = 'ARL_BCIT_T1_M051_S1026PREPICAStatsOut.mat';

% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
% blinkFile = 'LSIEBlinks.mat';
% blinkStatsFiles = 'LSIEStatsOut.mat';

%% BCIT Examples
% collectionType = 'FILES';
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinks';

type = 'ChannelUnref';
taskList = {'X1', 'X2', 'X3', 'X4', 'X6', 'X7', 'X8', 'XB', 'XC'};
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinks';
doChannelCounts = true;
closedTask = '';
openTask = '';
% %type = 'EOG';
% type = 'IC';
% blinkDir = 'O:\ARL_Data\BCITBlinks';
% %blinkDir = 'K:\BCITBlinks';
% experiment = 'Experiment X2 Traffic Complexity';
% experiment = 'Experiment X6 Speed Control';
% experiment = 'X3 Baseline Guard Duty';
% experiment = 'X4 Advanced Guard Duty';
% experiment = 'X1 Baseline RSVP';
%experiment = 'Experiment XC Calibration Driving';
%experiment = 'Experiment XB Baseline Driving';
% experiment = 'X2 RSVP Expertise';

%% BCI2000
% type = 'Channel';
% taskList = { ...
%          'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
%          'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
%          'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet'};
% closedTask = 'EyesClosed';
% openTask = 'EyesOpen';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
% doChannelCounts = true;
%% VEP
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% experiment = 'VEP';

%% NCTU
% type = 'Channel';
% taskList = {'motion', 'motionless'};
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% doChannelCounts = true;

% %% UMICH LSIE
% %type = 'Channel';
% type = 'IC';
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';

%% Shooter
% type = 'ChannelUnref';
% taskList = {'ARIT', 'SEF2', 'SEF4', 'SEO2', 'SEO4', ...
%     'DEF2', 'DEF4', 'DEO2', 'DEO4'};
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
% doChannelCounts = true;
% closedTask = 'EC';
% openTask = 'EO';


%% Update file names with the experiment
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkTotalsFile = [experiment 'BlinksNewTotal' type '.mat'];
%% Load the data
load([blinkDir filesep blinkFile]);

%% Calculate the totals
blinkTotals = struct('experiment', [], 'datasets', [], 'subjects', [],...
                     'taskNames', [], 'taskDatasets', [], ...
                     'totalHours', [], 'taskHours', [], ...
                     'successful', [], 'successfulHours', [], ...
                     'totalBlinks', [], 'blinksMin', [], 'totalGood', [], ...
                     'goodBlinksMin', []); 
channelCounts = struct();
taskDatasets = 0;
totalMinutes = 0;
taskMinutes = 0;
successfulMinutes = 0;
goodBlinks = 0;
totalBlinks = 0;
unsuccessful = 0;
successful = 0;
blinkTotals.experiment = experiment;
blinkTotals.datasets = length(blinks);
blinkTotals.taskNames = taskList;
taskList = lower(taskList);
blinkTotals.subjects = unique({blinks.subjectID});
for n = 1:length(blinks)
    fprintf('Dataset %d:\n', n);
    dBlinks = blinks(n);
    thisSize = size(dBlinks.blinkComponents, 2)./(dBlinks.srate * 60);
    totalMinutes = totalMinutes + thisSize;
    matchTask = intersect(taskList, lower(dBlinks.task));
    if isempty(matchTask)
        continue;
    end
    taskDatasets = taskDatasets + 1;
    taskMinutes = taskMinutes + thisSize;    
    if isempty(dBlinks.usedComponent) || isnan(dBlinks.usedComponent)
        unsuccessful = unsuccessful + 1;
        continue;
    end
    successful = successful + 1;
    successfulMinutes = successfulMinutes + thisSize;
    thisPos = find(dBlinks.componentIndices == dBlinks.usedComponent, 1, 'first');
    totalBlinks = totalBlinks + dBlinks.numberBlinks(thisPos);
    goodBlinks = goodBlinks + dBlinks.goodBlinks(thisPos);
    if doChannelCounts == true
        channelIndices = dBlinks.blinkInfo.channelIndices;
        channelLabels = dBlinks.blinkInfo.channelLabels;
        thisPos = find(channelIndices == dBlinks.usedComponent, 1, 'first');
        thisLabel = lower(channelLabels{thisPos});
        if ~isfield(channelCounts, thisLabel)
            channelCounts.(thisLabel) = 0;
        end
        channelCounts.(thisLabel) = channelCounts.(thisLabel) + 1;
    end
end

%% Now finalize the values
blinkTotals.taskDatasets = taskDatasets;
blinkTotals.totalHours = totalMinutes/60;
blinkTotals.taskHours = taskMinutes/60;
blinkTotals.successful = successful;
blinkTotals.successfulHours = successfulMinutes/60;
blinkTotals.totalBlinks = totalBlinks;
blinkTotals.blinksMin = totalBlinks/successfulMinutes;
blinkTotals.totalGood = goodBlinks;
blinkTotals.goodBlinksMin = goodBlinks/successfulMinutes;

%% Now deal with eyes open and eyes closed tasks if specified
if ~isempty(closedTask)
    allTasks = {blinks.task};
    taskMask = strcmpi(allTasks, closedTask);
    closedBlinks = blinks(taskMask);
    usedComponents = cell2mat({closedBlinks.usedComponent});
    closedCounts = zeros(length(usedComponents), 2);
    for k = 1:length(usedComponents)
        used = closedBlinks(k).usedComponent;
        if isempty(used) || isnan(used)
            continue;
        end
        thisPos = find(closedBlinks(k).componentIndices == used, 1, 'first');
        closedCounts(k, 1) = closedBlinks(k).numberBlinks(thisPos);
        closedCounts(k, 2) = closedBlinks(k).goodBlinks(thisPos);
        numMinutes = size(closedBlinks(k).blinkComponents, 2)./...
                         (closedBlinks(k).srate * 60);
        closedCounts(k, :) = closedCounts(k, :)/numMinutes;
    end
else
    closedCounts = [];
end

if ~isempty(openTask)
    allTasks = {blinks.task};
    taskMask = strcmpi(allTasks, openTask);
    openBlinks = blinks(taskMask);
    usedComponents = cell2mat({openBlinks.usedComponent});
    openCounts = zeros(length(usedComponents), 2);
    for k = 1:length(usedComponents)
        used = openBlinks(k).usedComponent;
        if isempty(used) || isnan(used)
            continue;
        end
        thisPos = find(openBlinks(k).componentIndices == used, 1, 'first');
        openCounts(k, 1) = openBlinks(k).numberBlinks(thisPos);
        openCounts(k, 2) = openBlinks(k).goodBlinks(thisPos);
        numMinutes = size(openBlinks(k).blinkComponents, 2)./...
                         (openBlinks(k).srate * 60);
        openCounts(k, :) = openCounts(k, :)/numMinutes;
    end
else
    openCounts = [];
end
%% Save the property structures in a file
save([blinkDir filesep blinkTotalsFile], 'blinkTotals', 'channelCounts', '-v7.3');
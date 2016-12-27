%% Computes blink totals for a given list of tasks.  Successful datasets
% match the task and have a 
pop_editoptions('option_single', false, 'option_savetwofiles', false);
doSignalCounts = true;
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
% blinkDir = 'O:\ARL_Data\BCITBlinksNew';
% %type = 'EOGUnrefNew';
% type = 'ChannelUnrefNewBoth';
% taskList = {'T2X1', 'T2X2', 'T2X3', 'T2X4', 'T2X6', 'T2X7', 'T2X8', ...
%             'T3X1', 'T3X2', 'T3X3', 'T3X4', 'XB', 'XC'};
% closedTask = '';
% openTask = '';
% 
% type = 'ChannelUnref';

% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinks';
% doChannelCounts = true;
% closedTask = '';
% openTask = '';
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
type = 'Channel';
taskList = { ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet'};
closedTask = 'EyesClosed';
openTask = 'EyesOpen';
experiment = 'BCI2000';
blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
doChannelCounts = true;
%% VEP
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% experiment = 'VEP';

%% NCTU
% type = 'ChannelMastNew';
% taskList = {'motion', 'motionless'};
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
% experiment = 'NCTU_LK';
% doChannelCounts = true;
% closedTask = '';
% openTask = '';
% %% UMICH LSIE
% %type = 'Channel';
% type = 'IC';
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';

%% Shooter
% type = 'EOGUnrefNew';
% taskList = {'ARIT', 'SEF2', 'SEF4', 'SEO2', 'SEO4', ...
%     'DEF2', 'DEF4', 'DEO2', 'DEO4'};
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
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
signalCounts = struct();
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
    thisSize = size(dBlinks.candidateSignals, 2)./(dBlinks.srate * 60);

    matchTask = intersect(taskList, lower(dBlinks.task));
    if isempty(matchTask)
        continue;
    end
    totalMinutes = totalMinutes + thisSize;
    taskDatasets = taskDatasets + 1;
    if isempty(dBlinks.usedSignal) || isnan(dBlinks.usedSignal)
        unsuccessful = unsuccessful + 1;
        continue;
    end
    
    taskMinutes = taskMinutes + thisSize;    
    successful = successful + 1;
    successfulMinutes = successfulMinutes + thisSize;
    thisPos = find(dBlinks.signalIndices == dBlinks.usedSignal, 1, 'first');
    totalBlinks = totalBlinks + dBlinks.numberBlinks(thisPos);
    goodBlinks = goodBlinks + dBlinks.goodBlinks(thisPos);
    if doSignalCounts == true
        signalIndices = dBlinks.signalInfo.signalIndices;
        signalLabels = dBlinks.signalInfo.signalLabels;
        thisPos = find(signalIndices == dBlinks.usedSignal, 1, 'first');
        thisLabel = lower(signalLabels{thisPos});
        if ~isfield(signalCounts, thisLabel)
            signalCounts.(thisLabel) = 0;
        end
        signalCounts.(thisLabel) = signalCounts.(thisLabel) + 1;
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
    usedSignals = cell2mat({closedBlinks.usedSignal});
    closedCounts = zeros(length(usedSignals), 2);
    for k = 1:length(usedSignals)
        used = closedBlinks(k).usedSignal;
        if isempty(used) || isnan(used)
            continue;
        end
        thisPos = find(closedBlinks(k).signalIndices == used, 1, 'first');
        closedCounts(k, 1) = closedBlinks(k).numberBlinks(thisPos);
        closedCounts(k, 2) = closedBlinks(k).goodBlinks(thisPos);
        numMinutes = size(closedBlinks(k).signalCandidates, 2)./...
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
    usedSignals = {openBlinks.usedSignal};
    usedSignals = cellfun(@double, usedSignals);
    openCounts = zeros(length(usedSignals), 2);
    for k = 1:length(usedSignals)
        used = openBlinks(k).usedSignal;
        if isempty(used) || isnan(used)
            continue;
        end
        thisPos = find(openBlinks(k).signalIndices == used, 1, 'first');
        openCounts(k, 1) = openBlinks(k).numberBlinks(thisPos);
        openCounts(k, 2) = openBlinks(k).goodBlinks(thisPos);
        numMinutes = size(openBlinks(k).candidateSignals, 2)./...
                         (openBlinks(k).srate * 60);
        openCounts(k, :) = openCounts(k, :)/numMinutes;
    end
else
    openCounts = [];
end
%% Save the property structures in a file
save([blinkDir filesep blinkTotalsFile], 'blinkTotals', 'signalCounts', '-v7.3');
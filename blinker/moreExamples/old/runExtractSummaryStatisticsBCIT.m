%% Extract the summary statistics for a collection of datasets 
%
% This script assumes that a filelist is provided and that the blink
% structures have already been computed using a function such as
% pop_blinker.  The goal is to put all of the statistics for the collection
% into a single file for display and analysis purposes.
%


%% BCIT counts
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
excludedTasks = {};
typeBlinks = 'AllUnrefNewBothBlinks';
summaryDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
summaryFile = 'BCITLevel0AllUnrefNewBothBlinksSummary.mat';
blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
blinkDirInd = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';

%% BCI2000 counts
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% excludedTasks = {'EyesOpen', 'EyesClosed'};
% typeBlinks = 'AllMastNewBothCombined';
% summaryFile = 'BCI2000AllMastNewBothCombinedSummary.mat';
% summaryDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
% blinkDirInd = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored\AllMastNewBothCombined';

%% Shooter counts
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% experiment = 'Shooter';
% excludedTasks = {'EC', 'EO'};
% typeBlinks = 'AllMastNewBothCombined';
% summaryDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% summaryFile = 'ShooterAllMastNewBothCombinedSummary.mat';
% blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
% blinkDirInd = [blinkDir filesep typeBlinks];

%% NCTU counts
% blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% experiment = 'NCTU_LK';
% excludedTasks = {};
% typeBlinks = 'AllMastNewBoth';
% summaryDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% summaryFile = 'NCTU_LKAllMastNewBothSummary.mat';
% blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
% blinkDirInd = [blinkDir filesep typeBlinks];

%% Get the files from the base directory
inList = dir(blinkDirInd);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
fileNames = dirNames(~dirTypes);
numberActualFiles = length(fileNames);

%% Load the baseline blink file list
load(blinkFileList);

%% Set up the mapping
numberFiles = length(blinkFiles);
fileMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
for k = 1:numberActualFiles
    fileMap(fileNames{k}) = k;
end

%% Fill in an empty structure for efficiency
blinkStatisticsSummary(numberFiles) = extractBlinkStatistics();
for k = 1:numberFiles - 1
    blinkStatisticsSummary(k) = extractBlinkStatistics();
end

%% Now read in the individual files and process
mapGood = containers.Map('KeyType', 'char', 'ValueType', 'any');
mapMarginal = containers.Map('KeyType', 'char', 'ValueType', 'any');
fileMask = true(numberFiles, 1);
nanMask = false(numberFiles, 1);

for k = 1:numberFiles
    clear blinks blinkFits blinkProperties blinkStatistics params;
    thisFile = [blinkFiles(k).blinkFileName '_' typeBlinks '.mat'];
    if ~isKey(fileMap, thisFile)
        fileMask(k) = false;
        warning('---%s does not have a blink file\n', thisFile); 
        continue;
    end
    actualPos = fileMap(thisFile);
    fileName = [blinkDirInd filesep thisFile];
    fprintf('Loading %s...\n', thisFile);
    load (fileName);
    if ~exist('blinks', 'var')
        fileMask(k) = false;
        warning('---%s does not contain blink structures\n', fileName);
        continue;
    elseif sum(strcmpi(excludedTasks, blinks.task)) > 0
        fileMask(k) = false;
        warning('---%s has excluded task %s\n', fileName, blinks.task);
        continue;
    elseif isnan(blinks.usedSignal) || isempty(blinks.usedSignal)
        nanMask(k) = true;
        warning('---%s does not have blinks\n', fileName);
        continue;
    elseif ~exist('blinkStatistics', 'var') || isempty(blinkStatistics)
        nanMask(k) = true;
        warning('---%s does not have blinkStatistics\n', fileName);
        continue;
    end
    blinkStatisticsSummary(k) = blinkStatistics;
    sData = blinks.signalData;
    signalNumbers = cellfun(@double, {sData.signalNumber});
    pos = find(signalNumbers == abs(blinks.usedSignal), 1, 'first');
    theLabel = lower(sData(pos).signalLabel);
    if strcmpi(blinkStatisticsSummary(k).status, 'marginal')
        if isKey(mapMarginal, theLabel)
            theCount = mapMarginal(theLabel);
        else
            theCount = 0;
        end
        theCount = theCount + 1;
        mapMarginal(theLabel) = theCount;    
    elseif strcmpi(blinkStatisticsSummary(k).status, 'good')
        if isKey(mapGood, theLabel)
            theCount = mapGood(theLabel);
        else
            theCount = 0;
        end
        theCount = theCount + 1;
        mapGood(theLabel) = theCount;
        blinkStatisticsSummary(k).status = 'good';
    end
end


%% Save the file
save([summaryDir filesep summaryFile], ...
    'blinkStatisticsSummary', 'mapGood', 'mapMarginal', 'nanMask', 'fileMask', '-v7.3');

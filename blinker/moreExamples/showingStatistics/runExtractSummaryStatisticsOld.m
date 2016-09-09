%% Script to calculate breakdown of select channels and blink totals
% Requires the blinks data structures to have been computed.

%% BCIT counts
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
% excludedTasks = {};
% typeBlinks = 'AllUnrefNewBothBlinks';
% summaryDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
% summaryFile = 'BCITLevel0AllUnrefNewBothBlinksSummary.mat';
% blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
% blinkDirInd = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';

%% BCI2000 counts
experiment = 'BCI2000';
blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
excludedTasks = {'EyesOpen', 'EyesClosed'};
typeBlinks = 'AllMastNewBothCombined';
summaryFile = 'BCI2000AllMastNewBothCombinedSummary.mat';
summaryDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
blinkDirInd = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored\AllMastNewBothCombined';

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

%% Shooter examples
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRevised';
% experiment = 'Shooter';
% %typeBlinks = 'ChannelUnrefNewBothCombined';
% typeBlinks = 'EOGUnrefNewBothCombined';
% excludeTasks = {'EO', 'EC'};

%% Read in the blink data for this collection

%% Initialize
blinkSummary(numberFiles) = struct( 'blinkFileName', nan, ...
    'subjectID', nan, 'task', nan, 'uniqueName', nan, ...
    'srate', nan, 'startTime', nan, ...
    'usedNumber', nan, 'usedLabel', nan, 'status', nan, ...
    'seconds', nan, 'numberBlinks', nan, 'numberGoodBlinks', nan, ... ...
    'goodRatio', nan, 'header', nan, ...
    'pAVRZ', nan, 'nAVRZ', nan, 'durationZ', nan, ...
    'durationB', nan, 'durationT', nan, ...
    'durationHZ', nan, 'durationHB', nan, 'blinksPerMin', nan);

headers = {'mean', 'median', 'std', 'mad', 'goodMean', 'goodMedian', ...
           'goodStd', 'goodMad'};
for k = 1:numberFiles - 1
    blinkSummary(k) = blinkSummary(numberFiles);
end

%% Now read in the individual files and process
correlationThreshold = 0.98;
mapGood = containers.Map('KeyType', 'char', 'ValueType', 'any');
mapMarginal = containers.Map('KeyType', 'char', 'ValueType', 'any');
fileMask = true(numberFiles, 1);
nanMask = false(numberFiles, 1);

for k = 1:numberFiles
    clear blinks blinkFits blinkProperties params;
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
    end

    %% Now the summary fields
    sData = blinks.signalData;
    signalNumbers = cellfun(@double, {sData.signalNumber});
    pos = find(signalNumbers == abs(blinks.usedSignal), 1, 'first');
    theLabel = lower(sData(pos).signalLabel);
    blinkSummary(k).blinkFileName = thisFile;
    blinkSummary(k).subjectID = blinks.subjectID;
    blinkSummary(k).task = blinks.task;
    blinkSummary(k).srate = blinks.srate;
    blinkSummary(k).startTime = blinks.startTime;
    blinkSummary(k).uniqueName = blinks.uniqueName;
    blinkSummary(k).usedNumber = abs(blinks.usedSignal);
    blinkSummary(k).usedLabel = theLabel;
    blinkSummary(k).seconds = length(sData(pos).signal)/blinks.srate;
    blinkSummary(k).numberBlinks = sData(pos).numberBlinks;
    blinkSummary(k).numberGoodBlinks = sData(pos).numberGoodBlinks;
    blinkSummary(k).goodRatio = sData(pos).goodRatio;
    blinkSummary(k).header = headers;
    if blinks.usedSignal < 0
        if isKey(mapMarginal, theLabel)
            theCount = mapMarginal(theLabel);
        else
            theCount = 0;
        end
        theCount = theCount + 1;
        mapMarginal(theLabel) = theCount;
        blinkSummary(k).status = 'marginal';
    else
        if isKey(mapGood, theLabel)
            theCount = mapGood(theLabel);
        else
            theCount = 0;
        end
        theCount = theCount + 1;
        mapGood(theLabel) = theCount;
        blinkSummary(k).status = 'good';
    end
    blinkSummary(k).pAVRZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'pAVRZ', correlationThreshold);
    blinkSummary(k).nAVRZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'nAVRZ', correlationThreshold);
    blinkSummary(k).durationZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationZ', correlationThreshold);
    blinkSummary(k).durationB = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationB', correlationThreshold);
    blinkSummary(k).durationT = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationT', correlationThreshold);
    blinkSummary(k).durationHZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationHZ', correlationThreshold);
    blinkSummary(k).durationHB = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationHB', correlationThreshold);
    blinkSummary(k).blinksPerMin = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'blinksPerMin', correlationThreshold);
end

%% Now save the summary information


%% Save the file
save([summaryDir filesep summaryFile], ...
    'blinkSummary', 'mapGood', 'mapMarginal', 'nanMask', 'fileMask', '-v7.3');

%% Script to calculate breakdown of select channels and blink totals
% Requires the blinks data structures to have been computed.

%% BCIT counts
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinksNew';
% typeBlinks = 'EOGUnrefNewBoth';
% %typeBlinks = 'ChannelUnrefNewBoth';
% excludeTasks = {};

%% BCI2000 counts
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
% excludeTasks = {'EyesOpen', 'EyesClosed'};
% typeBlinks = 'ChannelMastNewBothCombined';

%% Shooter counts
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored\AllMastNewBothCombined';
excludedTasks = {'EC', 'EO'};
summaryDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
summaryFile = 'ShooterAllMastNewBothCommbined.mat';

%% NCTU counts
% blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored\AllMastNewBoth';
% excludedTasks = {};
% summaryDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% summaryFile = 'NCTU_LKAllMastNewBothSummary.mat';

%% Get the files from the base director
inList = dir(blinkDir);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
fileNames = dirNames(~dirTypes);
numFiles = length(fileNames);
fileMask = true(numFiles, 1);
nanMask = false(numFiles, 1);
%% Shooter examples
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRevised';
% experiment = 'Shooter';
% %typeBlinks = 'ChannelUnrefNewBothCombined';
% typeBlinks = 'EOGUnrefNewBothCombined';
% excludeTasks = {'EO', 'EC'};

%% Now read in the individual files and process
blinkIndices = cell(numFiles, 1);
blinkCount = 0;
for k = 1:numFiles
    clear blinks blinkFits blinkProperties params;
    fileName = [blinkDir filesep fileNames{k}];
    fprintf('Loading %s...\n', fileNames{k});
    lTemp = load (fileName);
    blinks = lTemp.blinks;
    blinkFits = lTemp.blinkFits;
    blinkProperties = lTemp.blinkProperties;
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
    values = zeros(length(blinkProperties), 8);
    [~, ~, ~, ~, values(:, 1)] = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'pAVRZ', correlationThreshold);
    [~, ~, ~, ~, values(:, 2)] = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'nAVRZ', correlationThreshold);
        [~, ~, ~, ~, values(:, 2)] = getOcularIndex(blinks, blinkProperties, ...
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
blinkSummary = blinkSummary(fileMask);
nanMask = nanMask(fileMask);
save([summaryDir filesep summaryFile], ...
    'blinkSummary', 'mapGood', 'mapMarginal', 'nanMask', '-v7.3');

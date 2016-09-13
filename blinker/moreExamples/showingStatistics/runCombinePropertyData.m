%% Script to combine the blink properties of all datasets in a collection
% This script is useful to computing overall histograms and distributions
%% BCIT counts
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
typeBlinks = 'AllUnrefNewBothBlinks';
excludedTasks = {};
propertiesDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
propertiesFile = 'BCITLevel0AllUnrefNewBothBlinksProperties.mat';
blinkDirInd = 'O:\ARL_Data\BCITBlinksNewRefactored\AllUnrefNewBoth';

%% BCI2000 counts
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% excludedTasks = {'EyesOpen', 'EyesClosed'};
% typeBlinks = 'AllMastNewBothCombined';
% propertiesFile = 'BCI2000AllMastNewBothCombinedProperties.mat';
% propertiesDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% blinkDirInd = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored\AllMastNewBothCombined';

%% Shooter counts
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% excludedTasks = {'EC', 'EO'};
% experiment = 'Shooter';
% typeBlinks = 'AllMastNewBothCombined';
% propertiesDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% propertiesFile = 'ShooterAllMastNewBothCombinedProperties.mat';
% blinkDirInd = [blinkDir filesep typeBlinks];

%% NCTU counts
% blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% experiment = 'NCTU_LK';
% excludedTasks = {};
% typeBlinks = 'AllMastNewBoth';
% propertiesDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% propertiesFile = 'NCTU_LKAllMastNewBothProperties.mat';
% blinkDirInd = [blinkDir filesep typeBlinks];

%% Get the files from the base directory
inList = dir(blinkDirInd);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
fileNames = dirNames(~dirTypes);
numberActualFiles = length(fileNames);

%% Set the cell array of properties
bProperties = cell(numberActualFiles, 1);
bNames = cell(numberActualFiles, 1);
totalBlinks = 0;

%% Read in the files
badFiles = true(numberActualFiles, 1);
marginalMask = false(numberActualFiles, 1);
for k = 1:numberActualFiles
    clear blinks blinkFits blinkProperties params;
    thisFile = [blinkDirInd filesep fileNames{k}];
    fprintf('Loading %s...\n', thisFile);
    load (thisFile);
    if ~exist('blinks', 'var')
        warning('---%s does not contain blink structures\n', thisFile);
        continue;
    elseif sum(strcmpi(excludedTasks, blinks.task)) > 0
        warning('---%s has excluded task %s\n', thisFile, blinks.task);
        continue;
    elseif isnan(blinks.usedSignal) || isempty(blinks.usedSignal)
        warning('---%s does not have blinks\n', thisFile);
        continue;
    end
    badFiles(k) = false;
    bProperties{k} = blinkProperties;
    bNames{k} = blinks.uniqueName;
    totalBlinks = totalBlinks + length(blinkProperties);
    if blinks.usedSignal < 0
        marginalMask(k) = true;
    end
end

%% Save the file
save([propertiesDir filesep propertiesFile], ...
    'bProperties', 'bNames', 'totalBlinks', 'badFiles', 'marginalMask', '-v7.3');

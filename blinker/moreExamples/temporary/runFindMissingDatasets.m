%% Script to see which datasets are missing

%% BCIT counts
blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
typeBlinks = 'AllUnrefNewBoth';
experiment = 'BCITLevel0';
blinkFileList = [blinkDir filesep experiment typeBlinks 'FileList.mat'];
blinkIndDir = [blinkDir filesep experiment typeBlinks];
excludedTasks = {};

%% Get the files from the base directory
inList = dir(blinkIndDir);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
fileNames = dirNames(~dirTypes);
numFiles = length(fileNames);

%% Create a map of the file names
mapDone = containers.Map('KeyType', 'char', 'ValueType', 'any');
for k = 1:length(fileNames)
    [thePath, theName, theExt] = fileparts(fileNames{k});
    mapDone(theName) = true;
end

%% Load the file list
load(blinkFileList);

for k = 1:length(blinkFiles)
    if strcmpi(excludedTasks, blinkFiles(k).task)
        continue;
    end
    [thePath, theName, theExt] = fileparts(blinkFiles(k).blinkFileName);
    if ~isKey(mapDone, theName)
        fprintf('%d: %s\n', k, blinkFiles(k).blinkFileName);
    end
end

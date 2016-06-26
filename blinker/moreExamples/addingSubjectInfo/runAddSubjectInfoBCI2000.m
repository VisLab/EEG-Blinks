%% NCTU - get the files and subjects
organizationType = 'BCI2000';
type = 'Channel';
undoReference = false;
collectionType = 'FILES';
experiment = 'BCI2000';
pathName = 'O:\ARL_Data\BCI2000\BCI2000Robust_1Hz_Unfiltered';
blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
metadataRoot = 'E:\CTA_DATA\BCI2000';

%% Load the blinks data and the metadata
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);
load([metadataRoot filesep 'BCI2000Metadata.mat']);

%% Replicate handling
replicateMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
numberFiles = length(blinks);

tasks = {'EyesOpen', 'EyesClosed', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet'};
%% Create the new structure

for k = 1:numberFiles
    [thePath, theName, theExt] = fileparts(blinks(k).fileName);
    subject = theName(1:4);
    task = tasks{str2double(theName(end - 1:end))};
    blinks(k).task = task; %#ok<*SAGROW>
    blinks(k).subjectID = subject;
    blinks(k).experiment = experiment;
    blinks(k).startTime = timeMap(theName);

    blinks(k).uniqueName = [subject '_'  task];  
    if isKey(replicateMap, blinks(k).uniqueName)
        theValue = replicateMap(blinks(k).uniqueName);
        theValue(end + 1) = k; 
    else
        theValue = k;
    end
    replicateMap(blinks(k).uniqueName) = theValue;    
end

%% Now add the replicate markers to the unique tags
repKeys = keys(replicateMap);
for k = 1:length(repKeys)
    theValues = replicateMap(repKeys{k});
    startTimes = cell2mat({blinks(theValues).startTime});
    [theTimes, theIndices] = sort(startTimes);
    replicates = zeros(length(startTimes), 1);
    for n = 1:length(replicates)
        replicates(theIndices(n)) = n;
    end
    uniqueNames = {blinks(theValues).uniqueName};
    for n = 1:length(replicates)
        blinks(theValues(n)).uniqueName = [uniqueNames{n} '_R' num2str(replicates(n))];
    end
end

%% Save the blinks and blink map
save ([blinkDir filesep blinkFile], 'blinks', '-v7.3');
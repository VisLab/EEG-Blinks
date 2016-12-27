%% Create a file list structure for BCI2000
infoFile = 'E:\CTADATA\BCI2000\AdditionalDocumentation\BCI2000Metadata.mat';
blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
experiment = 'BCI2000';
collectionType =  'FILES2';
typeBlinks = 'AllMastNewBoth';
pathName = 'E:\CTADATA\BCI2000\BCI2000Set';

%% Create the list of files to be processed
fileList  = getFileList(collectionType, pathName);
numFiles = length(fileList);
blinkFiles(numFiles) = createBlinkFileStructure();

%% Create the file name of the output
blinkFileListName = [blinkDir filesep experiment typeBlinks 'FileList.mat'];

%% Load the subject and experiment information
load(infoFile);

%% Replicate handling
replicateMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
tasks = {'EyesOpen', 'EyesClosed', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet', ...
         'RealLRFist', 'ImagLRFist', 'RealFistFeet', 'ImagFistFeet'};
%% Create the new structure
startTimes = zeros(numFiles, 1);
for k = 1:numFiles
    blinkFiles(k).fileName = fileList{k};
    [thePath, theName, theExt] = fileparts(fileList{k});
    subject = theName(1:4);
    task = tasks{str2double(theName(end - 1:end))};
    blinkFiles(k).task = task; %#ok<*SAGROW>
    blinkFiles(k).subjectID = subject;
    blinkFiles(k).experiment = experiment;
    startTimes(k) = timeMap(theName);
    thisTime = datestr(startTimes(k));
    pieces = strsplit(thisTime, ' ');
    blinkFiles(k).startDate = pieces{1};
    if length(pieces) > 1
        blinkFiles(k).startTime = pieces{2};
    end
    blinkFiles(k).uniqueName = [subject '_'  task];
    if isKey(replicateMap, blinkFiles(k).uniqueName)
        theValue = replicateMap(blinkFiles(k).uniqueName);
        theValue(end + 1) = k;
    else
        theValue = k;
    end
    replicateMap(blinkFiles(k).uniqueName) = theValue;
end

%% Now add the replicate markers to the unique tags
repKeys = keys(replicateMap);
for k = 1:length(repKeys)
    theValues = replicateMap(repKeys{k});
    theseTimes = startTimes(theValues);
    [theTimes, theIndices] = sort(theseTimes);
    replicates = zeros(length(theseTimes), 1);
    for n = 1:length(replicates)
        replicates(theIndices(n)) = n;
    end
    uniqueNames = {blinkFiles(theValues).uniqueName};
    for n = 1:length(replicates)
        blinkFiles(theValues(n)).uniqueName = [uniqueNames{n} '_R' num2str(replicates(n))];
    end
end

%% Put all of the files in same directory
for k = 1:numFiles
    blinkFiles(k).blinkFileName = ...
        [blinkFiles(k).experiment '_' blinkFiles(k).uniqueName];
end
%% Save the blinks and blink map
save (blinkFileListName, 'blinkFiles', '-v7.3');
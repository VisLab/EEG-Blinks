%% Create a blinker structure of subject information and file names for BCIT Level0
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% BCIT Examples
%type = 'ChannelUnrefNewBoth';
typeBlinks = 'AllUnrefNewBoth';
dataDir = 'E:\CTADATA\BCIT\level_0';
collectionType = 'FILES';
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';

%% Read the list of files to be processed and the subject map
fileList  = getFileList(collectionType, dataDir);
numFiles = length(fileList);
blinkFiles(numFiles) = createBlinkFileStructure();
load([blinkDir filesep experiment 'SubjectMap.mat']);

%% Create the file name of the output
blinkFileListName = [blinkDir filesep experiment typeBlinks 'FileList.mat'];


%% Construct a file map
fileMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
for s = 1:length(subjectLists)
    theFiles = subjectLists(s).files;
    for f = 1:length(theFiles)
        [thePath, theName, theExt] = fileparts(theFiles{f});
        fileMap(theName) = struct('subject', subjectLists(s).subject, ...
                              'startTime', subjectLists(s).startTimes(f));
    end
end

%% Construct a map with task names
taskMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
taskMap('Experiment X2 Traffic Complexity') = 'T2X2';
taskMap('Experiment X6 Speed Control') = 'T2X6';
taskMap('X3 Baseline Guard Duty') = 'T3X3';
taskMap('X4 Advanced Guard Duty') = 'T3X4';
taskMap('X1 Baseline RSVP') = 'T3X1';
taskMap('Experiment XC Calibration Driving') = 'XC';
taskMap('Experiment XB Baseline Driving') = 'XB';
taskMap('X2 RSVP Expertise') = 'T3X2';
taskMap('X7 Auditory Cueing Driving') = 'T2X7';
taskMap('X8 Mind Wandering Driving') = 'T2X8';
taskMap('T2X2') = 'Experiment X2 Traffic Complexity';
taskMap('T2X6') = 'Experiment X6 Speed Control';
taskMap('T3X3') = 'X3 Baseline Guard Duty';
taskMap('T3X4') = 'X4 Advanced Guard Duty';
taskMap('T3X1') = 'X1 Baseline RSVP';
taskMap('XC') = 'Experiment XC Calibration Driving';
taskMap('XB') = 'Experiment XB Baseline Driving';
taskMap('T3X2') = 'X2 RSVP Expertise';
taskMap('T2X7') = 'X7 Auditory Cueing Driving';
taskMap('T2X8') = 'X8 Mind Wandering Driving';
%% Replicate handling map
replicateMap = containers.Map('KeyType', 'char', 'ValueType', 'any');

%% Create the new structure
missionList = cell(numFiles, 1);
startTimes = zeros(numFiles, 1);
for k = 1:numFiles
    [thePath, theName, theExt] = fileparts(fileList{k});
    if ~isKey(fileMap, theName)
        warning('%d: %s is not in the subject map', k, theName);
    else
        theValue = fileMap(theName);
        blinkFiles(k).subjectID = theValue.subject; %#ok<*SAGROW>
        startTimes(k) = theValue.startTime;
        theDateString = datestr(theValue.startTime);
        pieces = strsplit(theDateString, ' ');
        blinkFiles(k).startDate = pieces{1};
        blinkFiles(k).startTime = pieces{2};
    end
    blinkFiles(k).fileName = fileList{k};
    pieces = strsplit(theName, '_');
    blinkFiles(k).task = pieces{6};
    missionList{k} = [pieces{3} '_' pieces{4}];
    if strcmpi(pieces{6}, 'XB') || strcmpi(pieces{6}, 'XC')
        blinkFiles(k).task = pieces{6};
    else
        blinkFiles(k).task = [pieces{3} pieces{6}];
    end
    blinkFiles(k).experiment = taskMap(blinkFiles(k).task);
    blinkFiles(k).uniqueName = [blinkFiles(k).subjectID '_' blinkFiles(k).task];
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
        blinkFiles(theValues(n)).uniqueName = [uniqueNames{n} ...
          '_R' num2str(replicates(n)) '_' missionList{theValues(n)};];
        blinkFiles(theValues(n)).blinkFileName =  ...
            [experiment '_' blinkFiles(theValues(n)).uniqueName];
    end
end

%% Save the blinks and blink map
save (blinkFileListName, 'blinkFiles', '-v7.3');
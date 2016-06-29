%% This script adds subject information for BCIT to blinks. 
% It assumes that the subject map has already been created.
%
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% BCIT Examples
type = 'ChannelUnref';
%type = 'EOGUnref';
collectionType = 'FILES';
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinks';
%blinkDir = 'K:\BCITBlinks';
%experiment = 'Experiment X2 Traffic Complexity';
% experiment = 'Experiment X6 Speed Control';
% experiment = 'X3 Baseline Guard Duty';
% experiment = 'X4 Advanced Guard Duty';
% experiment = 'X1 Baseline RSVP';
%experiment = 'Experiment XC Calibration Driving';
%experiment = 'Experiment XB Baseline Driving';
% experiment = 'X2 RSVP Expertise';

%% Load the blinks data
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep experiment 'SubjectMap.mat'])

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
%% Set up the temporary blinks file
blinksOld = blinks;
clear blinks;
numberFiles = length(blinksOld);
%% Create the new structure
blinks(numberFiles) = createBlinksStructure();
for k = 1:numberFiles
    blinks(k).fileName = blinksOld(k).fileName;
    blinks(k).srate = blinksOld(k).srate;
    [thePath, theName, theExt] = fileparts(blinksOld(k).fileName);
    if ~isKey(fileMap, theName)
        warning('%d: %s is not in the subject map', k, theName);
    else
        theValue = fileMap(theName);
        blinks(k).subjectID = theValue.subject;
        blinks(k).startTime = theValue.startTime;
    end
    pieces = strsplit(theName, '_');
    blinks(k).task = pieces{6};
    if strcmpi(pieces{6}, 'XB') || strcmpi(pieces{6}, 'XC')
        blinks(k).task = pieces{6};
    else
        blinks(k).task = [pieces{3} pieces{6}];
    end
    blinks(k).experiment = taskMap(blinks(k).task);
    blinks(k).uniqueName = [blinks(k).subjectID '_' blinks(k).task];
    if isKey(replicateMap, blinks(k).uniqueName)
        theValue = replicateMap(blinks(k).uniqueName);
        theValue(end + 1) = k; %#ok<SAGROW>
    else
        theValue = k;
    end
    replicateMap(blinks(k).uniqueName) = theValue; 
    blinks(k).type = blinksOld(k).type;
    blinks(k).componentIndices = blinksOld(k).componentIndices;
    blinks(k).blinkComponents = blinksOld(k).blinkComponents;
    blinks(k).blinkInfo = blinksOld(k).blinkInfo;
    blinks(k).blinkPositions = blinksOld(k).blinkPositions;
    blinks(k).numberBlinks = blinksOld(k).numberBlinks;
    blinks(k).goodBlinks = blinksOld(k).goodBlinks;
    blinks(k).blinkAmpRatio = blinksOld(k).blinkAmpRatio;
    blinks(k).usedComponent = blinksOld(k).usedComponent;
    blinks(k).status = blinksOld(k).status;
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
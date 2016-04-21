%% NCTU - get the files and subjects
%blinkDir = 'K:\CTAData\Shooter\ShooterBlinks';
%infoDir = 'K:\CTAData\Shooter\AdditionalDocumentation';
infoDir = 'E:\CTADATA\Shooter\AdditionalDocumentation';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
experiment = 'Shooter';
type = 'ChannelUnref';
%type = 'EOGUnref';

%% Load the blinks data
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);
load([infoDir filesep 'sFilesEstimated.mat']);

%% Create a map for the times
timeMap = containers.Map('KeyType', 'char', 'ValueType', 'double');
for s = 1:length(sFilesEstimated)
    sFile = sFilesEstimated{s};
    for k = 1:length(sFile)
        key = [sFile(k).subject '_' sFile(k).task];
        timeMap(key) = sFile(k).startTime;
    end
end

%% Remap the files
numberFiles = length(blinks);
for k = 1:numberFiles
    [thePath, theName, theExt] = fileparts(blinks(k).fileName);
    pieces = strsplit(theName, '_');
    blinks(k).subjectID = pieces{2};  %#ok<*SAGROW>
    blinks(k).uniqueName = [pieces{2} '_' pieces{3}];
    blinks(k).task = pieces{3};
    blinks(k).experiment = experiment;
    if isKey(timeMap, blinks(k).uniqueName)
        blinks(k).startTime = timeMap(blinks(k).uniqueName);
    end
end

%% Save the blinks and blink map
save ([blinkDir filesep blinkFile], 'blinks', '-v7.3');
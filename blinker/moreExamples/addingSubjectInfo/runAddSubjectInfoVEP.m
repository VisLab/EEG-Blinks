%% VEP subject information
type = 'ChannelUnref';
experiment = 'VEP';
blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% Load the blinks data
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);

%% Remap the files
numberFiles = length(blinks);
for k = 1:numberFiles
    [thePath, theName, theExt] = fileparts(blinks(k).fileName);
    pieces = strsplit(theName, '_');
    blinks(k).subjectID = ['S' pieces{2}];  %#ok<*SAGROW>
    blinks(k).uniqueName = theName;
    blinks(k).task = 'vep';
    blinks(k).experiment = experiment;
end

%% Save the blinks and blink map
save ([blinkDir filesep blinkFile], 'blinks', '-v7.3');
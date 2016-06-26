%% Dreams whole night - get the files and subjects to fill in blinks
% This script is very specific to the Whole Dreams data collection
collectionType = 'FILES';
blinkDir = 'E:\CTADATA\WholeNightDreams\data\blinks';
dataDir = 'E:\CTADATA\WholeNightDreams\data\level0';
experiment = 'Dreams';
%type = 'ChannelUnref';
type = 'EOGMast';
numberSubjects = 20;
%newType = 'ChannelMast';
newType = 'EOGMast';
%% Load the blinks data
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);

%% Create the new structure
pivotYear = 2000;
formatIn = 'dd.mm.yy';
subjects = zeros(numberSubjects, 1);
for k = 1:numberSubjects
    [thePath, theName, theExt] = fileparts(blinks(k).fileName);
    blinks(k).subjectID = theName(8:end); %#ok<*SAGROW>
    EEG = pop_loadset(blinks(k).fileName);
    subjects(k) = str2double(blinks(k).subjectID);
    blinks(k).task = 'sleep';
    blinks(k).uniqueName = theName;
    blinks(k).experiment = experiment;
  
    startDate  = datenum(EEG.etc.startDate, formatIn, pivotYear);
    pieces = strsplit(EEG.etc.startTime, '.');
    startTime = str2double(pieces{1}) + str2double(pieces{2})/60 + ...
                str2double(pieces{3})/3600;
    blinks(k).startTime = startDate + startTime/24;
    blinks(k).type = newType;
end

%%
[sortedValues, sortedPos] = sort(subjects);
blinks = blinks(sortedPos);

%% Save the blinks and blink map
save ([blinkDir filesep blinkFile], 'blinks', '-v7.3');
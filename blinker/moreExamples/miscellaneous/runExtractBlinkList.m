%% Set up the directories
blinkDir = 'F:\DataPool\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
type = 'Channel';

%% Set up the files for the collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
blinkSummaryFile = [experiment 'BlinksNewSummary' type '.mat'];
blinkListFile = [experiment 'BlinksNewList' type '.mat'];   

%% Load the data blinks
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);
load([blinkDir filesep blinkSummaryFile]);

%% Create the lists
blinkLists(length(blinkFits)) = struct('fileName', [], 'srate', [], ...
                                       'startFrames', [], 'maxFrames', []);
for k = 1:length(blinkFits)
   blinkLists(k).fileName = blinks(k).fileName;
   blinkLists(k).srate = blinks(k).srate;
   blinkLists(k).startFrames = cell2mat({blinkFits{k}.leftBase});
   blinkLists(k).maxFrames = cell2mat({blinkFits{k}.maxFrame});
end

%%
save([blinkDir filesep blinkListFile], 'blinkLists', '-v7.3');
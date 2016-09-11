%% Extract the summary statistics for a collection of datasets 
%
% This script assumes that a filelist is provided and that the blink
% structures have already been computed using a function such as
% pop_blinker.  The goal is to put all of the statistics for the collection
% into a single file for display and analysis purposes.
%


%% BCIT counts
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
excludedTasks = {};
summaryDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
summaryFile = 'BCITLevel0AllUnrefNewBothBlinksSummary.mat';
blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
blinkDirInd = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
typeBlinks = 'AllUnrefNewBoth';

%% Load the baseline blink file list
load(blinkFileList);


%% Script to combine multiple datasets from the same subject and sitting
% into a single dataset for calculating distributions of maximum blinks.
% This script is used for situations where a larger dataset has been
% split to put each task into a separate dataset and the resulting pieces
% are too short to give good blink statistics. The script
% uses the combined distribution of the blink maxima to determine which
% channel should be selected as the "usedSignal".  The other parameters
% are determined by the calculations on the individual datasets.

%% Set the baseline parameters for the maximum blink amplitude distribution
correlationTop = 0.98;
correlationBottom = 0.90;
cutoffRatioThreshold = 0.7;  

%% NCTU_RWN_VDE
experiment = 'NCTU_RWN_VDE';
blinkDir = 'J:\CTAData\NCTU_RWN_VDE\Blinks';
typeBlinks = 'AllMastRef';
excludedTasks = {'Pre_EXP_resting', 'Post_EXP_resting'};
blinkFileList = [blinkDir filesep experiment '_blinkFileList.mat'];
blinkIndDir = [blinkDir filesep typeBlinks];


%% Read in the files and make the directories
typeBlinksCombined = [typeBlinks 'CombinedWithDate'];
blinkOutdir = [blinkDir filesep typeBlinksCombined];
if ~exist(blinkOutdir, 'dir')
    mkdir(blinkOutdir);
end;

%% Load the file list
load(blinkFileList);

%% Calculate the remap
% [blinkRemap, signalMap] = getRemapBySubjectAndDay(blinkIndDir, blinkFiles, typeBlinks, ...
%     excludedTasks, correlationTop, correlationBottom, cutoffRatioThreshold);

%% Now remap
combinedFile = [experiment 'BlinksNew' typeBlinks 'CombinedMapsWithDate.mat'];
%save ([blinkDir filesep combinedFile], 'blinkRemap', 'signalMap', '-v7.3');
load ([blinkDir filesep combinedFile]);
%% Now remap
remapBySubjectAndDay(blinkIndDir, blinkOutdir, blinkRemap);
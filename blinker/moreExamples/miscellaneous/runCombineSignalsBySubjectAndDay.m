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

%% Shooter
experiment = 'Shooter';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
excludedTasks = {'EC', 'EO'};
typeBlinks = 'AllMastNewBoth';
fileListName = 'ShooterFileList.mat';

%% BCI2000
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% excludedTasks = {'EyesOpen', 'EyesClosed'};
% typeBlinks = 'AllMastNewBoth';
% fileListName = 'BCI2000FileList.mat';

%% Read in the files and make the directories
typeBlinksCombined = [typeBlinks 'CombinedWithDate'];
blinkIndir = [blinkDir filesep typeBlinks];
blinkOutdir = [blinkDir filesep typeBlinksCombined];
if ~exist(blinkOutdir, 'dir')
    mkdir(blinkOutdir);
end;

%% Load the file list
blinkFileList = [blinkDir filesep fileListName];
load(blinkFileList);

%% Calculate the remap
[blinkRemap, signalMap] = getRemapBySubjectAndDay(blinkIndir, blinkFiles, typeBlinks, ...
    excludedTasks, correlationTop, correlationBottom, cutoffRatioThreshold);

%% Now remap
combinedFile = [experiment 'BlinksNew' typeBlinks 'CombinedMapsWithDate.mat'];
save ([blinkDir filesep combinedFile], 'blinkRemap', 'signalMap', '-v7.3');

%% Now remap
remapBySubjectAndDay(blinkIndir, blinkOutdir, blinkRemap);
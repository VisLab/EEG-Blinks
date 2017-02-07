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
combinedBlinkDir = [blinkDir filesep typeBlinks 'CombinedWithDate'];
combinedImagesDir = [blinkDir filesep typeBlinks 'CombinedWithDateImages'];
%% Load the blink file list and the remapped structure
combinedFile = [experiment 'BlinksNew' typeBlinks 'CombinedMapsWithDate.mat'];
load ([blinkDir filesep combinedFile]);
load(blinkFileList);

%%
combinedName = ['_' typeBlinks 'Combined.mat'];
%% Process
for k = 1:length(blinkRemap)
    blinkFiles = blinkRemap(k).blinkFileNames;
    for j = 1:length(blinkFiles)
        blinkFiles{j} = [combinedBlinkDir filesep blinkFiles{j} combinedName];
    end
    uniqueName = [experiment ' ' blinkRemap(k).subjectID ' ' blinkRemap(k).startDate];
    figh = showCombinedMaxDistribution(blinkFiles, uniqueName, blinkRemap(k).usedSignal, []);
    imageName = [combinedImagesDir filesep uniqueName];
    saveas(figh, [imageName '.fig']);
    saveas(figh, [imageName '.png']);
    close(figh);
end
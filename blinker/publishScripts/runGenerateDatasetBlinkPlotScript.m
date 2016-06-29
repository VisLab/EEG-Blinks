%% This script that generates an unrolled script for publishing blink plots
batchSize = 100;
publishOn = true;
%% Shooter
% scriptDir = 'D:\Research\BlinkDetectionCurrentCopy2\EEG-Blinks\blinker\examples';
% scriptName = 'publishShooterBlinks.m';
% inputDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
% inputBlinkFile = 'shooterBlinks_With_PREPClean_ICA.mat';
% outputDir = 'O:\ARL_Data\Shooter\ShooterBlinkOutput\PREPClean_ICA_Linear';
% blinkStatsFiles = 'shooterBlinks_With_PREPClean_ICABlinkOut.mat';

%% VEP
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% scriptDir = 'D:\Research\BlinkDetectionCurrent\EEG-Blinks\blinker\examples';
% scriptName = 'publishBlinksVEP.m';
% outputDir = 'O:\ARL_Data\VEP\VEPBlinkOutput\PREPClean';
% blinkBatchSize = 250;

%% BCIT
experiment = 'BCITLevel0';
%datasetNames = {'S2004_X2_R1'};
% datasetNames = {'S2004_X2_R1'; 'S2004_XB_R1'; 'S2009_XB_R1'; ...
%                 'S2015_X2_R1'; 'S2017_X2_R1'; 'S2032_X2_R1'};
% datasetNames = {'S2009_XB_R1'};
% datasetNames = {'S2018_XB_R1'; 'S2023_XC_R1'; 'S2027_XB_R1'; ...
%                 'S2043_XC_R1'; 'S2043_X6_R1'};
% datasetNames = {'S2018_XB_R1', 'S2023_XC_R1', 'S2043_XC_R1', 'S2043_X6_R1'};
%datasetNames = {'S2008_XC_R1', 'S2013_XC_R1', 'S2021_XC_R1'};
% datasetList = [92, 116, 134];
% datasetNames = {'T2_M055_S2019_X2', 'T2_M082_S2028_XC', 'T2_M100_S2034_X6'};
%datasetNames = {'S2019_T2X2_R1'};
%datasetNames = {'S2028_XC_R1'};
datasetNames = {'S2034_T2X6_R1'};
%% BCIT other examples
blinkTypes = {'EOGUnref', 'ChannelUnref'};
blinkDir = 'O:\ARL_Data\BCITBlinkOutput\data';
scriptDir = 'D:\Research\Blinks\BlinkDetectionCurrent\EEG-Blinks\blinker\publishScripts';
outputDir = 'O:\ARL_Data\BCITBlinkOutput\output';

for k = 1:length(datasetNames)
   makeBlinkPlotScript(experiment, datasetNames{k}, blinkTypes, ...
                     blinkDir, scriptDir, outputDir, batchSize, publishOn)
end
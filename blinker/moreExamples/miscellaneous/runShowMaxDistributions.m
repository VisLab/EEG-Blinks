%% Set up the directory
params = struct();
params.correlationThresholdTop = 98;
params.correlationThresholdBottom = 90;
% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% blinkFile = 'BCITLevel0_S2018_XB_R1_T2_M053_AllUnrefNewBothBlinks';

blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
blinkFile = 'BCITLevel0_S2019_T2X2_R1_T2_M056_AllUnrefNewBothBlinks';

%% Load the directory
load([blinkDir filesep blinkFile]);

%% Show the
fighan = showMaxDistribution(blinks, blinkFits, params);
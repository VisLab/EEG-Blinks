%% Display individual images of blink groups with blink numbers
blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
blinkFile = 'BCITLevel0_S2007_T2X2_R1_T2_M021_AllUnrefNewBothBlinks';
dataName = 'BCITLevel0_S2007_T2X2_R1_T2_M021';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2008_XB_R1_T2_M023_AllUnrefNewBothBlinks';
% dataName = 'BCITLevel0_S2008_XB_R1_T2_M023';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2018_XB_R1_T2_M053_AllUnrefNewBothBlinks';
% dataName = 'BCITLevel0_S2018_XB_R1_T2_M053';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2019_T2X2_R1_T2_M056_AllUnrefNewBothBlinks';
% dataName = 'BCITLevel0_S2019_T2X2_R1_T2_M056';

%% Set the output directory
outDir = [groupDir filesep dataName];
%% Load the blinks file
load([groupDir filesep blinkFile 'Grouped.mat'])
load([blinkDir filesep blinkFile]);

%% Display the individual blink groups
dumpBlinkGroups(outDir, dataName, blinkGroups, signalData, srate, ...
                blinks.usedSignal, blinkFits, blinkProperties)

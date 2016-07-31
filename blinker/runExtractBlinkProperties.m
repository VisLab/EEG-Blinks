%% Run the blink statistics given
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% VEP setup
% type = 'ChannelUnref';
% experiment = 'VEP';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% Miscellaneous
% blinkDir = 'D:\Research\BlinkerLeftovers\VideoHTML';
% blinkFile = 'ARL_BCIT_T1_M051_S1026PREPICABlinks.mat';
% blinkStatsFiles = 'ARL_BCIT_T1_M051_S1026PREPICAStatsOut.mat';

% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
% blinkFile = 'LSIEBlinks.mat';
% blinkStatsFiles = 'LSIEStatsOut.mat';

%% BCIT Examples
% organizationType = 'BCIT';
% collectionType = 'FILES';
% experiment = 'BCITLevel0';
% %type = 'ChannelUnrefNewBoth';
% type = 'EOGUnrefNewBoth';
% blinkDir = 'O:\ARL_Data\BCITBlinksNew';
% blinkDir = 'K:\BCITBlinks';
% % experiment = 'Experiment X2 Traffic Complexity';
% % experiment = 'Experiment X6 Speed Control';
% % experiment = 'X3 Baseline Guard Duty';
% % experiment = 'X4 Advanced Guard Duty';
% % experiment = 'X1 Baseline RSVP';
% % experiment = 'Experiment XC Calibration Driving';
% % experiment = 'Experiment XB Baseline Driving';
% % experiment = 'X2 RSVP Expertise';
% 

%% NCTU
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
% experiment = 'NCTU_LK';
% % %type = 'IC';
% % type = 'ChannelMastNew';
% type = 'ChannelMastNewBoth';

%% Shooter
% %type = 'ChannelUnrefNewBoth';
type = 'EOGUnrefNewBothCombined';
experiment = 'Shooter';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';

%% BCI2000
% type = 'ChannelMastRef';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
% metadataRoot = 'E:\CTADATA\BCI2000';

%% UMICH LSIE
% organizationType = 'UM';
% type = 'ChannelUnref';
% undoReference = false;
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% blinkDir = 'E:\CTADATA\Michigan\EEG_blinks3';

%% Dreams
% organizationType = 'Dreams';
% %type = 'ChannelMast';
% type = 'EOGMast';
% collectionType = 'FILES';
% experiment = 'Dreams';
% pathName = 'E:\CTADATA\WholeNightDreams\data\level0';
% blinkDir = 'E:\CTADATA\WholeNightDreams\data\blinks';
% %byType = 'EEG';
% byType = 'EOG';

%% Update file names with the experiment
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];

%% Set the base level
baseLevel = 0;

%% Load the data
load([blinkDir filesep blinkFile]);
blinkFits = cell(1, length(blinks));
blinkProperties = cell(1, length(blinks));

%% Fit the blinks
for n = 35%1:length(blinks)
    fprintf('Dataset %d:\n', n);
    dBlinks = blinks(n);
    if isempty(dBlinks.usedSignal) || isnan(dBlinks.usedSignal)
        warning('%d: [%s] does not have blinks\n', n, dBlinks.fileName);
        blinkProperties{n} = NaN;
        blinkFits{n} = NaN;
        continue;
    end
    blinkIndex = find(dBlinks.signalIndices == abs(dBlinks.usedSignal), ...
        1, 'first');
    [blinkProperties{n}, blinkFits{n}] = extractBlinkProperties( ...
        dBlinks.candidateSignals(blinkIndex, :), ...
        dBlinks.blinkPositions{blinkIndex}, dBlinks.srate, ...
        dBlinks.bestMedian(blinkIndex), dBlinks.bestRobustStd(blinkIndex));
end

%% Save the property structures in a file
%save([blinkDir filesep blinkPropertiesFile], 'blinkFits', 'blinkProperties', '-v7.3');
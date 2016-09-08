%% Compute the blink properties from a blinks structure array and save

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
% experiment = 'BCITLevel0';
% typeBlinks = 'AllUnrefNewBoth';
% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
% experiment = 'Experiment X2 Traffic Complexity';
% experiment = 'Experiment X6 Speed Control';
% experiment = 'X3 Baseline Guard Duty';
% experiment = 'X4 Advanced Guard Duty';
% experiment = 'X1 Baseline RSVP';
% experiment = 'Experiment XC Calibration Driving';
% experiment = 'Experiment XB Baseline Driving';
% experiment = 'X2 RSVP Expertise';


%% NCTU
experiment = 'NCTU_LK';
blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
typeBlinks = 'AllMastNewBoth';

%% Shooter
% typeBlinks = 'AllUnrefNewBoth';
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';

%% BCI2000
% type = 'ChannelMastRef';
% typeBlinks = 'ChannelMastNewBothCombined';
% typeBlinkProperties = 'ChannelMastNewBothCombined';
% % typeBlinks = 'ChannelMastNewBoth';
% % typeBlinkProperties = 'ChannelMastNewBoth';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRevised';
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
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];
blinkPropertiesFile = [experiment 'BlinksNew' typeBlinks 'Properties.mat'];

%% Load the data
load([blinkDir filesep blinkFile]);
blinkFits = cell(1, length(blinks));
blinkProperties = cell(1, length(blinks));

%% Fit the blinks
params = checkBlinkerDefaults(struct(), getBlinkerDefaults());
for n = 1:length(blinks)
    fprintf('Dataset %d:\n', n);
    dBlinks = blinks(n);
    if isempty(dBlinks.usedSignal) || isnan(dBlinks.usedSignal)
        warning('%d: [%s] does not have blinks\n', n, dBlinks.fileName);
        blinkProperties{n} = NaN;
        blinkFits{n} = NaN;
        continue;
    end
    params.srate = dBlinks.srate;
    signalNumbers = cellfun(@double, {dBlinks.signalData.signalNumber});
    signalIndex = find(signalNumbers == abs(dBlinks.usedSignal), 1, 'first');
    signalData = dBlinks.signalData(signalIndex);
    [blinkProperties{n}, blinkFits{n}] = extractBlinkProperties(signalData, params);
end

%% Save the property structures in a file
save([blinkDir filesep blinkPropertiesFile], 'blinkFits', 'blinkProperties', '-v7.3');
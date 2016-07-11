%% Setup files
inDir = 'O:\ARL_Data\BCITBlinkOutputNew\data';
fileName = 'BCITLevel0DatasetBlinksEOGUnrefNewARL_BCIT_T2_M232_S2078_X7_CA_R2_EEG.mat';

%% Thresholds
thresholds = [1.5, 2];

%% Load the data
load([inDir filesep fileName]);

%% run the plots
for k = 1:length(dBlinks.signalIndices)
    signal = dBlinks.candidateSignals(k, :);
    theName = [dBlinks.uniqueName ' (channel ' num2str(dBlinks.signalIndices(k)) ')'];
    plotThresholdHistograms(signal, dBlinks.srate, thresholds, theName);
end
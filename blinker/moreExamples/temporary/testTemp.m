% EEG = pop_loadset('filename','eeglab_data.set','filepath',...
%     'D:\\Research\\Blinks\\BlinkDetectionCurrentWorking\\eeglab13_6_5b\\sample_data\\');
% 
% defaults = getBlinkerDefaults(EEG);
% params = struct();
% params.signalTypeIndicator = 'UseNumbers';
% params = checkBlinkerDefaults(params, defaults);
% 
% [candidateSignals, blinkInfo] = getCandidateSignals(EEG, params);

%%  Testing channels
fName = 'D:\Research\Blinks\BlinkDetectionCurrentWorking\eeglab13_6_5b\sample_data\';
fName = [fName filesep 'eeglab_data_wchans.mat'];
load(fName);
defaults = getBlinkerDefaults(EEG);
params = struct();
params.signalTypeIndicator = 'UseLabels';
params = checkBlinkerDefaults(params, defaults);

[candidateSignals, blinkInfo1] = getCandidateSignals(EEG, params);

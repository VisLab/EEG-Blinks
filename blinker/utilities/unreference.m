function EEG = unreference(EEG)
% Unreference a
%   Detailed explanation goes here

if ~isfield(EEG.etc, 'noiseDetection') || ...
   ~isfield(EEG.etc.noiseDetection, 'reference') || ...
   ~isfield(EEG.etc.noiseDetection, 'reference')
   error('Must run PREP pipeline before unreferencing');
end
srateTarget = EEG.srate;
srateOriginal = EEG.etc.noiseDetection.reference.srate;
if srateTarget ~= srateOriginal
    EEG1 = eeg_emptyset();
    EEG1.srate = srateOriginal;
    EEG1.nbchan = 1;
    EEG1.trials = 1;
    EEG1.data = EEG.etc.noiseDetection.reference.referenceSignal;
    EEG1.pnts = size(EEG1.data, 2);
    EEG1.times = 1:EEG1.pnts;
    EEG1.times = 1000.*(EEG1.times - 1)/srateOriginal;
    EEG1 = pop_resample(EEG1, srateTarget);
    refSignal = EEG1.data;
else
    refSignal = EEG.etc.noiseDetection.reference.referenceSignal;
end
rerefChannels = EEG.etc.noiseDetection.reference.rereferencedChannels;
data = EEG.data(rerefChannels, :);
data = data + repmat(refSignal, size(data, 1), 1);
EEG.data(rerefChannels, :) = data;



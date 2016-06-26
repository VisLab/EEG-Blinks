function [blinkComponents, blinkInfo, componentIndices] = ...
                                   getICBlinkComponents(EEG)
% Extract a blinks structure from an EEG dataset
%
% Parameters:
%     EEG     an EEGLAB EEG structure with PREP and ICA run
%     reference (optional) time course of optional reference to be added in
%
%  Output:
%     blinkComponents    activations of the blink component
%
% The function band-pass filters prior to analysis

%% Defaults 
lowCutoff = 1;               % Lower edge of band-pass filter
highCutoff = 20;             % Upper edge of band-pass filter
similarityThreshold = 0.85;  % eye-catch eye IC similarity
FOMThreshold = 1.0;          % Figure of merit for eye IC

%% Check that EEG has the right structure
if isempty(EEG.icaweights)
    error('EEG ICA must be run run before detecting blink IC activations');
end

%% Filter the EEG data to make sure that it is in the correct range
EEG1 = EEG;
EEG1.icachansind = 1:length(EEG.icachansind);
EEG1.data = EEG1.data(EEG.icachansind, :);
EEG1.nbchan = length(EEG.icachansind);
EEG1 = pop_eegfiltnew(EEG1, lowCutoff, highCutoff);

%% Initialize eyeCatch
eyeDetector = pr.eyeCatch;
eyeDetector.similarityThreshold = similarityThreshold;

%% Fill blinks from the EEG structure
EEG1.icaact = (EEG1.icaweights*EEG1.icasphere)*EEG1.data;
[bEyeIC, similarity, scalpmapObj] = eyeDetector.detectFromEEG(EEG1); 
ICindices = 1:size(EEG.icaact,1);
eyeIC = ICindices(bEyeIC == 1);

%% Fail if no eye ICs
if sum(eyeIC) == 0
    error(['eyeCatch did not find eye ICA components (max similarity = ' ...
            num2str(max(similarity(:))) ')']);
end

polarity = zeros(1, length(eyeIC));
eyeFOM = zeros(1, length(eyeIC));
for i = 1:length(eyeIC)   
    [polarity(i), eyeFOM(i)] = checkPolarity(scalpmapObj, eyeIC(i), EEG.chaninfo.nosedir);   
end

%% Apply similarity and figure of merit thresholds
bEyeIC = (eyeFOM > FOMThreshold) & (similarity(eyeIC) > similarityThreshold);
if sum(bEyeIC) == 0
    error(['no blink IC was identified (max FOM=' num2str(max(eyeFOM(:))) ')']); 
end
componentIndices = eyeIC(bEyeIC);

%% Compute the blink component with correct polarity
blinkComponents = EEG1.icaact(componentIndices, :);
blinkPolarities = polarity(bEyeIC);
for k = 1:length(blinkPolarities)
  blinkComponents(k, :) = blinkComponents(k, :).*blinkPolarities(k);
end

%% Set the blink information in the blinks structure
blinkInfo = struct('type', [], 'eyeCatchICs', [], 'eyeFOMs', [], 'eyeSims', []);
blinkInfo.type = 'IC';
blinkInfo.eyeCatchICs = eyeIC;
blinkInfo.eyeFOMs = eyeFOM;
blinkInfo.eyeSims = similarity(eyeIC);

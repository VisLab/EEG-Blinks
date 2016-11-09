function [blinks, params] = extractBlinksEEG(EEG, params)
% Extract a blinks structure from an EEGLAB EEG structure
%
% Parameters:
%     EEG               EEG EEGLab structure with the signals
%     params            (optional)
%
%  Output:
%     blinks             a blink structure 
%     params             params actually used
%

%% Check the defaults
if nargin < 2
    params = struct();
end

[params, errors] = checkBlinkerDefaults(params, getBlinkerDefaults(EEG));
if ~isempty(errors)
    error('extractBlinks:BadParameters', ['|' sprintf('%s|', errors{:})]);
end
    
%% Extract the candidate signals
if params.verbose
    fprintf('Extracting candidate signals...\n');
end
[candidateSignals, signalType, signalNumbers, ...
                signalLabels, params] = getCandidateSignals(EEG, params);
params.signalNumbers = signalNumbers;
params.signalLabels = signalLabels;
if params.verbose
    fprintf('Extracting blinks from the candidate signals... be patient....\n');
end
[blinks, params] = extractBlinks(candidateSignals, signalType, params);
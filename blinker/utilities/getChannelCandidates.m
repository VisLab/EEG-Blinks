function [candidateSignals, blinkInfo] = getChannelCandidates(EEG, candidateLabels)
% Extract candidate EEG/EOG channel signals from EEG structure and filters
%
% Parameters:
%     EEG               an EEGLAB EEG structure 
%     candidateLabels   labels of EEG or EOG channels
%
%  Output:
%     candidateSignals  array of selected signals: numSignals x numFrames
%     blinkInfo         structure indicating which signals were selected
%
% The function band-pass filters from 1 Hz to 20 Hz prior to analysis

%% Default frequency range
lowCutoff = 1;
highCutoff = 20;

%% Find the channel names
blinkInfo = struct('type', [], 'signalIndices', [], 'signalLabels', []);
blinkInfo.type = 'Channel';
signalLabels = lower({EEG.chanlocs.labels});
[~, signalIndices] = intersect(signalLabels, lower(candidateLabels));
[~, sortIndices] = sort(signalIndices);
signalIndices = signalIndices(sortIndices);
blinkInfo.signalIndices = signalIndices;
blinkInfo.signalLabels = signalLabels(signalIndices);
if isempty(signalIndices)
    candidateSignals = [];
    return;
end
%% Filter the EEG data to make sure that it is in the correct range
EEG1 = EEG;
EEG1.data = EEG1.data(signalIndices, :);
EEG1.nbchan = length(signalIndices);
EEG1 = pop_eegfiltnew(EEG1, lowCutoff, highCutoff);

%% Finalize the information
candidateSignals = EEG1.data;

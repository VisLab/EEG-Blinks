function [blinkComponents, blinkInfo, channelIndices] = ...
                             getChannelBlinkComponents(EEG, channelList)
% Extract a blinks structure from an EEG dataset
%
% Parameters:
%     EEG     an EEGLAB EEG structure 
%     
%
%  Output:
%     blinks  a channel blinks structure 
%
% The function band-pass filters from 1 Hz to 20 Hz prior to analysis

%% Default frequency range
lowCutoff = 1;
highCutoff = 20;

%% Find the channel names
blinkInfo = struct('type', [], 'channelIndices', [], 'channelLabels', []);
blinkInfo.type = 'Channel';
channelLabels = lower({EEG.chanlocs.labels});
[~, channelIndices] = intersect(channelLabels, lower(channelList));
[~, sortIndices] = sort(channelIndices);
channelIndices = channelIndices(sortIndices);
blinkInfo.channelIndices = channelIndices;
blinkInfo.channelLabels = channelLabels(channelIndices);
if isempty(channelIndices)
    blinkComponents = [];
    return;
end
%% Filter the EEG data to make sure that it is in the correct range
EEG1 = EEG;
EEG1.data = EEG1.data(channelIndices, :);
EEG1.nbchan = length(channelIndices);
EEG1 = pop_eegfiltnew(EEG1, lowCutoff, highCutoff);

%% Finalize the information
blinkComponents = EEG1.data;

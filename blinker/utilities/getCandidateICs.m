function [candidateSignals, signalType, signalNumbers, ...
                    signalLabels, params]  = getCandidateICs(EEG, params)
% Extract candidate IC activations from EEG structure and filter
%
% Parameters:
%     EEG               an EEGLAB EEG structure (with ICA computed)
%     params            parameter structure to override default parameters
%                       or struct() for no override (see below for details
%  Output:
%     candidateSignals  array of selected signals: numSignals x numFrames
%     signalType        will be set to 'ICs'
%     signalNumbers     positions of candidateSignals in the EEG.icaact 
%     signalLabels      cell array of names of candidateSignals
%     params            parameter structure with all values filled in.
%
% The function band-pass filters from 1 Hz to 20 Hz prior to analysis
% unless params.lowCutoffHz, params.highCutoffHz override (not recommended)
%
% The function uses the ICSimilarityThreshold and ICFOMThreshold to select 
% IC activitations corresponding to eyes.
%
% BLINKER extracts blinks and ocular indices from time series. 
% Copyright (C) 2016  Kay A. Robbins, Kelly Kleifgas, UTSA
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% Check that EEG has the right structure
if isempty(EEG.icaweights)
    error('EEG ICA must be run run before detecting blink IC activations');
end
if nargin < 2
    params = struct();
end
[params, errors] = checkBlinkerDefaults(params, getBlinkerDefaults(EEG));
if ~isempty(errors)
    error('getCandidateICs:BadParameters', ['|' sprintf('%s|', errors{:})]);
end
params.signalTypeIndicator = 'UseICs';
signalType = 'ICs';

%% Filter the EEG data to make sure that it is in the correct range
EEG1 = EEG;
EEG1.icachansind = 1:length(EEG.icachansind);
EEG1.data = EEG1.data(EEG.icachansind, :);
EEG1.nbchan = length(EEG.icachansind);
EEG1 = pop_eegfiltnew(EEG1, params.lowCutoffHz, params.highCutoffHz);
EEG1.icaact = (EEG1.icaweights*EEG1.icasphere)*EEG1.data;

%% Initialize eyeCatch
eyeDetector = pr.eyeCatch;
eyeDetector.similarityThreshold = params.ICSimilarityThreshold;

%% Fill blinks from the EEG structure
[bEyeIC, similarity, scalpmapObj] = eyeDetector.detectFromEEG(EEG1); 
ICindices = 1:size(EEG.icaact,1);
eyeIC = ICindices(bEyeIC == 1);

%% Fail if no eye ICs
if sum(eyeIC) == 0
    error('getCandidateICs:noEyeICs', ...
        ['eyeCatch did not find eye ICA components (max similarity = ' ...
            num2str(max(similarity(:))) ')']);
end

polarity = zeros(1, length(eyeIC));
eyeFOM = zeros(1, length(eyeIC));
for i = 1:length(eyeIC)   
    [polarity(i), eyeFOM(i)] = checkPolarity(scalpmapObj, eyeIC(i), ...
                                 EEG.chaninfo.nosedir);   
end

%% Apply similarity and figure of merit thresholds
bEyeIC = (eyeFOM > params.ICFOMThreshold) & (similarity(eyeIC) > params.ICSimilarityThreshold);
if sum(bEyeIC) == 0
    error(['no blink IC was identified (max FOM=' num2str(max(eyeFOM(:))) ')']); 
end
signalNumbers = eyeIC(bEyeIC);

%% Compute the blink component with correct polarity
candidateSignals = EEG1.icaact(signalNumbers, :);
blinkPolarities = polarity(bEyeIC);
for k = 1:length(blinkPolarities)
  candidateSignals(k, :) = candidateSignals(k, :).*blinkPolarities(k);
end

%% Set the blink information in the blinks structure
signalLabels = cell(1, length(signalNumbers));
for k = 1:length(signalNumbers)
    signalLabels{k} = ['IC' num2str(signalNumbers(k))];
end

    function [isUpright, eyeFOM] = checkPolarity(scalpmapObj, component, noseDir)
    %% Determine the direction of the IC and how similar     
        map = squeeze(scalpmapObj.originalChannelWeight(component,:,:));
        rows = size(map, 1);
        
        halfRows = int32(rows/2);
        
        switch noseDir
            case '+X'
                frontHemisphereAve = nanmean(nanmean((map(halfRows:rows,:))));
                rearHemisphereAve = nanmean(nanmean((map(1:halfRows,:))));
            case '-X'
                frontHemisphereAve = nanmean(nanmean(map(1:halfRows,:)));
                rearHemisphereAve = nanmean(nanmean(map(halfRows:rows,:)));
            case '+Y'
            otherwise
                
        end
        
        if (frontHemisphereAve >= 0)
            isUpright = 1;
        else
            isUpright = -1;
        end
        eyeFOM = isUpright * (frontHemisphereAve - rearHemisphereAve);
    end
end
function [candidateSignals, signalType, signalNumbers, ...
         signalLabels, params] = getCandidateSignals(EEG, params)
% Extract candidate EEG/EOG channel signals from EEG structure and filter
%
% Parameters:
%     EEG               an EEGLAB EEG structure 
%     params            parameter structure to override default parameters
%                       or struct() for no override (see below for details
%  Output:
%     candidateSignals  array of selected signals: numSignals x numFrames
%     signalType        type of signal returned: 'ICs', 'SignalNumbers', or
%                             'SignalLabels'
%     signalNumbers     positions of candidateSignals in the EEG.data or in the 
%     signalLabels      cell array of names of candidateSignals
%     params            parameter structure with all values filled in.
%
% The function band-pass filters from 1 Hz to 20 Hz prior to analysis
% unless params.lowCutoffHz, params.highCutoffHz override (not recommended)
%
% The function uses channel numbers unless params.signalTypeIndicator
% has value 'UseICs' or 'UseLabels'.
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

%% Check the parameters and throw and error if invalid
if nargin < 2
    params = struct();
end
[params, errors] = checkBlinkerDefaults(params, getBlinkerDefaults(EEG));
if ~isempty(errors)
    error('getCandidateSignals:BadParameters', ['|' sprintf('%s|', errors{:})]);
end

%% See if need to handle ICs instead of channels
if strcmpi(params.signalTypeIndicator, 'UseICs')
    [candidateSignals, signalType, signalNumbers, ...
         signalLabels, params] = getCandidateICs(EEG, params);
    return;
end

%% Find the channel names
candidateSignals = [];
if strcmpi(params.signalTypeIndicator, 'UseNumbers')
    signalType = 'SignalNumbers';
    [signalLabels, signalNumbers] = ...
          getLabelsFromNumbers(params.signalNumbers);
elseif strcmpi(params.signalTypeIndicator, 'UseLabels')
    signalType = 'SignalLabels';
    [signalLabels, signalNumbers] = ...
        getNumbersFromLabels(params.signalLabels);
else
    error('getCandidateSignals:BadSignalType', 'Unrecognized signal type');
end
    
if isempty(signalLabels)
    warning('getCandidateSignals: EEG dataset does not have these signals');
    return;
end
if ~isempty(params.excludeLabels)
    [signalLabels, signalIndices] = setdiff(signalLabels, params.excludeLabels);
    signalNumbers = signalNumbers(signalIndices);
end

%% Filter the EEG data to make sure that it is in the correct range
EEG1 = EEG;
EEG1.data = EEG1.data(signalNumbers, :);
EEG1.nbchan = length(signalNumbers);
EEG1 = pop_eegfiltnew(EEG1, params.lowCutoffHz, params.highCutoffHz);

%% Finalize the information
candidateSignals = EEG1.data;

    function [theLabels, theNumbers] = getLabelsFromNumbers(candidateNumbers)
        % Finds valid signal labels and numbers given candidate numbers
        allowedNumbers = 1:size(EEG.data, 1);
        theNumbers = intersect(allowedNumbers, candidateNumbers);
        theLabels = cell(size(theNumbers));
        for n = 1:length(theNumbers)
            theLabels{n} = ['channel' num2str(n)];
        end
        if isempty(EEG.chanlocs) || ~isfield(EEG.chanlocs, 'labels') || ...
           length(EEG.chanlocs) ~= size(EEG.data, 1)
           return;
        end
        for n = 1:length(theNumbers)
            if ~isempty(EEG.chanlocs(theNumbers(n)).labels)
                theLabels{n} = lower(EEG.chanlocs(theNumbers(n)).labels);
            end
        end
    end

    function [theLabels, theNumbers] = getNumbersFromLabels(candidateLabels)
        % Finds valid signal labels and numbers given candidate labels
        theLabels = [];
        theNumbers = [];
        if isempty(EEG.chanlocs) || ~isfield(EEG.chanlocs, 'labels') || ...
                length(EEG.chanlocs) ~= size(EEG.data, 1)
            return;
        end
        chanlocs = EEG.chanlocs;
        for n = 1:length(chanlocs)
            if isempty(chanlocs(n).labels)
                chanlocs(n).labels = ['channel' num2str(n)];
            end
        end
        theseLabels = lower({EEG.chanlocs.labels});
        [~, theseIndices] = intersect(theseLabels, lower(candidateLabels));
        if isempty(theseIndices)
            return;
        end
        [~, sortIndices] = sort(theseIndices);
        theNumbers = theseIndices(sortIndices);
        theLabels = theseLabels(theNumbers);
    end
end
     
function blinkStatistics = ...
         extractBlinkStatistics(blinks, blinkFits, blinkProperties, params)
%% Extract blink statistics structure from the blink fits and properties
%
% Parameters:
%    blinks    structure containing dataset overall bink information
%    blinkFits structure containing landmarks of the individual blinks
%    blinkProperties  structure containing properties of individual blinks
%    params    structure with the parameters needed to compute statistics
%    blinkStatistics  (output) structure with the summary 
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

%% Make sure enough arguments
    if nargin == 0
        blinkStatistics = getStatisticsStructure();
        return;
    elseif nargin < 3
        error('getSummaryStatistics:NotEnoughArguments', ...
            'Must be called with at least 3 arguments');
    elseif nargin < 4
        correlationThreshold = 0.98;
    else
        correlationThreshold = params.correlationThresholdTop;
    end

    %% Check to make sure that the structures are non-empty
    if isempty(blinks) || isempty(blinkFits) || isempty(blinkProperties) || ...
            length(blinkFits) ~= length(blinkProperties)
        blinkStatistics = [];
        return;
    end

    %% Get an empty statistics structure and put in metadata
    blinkStatistics = getStatisticsStructure();
    blinkStatistics.fileName = blinks.fileName;
    blinkStatistics.subjectID = blinks.subjectID;
    blinkStatistics.task = blinks.task;
    blinkStatistics.srate = blinks.srate;
    blinkStatistics.startTime = blinks.startTime;
    blinkStatistics.uniqueName = blinks.uniqueName;
    blinkStatistics.usedNumber = abs(blinks.usedSignal);
    blinkStatistics.header = getHeader();

    %% Now the summary fields
    if isnan(blinks.usedSignal)
        blinkStatistics.status = 'failed';
        warning('getSummaryStatistics:NoSignal', 'No blink signal');
        return;
    end
    sData = blinks.signalData;
    signalNumbers = cellfun(@double, {sData.signalNumber});
    pos = find(signalNumbers == abs(blinks.usedSignal), 1, 'first');
    if isempty(pos)
        blinkStatistics.status = 'failed';
        warning('getSummaryStatistics:NoAcceptableSignal', 'Inconsistent structure');
        return;
    end
    if blinks.usedSignal < 0
        blinkStatistics.status = 'marginal';
    else
        blinkStatistics.status = 'good';
    end
    theLabel = lower(sData(pos).signalLabel);
    blinkStatistics.usedLabel = theLabel;
    blinkStatistics.seconds = length(sData(pos).signal)/blinks.srate;
    blinkStatistics.numberBlinks = sData(pos).numberBlinks;
    blinkStatistics.numberGoodBlinks = sData(pos).numberGoodBlinks;
    blinkStatistics.goodRatio = sData(pos).goodRatio;
    blinkStatistics.pAVRZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'pAVRZ', correlationThreshold);
    blinkStatistics.nAVRZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'nAVRZ', correlationThreshold);
    blinkStatistics.durationZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationZ', correlationThreshold);
    blinkStatistics.durationB = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationB', correlationThreshold);
    blinkStatistics.durationT = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationT', correlationThreshold);
    blinkStatistics.durationHZ = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationHZ', correlationThreshold);
    blinkStatistics.durationHB = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'durationHB', correlationThreshold);
    blinkStatistics.blinksPerMin = getOcularIndex(blinks, blinkProperties, ...
        blinkFits, 'blinksPerMin', correlationThreshold);


    function s = getStatisticsStructure()
        s = struct( 'fileName', nan, ...
            'subjectID', nan, 'task', nan, 'uniqueName', nan, ...
            'srate', nan, 'startTime', nan, ...
            'usedNumber', nan, 'usedLabel', nan, 'status', nan, ...
            'seconds', nan, 'numberBlinks', nan, 'numberGoodBlinks', nan, ... ...
            'goodRatio', nan, 'header', nan, ...
            'pAVRZ', nan, 'nAVRZ', nan, 'durationZ', nan, ...
            'durationB', nan, 'durationT', nan, ...
            'durationHZ', nan, 'durationHB', nan, 'blinksPerMin', nan);
    end

    function header = getHeader()
        header = {'mean', 'median', 'std', 'mad', 'goodMean', 'goodMedian', ...
            'goodStd', 'goodMad'};
    end
end
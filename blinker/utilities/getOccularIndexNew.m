function [occularValues, goodBlinkMask] = getOccularIndexNew( ...
          dBlinks, dBlinkProperties, dBlinkFits, type, correlationThreshold)
% Extract the occular index of a particular type
%
%  Parameters
%    dBlink   blink structure for the dataset
%    dBlinkProperties   blink structure array for dataset properties
occularValues = NaN;
goodBlinkMask = NaN;
if isempty(dBlinks.usedSignal) || isnan(dBlinks.usedSignal)
    return;
end

goodBlinkMask = getGoodBlinkMask(dBlinkFits, correlationThreshold);
switch type
    case 'pAVRZ'
        values = cellfun(@double, {dBlinkProperties.posAmpVelRatioZero});
    case 'nAVRZ'
        values = cellfun(@double, {dBlinkProperties.negAmpVelRatioZero});
    case 'durationZ'
        values = cellfun(@double, {dBlinkProperties.durationZero});
    case 'durationB'
        values = cellfun(@double, {dBlinkProperties.durationBase});
    case 'durationT'
        values = cellfun(@double, {dBlinkProperties.durationTent});
    case 'durationHZ'
        values = cellfun(@double, {dBlinkProperties.durationHalfZero});
    case 'durationHB'
        values = cellfun(@double, {dBlinkProperties.durationHalfBase});
    case 'blinksPerMin'
        numberMinutes = size(dBlinks.candidateSignals, 2)/(dBlinks.srate * 60);
        goodBlinks = length(dBlinkFits(goodBlinkMask))./numberMinutes;
        allBlinks = length(dBlinkFits)./numberMinutes;
        
    otherwise
        values = NaN;
end
if ~strcmpi(type, 'blinksPerMin')
    goodValues = values(goodBlinkMask(:));
    occularValues = ...
        [nanmean(values), nanstd(values), nanmean(goodValues), nanstd(goodValues)];
    
else
    occularValues = [allBlinks, 0, goodBlinks, 0];
end

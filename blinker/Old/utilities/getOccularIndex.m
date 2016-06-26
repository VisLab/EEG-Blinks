function occularValues = getOccularIndex(dBlinks, dBlinkProperties, dBlinkFits, type)
% Extract the occular index of a particular type
%
%  Parameters
%    dBlink   blink structure for the dataset
%    dBlinkProperties   blink structure array for dataset properties
occularValues = NaN;
if isempty(dBlinks.usedComponent) || isnan(dBlinks.usedComponent)
    return;
end
correlationThreshold = 0.90;
goodMask = getGoodBlinkMask(dBlinkFits, correlationThreshold);
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
        numberMinutes = size(dBlinks.blinkComponents, 2)/(dBlinks.srate * 60);
        goodBlinks = length(dBlinkFits(goodMask))./numberMinutes;
        allBlinks = length(dBlinkFits)./numberMinutes;
        
    otherwise
        values = NaN;
end
if ~strcmpi(type, 'blinksPerMin')
    goodValues = values(goodMask(:));
    occularValues = ...
        [nanmean(values), nanstd(values), nanmean(goodValues), nanstd(goodValues)];
    
else
    occularValues = [allBlinks, 0, goodBlinks, 0];
end

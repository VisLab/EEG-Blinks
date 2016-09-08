function [ocularValues, header, goodBlinkMask, values] = getOcularIndex( ...
          dBlinks, dBlinkProperties, dBlinkFits, ocularType, ...
          correlationThreshold)
% Extract the ocular index of a particular type
%
%  Parameters
%    dBlinks   blink structure for the dataset
%    dBlinkProperties   blink structure array for dataset properties
%    dBlinkFits         blink fit structure array
%    ocularType         type of indicator
%    correlationThreshold  correlation for determining good
%
%  Output:
%     ocularValues     an 1x8 array with:
%                        'mean', 'median', 'std', 'mad', 'goodMean', 'goodMedian', ...
%                         'goodStd', 'goodMad'
%     header           cell array indicating meaning of ocualarValues columns 
%     goodBlinkMask    mask indicating which blinks are "good"
%
ocularValues = NaN;
goodBlinkMask = NaN;
if isempty(dBlinks.usedSignal) || isnan(dBlinks.usedSignal)
    return;
end
header = {'mean', 'median', 'std', 'mad', 'goodMean', 'goodMedian', ...
           'goodStd', 'goodMad'};
leftR2 = cellfun(@double, {dBlinkFits.leftR2});
rightR2 = cellfun(@double, {dBlinkFits.rightR2});
goodBlinkMask = ~isnan(leftR2) & ~isnan(rightR2) & ...
     leftR2 >= correlationThreshold & rightR2 >= correlationThreshold;
switch ocularType
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
        numberMinutes = size(dBlinks.signalData(1).signal, 2)/(dBlinks.srate * 60);
        goodBlinks = length(dBlinkFits(goodBlinkMask))./numberMinutes;
        allBlinks = length(dBlinkFits)./numberMinutes;
        
    otherwise
        values = NaN;
end
if ~strcmpi(ocularType, 'blinksPerMin')
    goodValues = values(goodBlinkMask(:));
    ocularValues = ...
        [nanmean(values), nanmedian(values), ...
         nanstd(values), mad(values, 1) ...
         nanmean(goodValues), nanmedian(goodValues), ...
         nanstd(goodValues), mad(goodValues, 1)]; 
else
    ocularValues = [allBlinks, 0, 0, 0, goodBlinks, 0, 0, 0];
end

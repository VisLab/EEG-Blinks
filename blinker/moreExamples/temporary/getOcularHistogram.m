function [binCounts, binCenters] = getOcularHistogram(dBlinkProperties, ...
                                       type, limits, goodMask, maxTime)
% Extract the histogram of the indicated type
%
%  Parameters
%     dBlinkProperties   blink property structure for the dataset
%     type  string specifying which property
%     limits   time limits to specify
%     goodMask  mask of which blinks to consider 

windowSize = 300;
windowOffset = 150;
binCounts = 0;
binCenters = 0;
if isempty(dBlinkProperties) || ~isstruct(dBlinkProperties)
    return;
end

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
        peaks = cellfun(@double, {dBlinkProperties.peakTimeBlink});
        if ~isempty(goodMask)
            peaks = peaks(goodMask);
        end
        blinkRate = getWindowCounts(peaks, windowSize, windowOffset, [0, maxTime]);
        values = 60*blinkRate/windowSize;
    otherwise
        values = NaN;
end
if ~isempty(goodMask) && ~strcmpi(type, 'blinksPerMin')
    values = values(goodMask);
end
bins = linspace(limits(1), limits(2), limits(3));
[binCounts, binCenters] = hist(values(:), bins);
function blinkRate = getBlinkRate(peakTimes, windowSize, ...
                                  windowOffset, timeRange)
% Return number of blinks per time interval given blink properties
blinkRate = NaN;
if ~isa(blinkProperties, 'struct') || ...
        isempty(blinkProperties) || isnan(blinkProperties)
    return;
end
peaks = cellfun(@double, {blinkProperties.peakTimeBlink});
totalTime = timeRange(2) - timeRange(1);
numberWindows = floor((totalTime - windowSize)/windowOffset) + 1;

blinkRate = zeros(numberWindows, 1);
blinkNumbers = floor((peaks - timeRange(1))/windowOffset) + 1;
for k = 1:numberWindows
    blinkRate(k) = sum(blinkNumbers == k);
end

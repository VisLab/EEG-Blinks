function badBlinkMask = getBadBlinks(blinkFits, blinkProperties, corrThreshold) 
% Extract mask indicating suspect blinks based on correlation and duration
%  Parameters:
%     blinkFits             blink fit structure for a dataset
%     blinkProperties       blink properties structure
%     corrThreshold         correlation threshold for bad blink
%     badBlinkMask          mask indicating which blinks are bad
%
% This function does not account for amplitude distributions, only shape.

if nargin < 3
  corrThreshold = 0.90;
end

leftR2 = cellfun(@double, {blinkFits.leftR2});
rightR2 = cellfun(@double, {blinkFits.rightR2});
durationTent = cellfun(@double, {blinkProperties.durationTent});
closingTime = cellfun(@double,{blinkProperties.closingTimeTent});
reopeningTime = cellfun(@double,{blinkProperties.reopeningTimeTent});
indicesNaN = isnan(leftR2) | isnan(rightR2) | isnan(durationTent) | ...
             isnan(closingTime) | isnan(reopeningTime);

%% Test for negative durations
badBlinkMask = indicesNaN | durationTent < 0.05 | closingTime < 0 ...
     | reopeningTime < 0 | leftR2 < corrThreshold | rightR2 < corrThreshold;

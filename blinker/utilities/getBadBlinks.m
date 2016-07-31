function badBlinkMask = getBadBlinks(blinkFits, blinkProperties, corrThreshold) 
% Extract mask indicating suspect blinks
%  Parameters:
%     blinkFits             blink fit structure for a dataset
%     blinkProperties
%     corrThreshold         correlation threshold for bad blink
%     goodMask              mask indicating which blinks are good
%
% Currently this function uses a good linear fit on upshot and downshot.
% If the correlationThreshold is zero, all successfully fitted blinks

if nargin < 3
  corrThreshold = 0.90;
end

leftR2 = {blinkFits.leftR2};
rightR2 = {blinkFits.rightR2};
indicesNaN = cellfun(@isnan, leftR2) | cellfun(@isnan, rightR2);

%% Test for negative durations
durationTent = cellfun(@double, {blinkProperties.durationTent}) < 0.05;
closingTime = cellfun(@double,{blinkProperties.closingTimeTent}) < 0;
reopeningTime = cellfun(@double,{blinkProperties.reopeningTimeTent}) < 0;

%% Test for bad correlations
leftR2 = cellfun(@double,{blinkFits.leftR2}) < corrThreshold;
rightR2 = cellfun(@double,{blinkFits.rightR2}) < corrThreshold;

badBlinkMask = indicesNaN | durationTent | closingTime | reopeningTime | leftR2 | rightR2;

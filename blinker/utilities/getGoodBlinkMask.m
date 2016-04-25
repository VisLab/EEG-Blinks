function goodMask = getGoodBlinkMask(blinkFits, correlationThreshold)
% Return a mask with 1 indicating a good blink and 0 indicating a bad blink
%
%  Parameters:
%     blinkFits             blink fit structure for a dataset
%     correlationThreshold  correlation threshold for bad blink
%     goodMask              mask indicating which blinks are good
%
% Currently this function uses a good linear fit on upshot and downshot.
% If the correlationThreshold is zero, all successfully fitted blinks

goodMask = NaN;
if isempty(blinkFits)
    return;
end

leftR2 = {blinkFits.leftR2};
rightR2 = {blinkFits.rightR2};

indicesNaN = cellfun(@isnan, leftR2) | cellfun(@isnan, rightR2);
leftR2 = cellfun(@double, leftR2);
rightR2 = cellfun(@double, rightR2);
goodMask = ~indicesNaN & leftR2 >= correlationThreshold & ...
    rightR2 >= correlationThreshold;
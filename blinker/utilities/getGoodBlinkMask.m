function goodMask = getGoodBlinkMask(blinkFits, correlationThreshold)
% Mask with good blinks based on correlations.
%
%  Parameters:
%     blinkFits             blink fit structure for a dataset
%     correlationThreshold  correlation threshold for bad blink
%     goodMask              mask indicating which blinks are good
%
% Currently this function uses a good linear fit on upshot and downshot.
% It also incorporates and amplitude criteria -- using only blinks that are
% within roughly two standard deviations of the amplitudes of "best"
% blinks.

topCorrelation = 0.98;
goodMask = NaN;
if isempty(blinkFits)
    return;
end

%% Extract the blink fit values that are needed
leftR2 = {blinkFits.leftR2};
rightR2 = {blinkFits.rightR2};
maxValues = {blinkFits.maxValue};

indicesNaN = cellfun(@isnan, leftR2) | cellfun(@isnan, rightR2) ...
               | cellfun(@isnan, maxValues);
leftR2 = cellfun(@double, leftR2);
rightR2 = cellfun(@double, rightR2);
maxValues = cellfun(@double, maxValues);
topMask =  ~indicesNaN & leftR2 >= topCorrelation & rightR2 >= topCorrelation;
topValues = maxValues(topMask);
if isempty(topValues)
    return;
end
topMedian = median(topValues);
topRobustStd = 1.4826*mad(topValues, 1);

goodMask = ~indicesNaN & ...
           leftR2 >= correlationThreshold & ...
           rightR2 >= correlationThreshold & ...
           maxValues >= topMedian - 2*topRobustStd & ...
           maxValues <= topMedian + 2*topRobustStd;
function [goodBlinkMask, specifiedMedian, specifiedStd] = ...
      getGoodBlinkMask(blinkFits, specifiedMedian, specifiedStd, zThresholds)
% Calculates a mask for the good blinks based on amplitude and correlation
%
%  Parameters:
%     blinkFits             blink fit structure for a dataset
%     correlationThresholds correlation thresholds for binning distribution
%     zScoreThresholds      specified z scores
%     specifiedMedian       calculated if not specified
%     specifiedStd          calculated if not specified
%     goodBlinkMask         (output) mask indicating which blinks are good
%
% This function uses a good linear fit on upshot and downshot.
% It also incorporates an amplitude criteria -- using only blinks that are
% within roughly specifiedZ deviations of the amplitudes of the median 
% "best" blinks. A layered approach is used so different correlations can
% have different robust z-scores.

goodBlinkMask = [];
if isempty(blinkFits)
    return;
elseif nargin < 4
    zThresholds = [0.90, 2; 0.98, 5];
end
    
%% Extract the correlations and max value
leftR2 = cellfun(@double, {blinkFits.leftR2});
rightR2 = cellfun(@double, {blinkFits.rightR2});
maxValues = cellfun(@double, {blinkFits.maxValue});
indicesNaN = isnan(leftR2) | isnan(rightR2) | isnan(maxValues);

goodBlinkMask = getMask(zThresholds(1, 1), zThresholds(1, 2));
for k = 2:size(zThresholds, 1)
    goodBlinkMask = goodBlinkMask | ...
             getMask(zThresholds(k, 1), zThresholds(k, 2));
end

    function mask = getMask(correlationThreshold, zScoreThreshold)
        mask = ~indicesNaN & ...
           leftR2 >= correlationThreshold & ...
           rightR2 >= correlationThreshold & ...
           maxValues >= max(0, specifiedMedian - zScoreThreshold*specifiedStd) & ...
           maxValues <= specifiedMedian + zScoreThreshold*specifiedStd;
    end
end
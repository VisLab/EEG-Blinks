function [goodBlinkMask, specifiedMedian, specifiedStd] = ...
      getGoodBlinkMask(blinkFits, specifiedMedian, specifiedStd, zThresholds)
% Calculates a mask for the good blinks based on amplitude and correlation
%
%  Parameters:
%     blinkFits             blink fit structure for a dataset
%     specifedMedian        median for computing good blinks
%     specifiedStd          standard deviation for computing good blinks
%     zThresholds           specified z scores
%     goodBlinkMask         (output) mask indicating which blinks are good
%     specifiedMedian       (output) calculated if not specified
%     specifiedStd          (output) calculated if not specified
%
%
% This function uses a good linear fit on upshot and downshot.
% It also incorporates an amplitude criteria -- using only blinks that are
% within roughly specifiedZ deviations of the amplitudes of the median 
% "best" blinks. A layered approach is used so different correlations can
% have different robust z-scores.
%
% BLINKER extracts blinks and ocular indices from time series. 
% Copyright (C) 2016  Kay A. Robbins, Kelly Kleifgas, UTSA
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
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
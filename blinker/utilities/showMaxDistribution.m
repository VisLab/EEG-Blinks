function fighan = showMaxDistribution(blinks, blinkFits, params)
%% Display the distributions of blink maxima
%
% Parameters
%   blinks      blink structure for the dataset
%   blinkFits  blinkFits structure for the dataset
%   params     parameter structure
%     parameters in use
%         correlationThresholdTop: left and right tent correlation for the
%                      "best" blinks [default 0.98]
%         correlationThresholdMiddle: left and right tent correlation for the
%                      "better" blinks [default 0.98]
%         correlationThresholdBottom: left and right tent correlation for the
%                      "good" blinks [default 0.90]
%         numberMaxBins:  number of bins for plotting blink maxima 
%                      histogram [default 80]
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
%% Display the distribution of blinks in a
    if nargin < 3 || isempty(params)
       correlationThresholdTop = 0.98;
       correlationThresholdMiddle = 0.95;
       correlationThresholdBottom = 0.90;
       numberMaxBins = 80;
    else
       correlationThresholdTop = params.correlationThresholdTop;
       correlationThresholdMiddle = params.correlationThresholdMiddle;
       correlationThresholdBottom = params.correlationThresholdBottom;
       numberMaxBins = params.numberMaxBins;
    end
    
    if isempty(blinks.usedSignal) || isnan(blinks.usedSignal)
        warning('%s has no blinks\n', blinks.fileName);
        return;
    end
    used = abs(blinks.usedSignal);
    signalNumbers = cellfun(@double, {blinks.signalData.signalNumber});
    signalNumber = find(signalNumbers == used, 1, 'first');
    candidateSignal = blinks.signalData(signalNumber).signal;
    candidatePositions = blinks.signalData(signalNumber).blinkPositions;
    signalLabel = blinks.signalData(signalNumber).signalLabel;
    dFitsBase = fitBlinks(candidateSignal, candidatePositions);
    maxValues = cellfun(@double, {dFitsBase.maxValue});
    leftR2 = cellfun(@double, {dFitsBase.leftR2});
    rightR2 = cellfun(@double, {dFitsBase.rightR2});
    indicesNaN = isnan(leftR2) | isnan(rightR2) | isnan(maxValues);

    bestMaskTop = leftR2 >= correlationThresholdTop & ...
        rightR2 >= correlationThresholdTop;
    goodMaskBottom = leftR2 >= correlationThresholdBottom & ...
        rightR2 >= correlationThresholdBottom;
    betterMaskTop = leftR2 >= correlationThresholdMiddle & ...
        rightR2 >= correlationThresholdMiddle;
    bestValues = maxValues(bestMaskTop & ~indicesNaN);
    betterValues = maxValues(betterMaskTop & ~indicesNaN);
    goodValues = maxValues(goodMaskBottom & ~indicesNaN);
    allValues = maxValues(~indicesNaN);
    
    bestMedian = blinks.signalData(signalNumber).bestMedian;
    bestRobustStd = blinks.signalData(signalNumber).bestRobustStd;
    upperBest = bestMedian + 5*bestRobustStd;
    xhist = linspace(min(allValues), upperBest, numberMaxBins);
    labelColor = [0, 0, 0];
    usedValues = cellfun(@double, {blinkFits.maxValue});
    usedValues(isnan(usedValues)) = [];
    %% Now compute the histograms
    [n1, x1] = hist(allValues, xhist);
    [n2, x2] = hist(goodValues, xhist);
    [n3, x3] = hist(betterValues, xhist);
    [n4, x4] = hist(bestValues, xhist);
    [n5, x5] = hist(usedValues, xhist);
    theTitle =  [blinks.uniqueName ...
        ' Ratio=' num2str(blinks.signalData(signalNumber).goodRatio) ...
        ' Ch=' num2str(blinks.usedSignal) ' (' signalLabel ')'];

    fighan = figure('Color', [1, 1, 1], 'Name', theTitle);
    hold on
    plot(x1, n1, 'Color', [0.3, 0.85, 0.3], 'LineWidth', 3, 'LineStyle', '-');

    plot(x2, n2, 'Color', [0.8, 0.8, 0.8], 'LineWidth', 3, 'LineStyle', '-')
    plot(x3, n3, 'Color', [0.65, 0.65, 0.65], 'LineWidth', 2, 'LineStyle', '-')
    plot(x4, n4, 'Color', [0, 0, 0], 'LineStyle', '-', 'LineWidth', 2)
    plot(x5, n5, 'Color', [0.85, 0.3, 0.85], 'LineStyle', '-', 'LineWidth', 2);

    yLimits = get(gca, 'YLim');
    line([bestMedian, bestMedian], ...
        [0, yLimits(2)], 'LineStyle', '-', 'Color', [0.6, 0.6, 0.85]);
    line([bestMedian + 2*bestRobustStd, bestMedian + 2*bestRobustStd], ...
        [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
    if bestMedian - 2*bestRobustStd > 0
        line([bestMedian - 2*bestRobustStd, bestMedian - 2*bestRobustStd], ...
            [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
    end
    hold off
    legend('All', 'Good', 'Better', 'Best', 'Used', 'Location', 'NorthOutside', ...
           'Orientation', 'Horizontal');

    xlabel(['Blink max amplitude [' num2str(min(allValues)) ...
        ', ' num2str(max(allValues)) ']']);

    ylabel('Count')
    title(theTitle, 'Interpreter', 'None', 'Color', labelColor);
    box on
end

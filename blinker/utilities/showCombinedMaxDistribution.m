function fighan = showCombinedMaxDistribution(blinkFileNames, uniqueName, usedLabel, params)
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
    if nargin < 4 || isempty(params)
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
    
    theBlinks = cell(length(blinkFileNames), 1);
    maxValuesAll = [];
    leftR2All = [];
    rightR2All = [];
    usedValuesAll = [];
    for k = 1:length(blinkFileNames)
        blinks = []; blinkFits = []; blinkProperties = [];
        if ~exist(blinkFileNames{k}, 'file')
            warning('%d:%s has no combined blinks\n', k, blinkFileNames{k});
            continue;
        end
        load(blinkFileNames{k});
        if isempty(blinks.usedSignal) || isnan(blinks.usedSignal)
            warning('%d: %s has no blinks\n', k, blinkFileNames{k});
            continue;
        elseif strcmpi(blinks.signalData.signalLabel, usedLabel) ~= 1
            warning('%d:%s signal does not match used',  k, blinkFileNames{k});
            continue;
        end
        theBlinks{k} = blinks;
        candidateSignal = blinks.signalData.signal;
        blinkPositions = blinks.signalData.blinkPositions;
        blinkFitsAll = fitBlinks(candidateSignal, blinkPositions);
        maxValues = cellfun(@double, {blinkFitsAll.maxValue});
        leftR2 = cellfun(@double, {blinkFitsAll.leftR2});
        rightR2 = cellfun(@double, {blinkFitsAll.rightR2});
        indicesNaN = isnan(leftR2) | isnan(rightR2) | isnan(maxValues);
        maxValuesAll = cat(2, maxValuesAll, maxValues(~indicesNaN));
        leftR2All = cat(2, leftR2All, leftR2(~indicesNaN));
        rightR2All = cat(2, rightR2All, rightR2(~indicesNaN));
        usedValues = cellfun(@double, {blinkFits.maxValue});
        usedValuesAll = cat(2, usedValuesAll, usedValues);
    end
    
    bestMaskTop = leftR2All >= correlationThresholdTop & ...
        rightR2All >= correlationThresholdTop;
    goodMaskBottom = leftR2All >= correlationThresholdBottom & ...
        rightR2All >= correlationThresholdBottom;
    betterMaskTop = leftR2All >= correlationThresholdMiddle & ...
        rightR2All >= correlationThresholdMiddle;
    bestValues = maxValuesAll(bestMaskTop);
    betterValues = maxValuesAll(betterMaskTop);
    goodValues = maxValuesAll(goodMaskBottom);
    
    bestMedian = median(bestValues);
    bestRobustStd = 1.4826*mad(bestValues, 1);
    upperBest = bestMedian + 5*bestRobustStd;
    xhist = linspace(min(maxValuesAll), upperBest, numberMaxBins);
    labelColor = [0, 0, 0];

    %% Now compute the histograms
    [n1, x1] = hist(maxValuesAll, xhist);
    [n2, x2] = hist(goodValues, xhist);
    [n3, x3] = hist(betterValues, xhist);
    [n4, x4] = hist(bestValues, xhist);
    [n5, x5] = hist(usedValuesAll, xhist);
%     theTitle =  [blinks.uniqueName ...
%         ' Ratio=' num2str(blinks.signalData(signalNumber).goodRatio) ...
%         ' Ch=' num2str(blinks.usedSignal) ' (' signalLabel ')'];
    theTitle = [uniqueName ':' usedLabel];
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

    xlabel(['Blink max amplitude [' num2str(min(maxValuesAll)) ...
        ', ' num2str(max(maxValuesAll)) ']']);

    ylabel('Count')
    title(theTitle, 'Interpreter', 'None', 'Color', labelColor);
    box on
end

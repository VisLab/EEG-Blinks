function  fighan = plotBlinkGroup(ID, dataName, srate, extendSeconds, ...
        thisGroup, signalData, usedSignal, actualNumber, theseProps)
% Plot an individual blink with landmarks and return a handle to the figure
%
% Parameters:
%     ID          string identifying the blink
%     dataName    string identifying the dataset 
%     srate       sample rate of data
%     extendSeconds  
%     traceNames  a cell array containing m strings identify signals
%     blinkFit    blinkFit structure to use for landmarks on this blink
%     preLimit    starting frame number in signal to display
%     postLimit   ending frame number in the signal to display
%     corrThreshold  correlation below which fit lines considered marginal
%
%     fighan      (outout)  figure handle of the resulting plot
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

%% Figure out which signals are in this group and find blink range
    extendFrames = round(extendSeconds*srate);
    numberSignals = length(signalData);
    thisGroup = thisGroup(1:numberSignals);
    isnanMask = isnan(thisGroup);
    blinkPositions = nan(2, numberSignals );
    signals = nan(numberSignals, length(signalData(1).signal));
    traceStyles = cell(1, numberSignals);
    for k = 1:numberSignals
        signals(k, :) = signalData(k).signal;
        traceStyles{k} = '--';
        if ~isnanMask(k)
           blinkPositions(:, k) = signalData(k).blinkPositions(:, thisGroup(k));
           traceStyles{k} = '-';
        end
    end
    
    %% Compute various features for labeling the plot
    signalLabels = {signalData.signalLabel};
    signalNumbers = cellfun(@double, {signalData.signalNumber});
    minPosition = min(blinkPositions(1, ~isnanMask));
    maxPosition = max(blinkPositions(2, ~isnanMask));
    minPosition = max(1, minPosition);
    maxPosition = min(maxPosition, length(signalData(1).signal));
    startPosition = max(1, minPosition - extendFrames);
    endPosition = min(maxPosition + extendFrames, length(signalData(1).signal));
    pos = find(signalNumbers == usedSignal, 1, 'first');
    [maxValue, maxIndex] = max(signals(pos, minPosition:maxPosition));
    maxFrame = minPosition + maxIndex - 1;
    zMax = (maxValue - signalData(pos).bestMedian)/signalData(pos).bestRobustStd;
    
    traceColors = jet(numberSignals);
    %traceColors = [0.8, 0.8, 0.8; 0.6, 0.6, 0.6; 0, 0, 0; traceColors(1:end-2,:)];
    traceWidths = ones(1, numberSignals);
    %traceLineWidths(1:3) = [4, 2, 1.2];
    blinkComponents = signals(:, startPosition:endPosition);
    
    fighan = figure('Color', [1, 1, 1]);
    hold on
    legendString = {};
    t = startPosition:endPosition;
    t = (t - 1)/srate;
    traceColors(pos, :) = [0.8, 0.8, 0.8];
    traceWidths(pos) = 4;      
    for k = 1:numberSignals
       bTrace = blinkComponents(k, :);
       plot(t, bTrace, 'Color', traceColors(k, :), ...
            'LineWidth', traceWidths(k), 'LineStyle', traceStyles{k});
       legendString{end + 1} = signalLabels{k}; %#ok<AGROW>
    end
    plot((minPosition - 1)/srate, 0, 'xk', 'MarkerSize', 10, 'LineWidth', 2);
    plot((maxPosition - 1)/srate, 0, 'xk', 'MarkerSize', 10, 'LineWidth', 2);
    if ~isempty(legendString)
        legend(legendString);
    end
    blinkString = '';
    if isnan(thisGroup(pos))
        labelColor = [1, 0, 0];
    elseif actualNumber == 0
        labelColor = [0, 1, 0];
    else
        
        pAVR = theseProps.posAmpVelRatioZero;
        blinkString = [' Blink:' num2str(actualNumber) ' pAVR:' num2str(pAVR)];
        if pAVR < 3 && zMax < -1
            labelColor = [0.2, 0.3, 1];
        else
            labelColor = [0, 0, 0];
        end
    end
    title2 = sprintf('Used: %d (%s) [med:%8.3f,rStd:%8.3f]', ...
                usedSignal, signalData(pos).signalLabel, ...
                signalData(pos).bestMedian, signalData(pos).bestRobustStd);
    theTitle = {[ID ': ' dataName blinkString], title2};
    title(theTitle, 'Interpreter', 'none', 'Color', labelColor)

    hold off
    xLabelString = sprintf('Time(s) [Max used:F=%10d,T=%10.3f]', ...
                           maxFrame, (maxFrame - 1)/srate);
    xlabel(xLabelString)
    
    yLabelString = sprintf('Signal(uv) max used: %8.3f [zR: %8.3f]', ...
                           maxValue, zMax);
    ylabel(yLabelString)
    box on
    drawnow
end


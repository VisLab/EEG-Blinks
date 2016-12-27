function  fighan = plotBlinkFit(ID, dataName, srate, blinkTraces, traceNames, ...
                                blinkFit, preLimit, postLimit, corrThreshold)
% Plot an individual blink with landmarks and return a handle to the figure
%
% Parameters:
%     ID          string identifying the blink
%     dataName    string identifying the dataset 
%     srate       sample rate of data
%     blinkTraces  m x n array containing m signals with n frames
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

    %% Extend for plotting
    if ~iscell(traceNames)
        traceNames = {traceNames};
    end
   
    badString = '';
    traceColors = jet(max(size(blinkTraces, 1), 3));
    traceColors = [0.8, 0.8, 0.8; 0.6, 0.6, 0.6; 0, 0, 0; traceColors(1:end-2,:)];
    traceLineWidths = ones(1, max(size(blinkTraces, 1), 3));
    traceLineWidths(1:3) = [4, 2, 1.2];
    blinkScale = max(blinkTraces(1, preLimit:postLimit));
    if blinkFit.leftR2 < corrThreshold
        badString = [badString ' [L-C]'];
    end
    if blinkFit.rightR2 < corrThreshold
        badString = [badString ' [R-C]'];
    end
        %% Perform a check 
    if blinkFit.leftBase > blinkFit.leftZero
        badString = [badString ' [L-F]'];
    end
    if blinkFit.rightBase < blinkFit.rightZero
       badString = [badString ' [R-F]'];
    end

    fighan = figure('Color', [1, 1, 1]);
    hold on
    legendString = {};
    blinkComponent = blinkTraces(1, preLimit:postLimit);
    t = preLimit:postLimit;
    t = (t - 1)/srate;
    for j = 1:size(blinkTraces, 1)
       bTrace = blinkTraces(j, preLimit:postLimit);
       bTrace = bTrace*blinkScale./max(bTrace);
       plot(t, bTrace, 'Color', traceColors(j, :), ...
            'LineWidth', traceLineWidths(j));
       legendString{end + 1} = traceNames{j}; %#ok<AGROW>
    end
    if ~isempty(legendString)
        legend(legendString);
    end
    xPts = [blinkFit.leftXIntercept, blinkFit.xIntersect];
    xPts = (xPts - 1)/srate;
    line(xPts, [0, blinkFit.yIntersect], 'LineStyle', '--', ...
        'Marker', 'none', 'LineWidth', 2, 'Color', [0, 0, 0]);
    xPts = [blinkFit.rightXIntercept, blinkFit.xIntersect];
    xPts = (xPts - 1)/srate;
    line(xPts, [0, blinkFit.yIntersect], 'LineStyle', '--', ...
        'Marker', 'none', 'LineWidth', 2, 'Color', [0, 0, 0]);
   
    line([t(1), t(end)], [0, 0], 'Color', [0.8, 0.8, 0.8]);
    
    xPts = [blinkFit.xIntersect, blinkFit.xIntersect];
    xPts = (xPts - 1)/srate;
    line(xPts, [blinkFit.yIntersect, 0], 'Color', [0, 0, 0]);
    
    %% Show the base frame locations
    leftMin = blinkFit.leftBase - preLimit + 1;
    if leftMin > 0 && leftMin <= length(blinkComponent)
        plot((blinkFit.leftBase - 1)./srate, blinkComponent(leftMin), ...
              'x', 'MarkerSize', 12, 'MarkerEdgeColor', [0, 0.8, 0], ...
              'LineWidth', 1.5);
    end
    rightMin = blinkFit.rightBase - preLimit + 1;
    if rightMin > 0 && rightMin <= length(blinkComponent)
        plot((blinkFit.rightBase - 1)./srate,...
              blinkComponent(rightMin), ...
              'x', 'MarkerSize', 12, 'MarkerEdgeColor', [0, 0.8, 0], ...
              'LineWidth', 1.5);
    end
    
    %% Show the half height blink duration calculation
    try
        durationRange = [blinkFit.leftBaseHalfHeight, blinkFit.rightBaseHalfHeight];
        durationRange = (durationRange - 1)/srate;
        line(durationRange, [blinkTraces(1, blinkFit.leftBaseHalfHeight), ...
              blinkTraces(1, blinkFit.leftBaseHalfHeight)], ...
             'LineStyle', '-', 'Color', [0, 0.8, 0]);
    catch myException
        fprintf('Error: Could not do the half-height line: %s\n', myException.message);
    end
    %% Show the point where the below water portion reaches threshold 
    labelColor = [0, 0, 0];
    if ~isempty(badString)
        labelColor = [1, 0, 0];
    end
    R2String = sprintf('R2:[%5.3f,%5.3f]', blinkFit.leftR2, blinkFit.rightR2);
    title({[ID ': ' dataName], ['Blink: ' num2str(blinkFit.number) ' ' R2String ' ' badString]}, ...
          'Interpreter', 'none', 'Color', labelColor)
 
    hold off
    
    xLabelString = sprintf('Time(s) [Max:F=%12d,T=%12g] [Left:F=%12d,T=%12g]', ...
        blinkFit.maxFrame, (blinkFit.maxFrame - 1)/srate, ...
        blinkFit.leftBase, (blinkFit.leftBase - 1)/srate);
    xlabel(xLabelString)
    ylabel('Signal(uv)')
    box on
    drawnow
end


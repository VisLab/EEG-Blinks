function  plotBlinkFit(dataName, srate, blinkTraces, traceNames, ...
                        blinkFit, blinkProperties, preLimit, postLimit)
    %% Extend for plotting
    corrThreshold = 0.98;
    ampThreshold = 0.35;
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
%     if blinkStat.leftPeakBelow > 0.1 || ...
%             blinkStat.leftPeakBelow < -ampThreshold*blinkStat.blinkPeak
%         badString = [badString ' [L-A]'];
%     end
%     if blinkStat.rightPeakBelow > 0.1 || ...
%             blinkStat.rightPeakBelow < -ampThreshold*blinkStat.blinkPeak
%         badString = [badString ' [R-A]'];
%     end
    if blinkProperties.peakTimeTent > blinkProperties.peakTimeBlink || ...
       blinkProperties.peakMaxTent < blinkProperties.peakMaxBlink
       badString = [badString ' [P-S]'];
    end
    figure('Color', [1, 1, 1])
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
    
%     %% Show positions of max positive and negative velocities
%     maxPosVelFrame = blinkFit.maxPosVelFrame - preLimit + 1;
%     if maxPosVelFrame > 0 && maxPosVelFrame <= length(blinkComponent)
%         plot((blinkFit.maxPosVelFrame - 1)./srate, ...
%               blinkComponent(maxPosVelFrame), ...
%               'o', 'MarkerSize', 10, 'MarkerEdgeColor', [0, 0.8, 0], ...
%               'LineWidth', 1.5);
%     end
%     maxNegVelFrame =  blinkFit.maxNegVelFrame - preLimit + 1;
%     if maxNegVelFrame > 0 && maxNegVelFrame <= length(blinkComponent)
%     plot((blinkFit.maxNegVelFrame - 1)./srate, ...
%           blinkComponent(maxNegVelFrame), ...
%           'o', 'MarkerSize', 10, 'MarkerEdgeColor', [0, 0.8, 0], 'LineWidth', 1.5);
%     end
%     
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
    durationRange = [blinkFit.leftBaseHalfHeight, blinkFit.rightBaseHalfHeight];
    durationRange = (durationRange - 1)/srate;
    line(durationRange, [blinkTraces(1, blinkFit.leftBaseHalfHeight), ...
          blinkTraces(1, blinkFit.leftBaseHalfHeight)], ...
         'LineStyle', '-', 'Color', [0, 0.8, 0]);
     
    %% Show the point where the below water portion reaches threshold 
%     plot((blinkFit.leftBelow - 1)/srate, 0, 'x', 'MarkerSize', 10)
%     plot((blinkFit.rightBelow - 1)/srate, 0, 'x', 'MarkerSize', 10)
    labelColor = [0, 0, 0];
    if ~isempty(badString)
        labelColor = [1, 0, 0];
    end
    R2String = sprintf('R2:[%5.3f,%5.3f]', blinkFit.leftR2, blinkFit.rightR2);
    title({dataName, ['Blink: ' num2str(blinkFit.number) ' ' R2String ' ' badString]}, ...
          'Interpreter', 'none', 'Color', labelColor)
 
    hold off

    xLabelString = sprintf('Time(s) [Max:F=%12d,T=%12g] [Left:F=%12d,T=%12g]', ...
        blinkFit.maxFrame, blinkProperties.peakTimeBlink, ...
        blinkFit.leftBase, (blinkFit.leftBase - 1)/srate);
    xlabel(xLabelString)
    ylabel('Signal(uv)')
    box on
    drawnow
end


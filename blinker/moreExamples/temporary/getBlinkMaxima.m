function [blinkMaxima, usedPositions] = getBlinkMaxima(blinks, usedComponent)
% Returns array of frames at which blink maxima occur for specified component 
%
% Parameters:
%     blinks        Blinker blinks data structure for data collection
%     usedComponent Vector of channel (or component) numbers to use for 
%                   match (or empty for default)
%     blinkMaxima   (output) frames at which maxima occur
%     usedPositions (output) Positions of the used components in 
%                   blinkPositions
%
% Written by:  Kay Robbins, UTSA
%
    blinkMaxima = [];
    if isempty(usedComponent)
        usedComponent = blinks.usedComponent;
        if isnan(usedComponent) || isempty(usedComponent)
            return;
        end
    end
    usedPositions = find(blinks.componentIndices == usedComponent, 1, 'first');
  
    blinkPositions = blinks.blinkPositions{usedPositions};
    if isempty(blinkPositions) || sum(isnan(blinkPositions(:)) ~= 0)
        return;
    end
    blinkComponent = blinks.blinkComponents(usedPositions, :);
    startBlinks = blinkPositions(1, :);
    endBlinks = blinkPositions(2, :);

    %% Find the maxFrames
    blinkMaxima = nan(1, length(startBlinks));
    for k = 1:length(startBlinks);
        blinkRange = startBlinks(k):endBlinks(k);
        [~, maxInd] = max(blinkComponent(blinkRange));
        blinkMaxima(k) = blinkRange(maxInd);
    end
end
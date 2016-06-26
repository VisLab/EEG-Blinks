function [blinkMaxima, used] = getBlinkMaxima(blinks, used)
% Returns an array of blink maxima for used component (empty uses default) 
    blinkMaxima = [];
    if isempty(used)
        used = blinks.usedComponent;
        if isnan(used) || isempty(used)
            return;
        end
        used = find(blinks.componentIndices == used, 1, 'first');
    end
    blinkPositions = blinks.blinkPositions{used};
    if isempty(blinkPositions) || sum(isnan(blinkPositions(:)) ~= 0)
        return;
    end
    blinkComponent = blinks.blinkComponents(used, :);
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
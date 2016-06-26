function blinkFits = fitBlinks(blinkComponent, blinkPositions, baseLevel)
% Fit polynomial of specified degree to blinks in blink.
%
%  Parameters:
%      blink       IC or channel time course of blinks to be fitted
%      baseLevel   Base level of the blinks (usually 0)
%
%  Returns:
%      blinkFits  - a structure with the following information
%
%   number
%   type 
%   maxFrame           frame number of the maximum
%   maxValue           value of the blink maximum
%   maxPosVelFrame     
%   maxNegVelFrame 
%   leftBase
%   rightBase 
%   leftBaseHalfHeight
%   rightBaseHalfHeight
%   leftZeroHalfHeight
%   rightZeroHalfHeight
%   leftSlope
%   rightSlope
%   leftOuter
%   rightOuter
%   leftZero        first baseLevel crossing or minimum between blinks on left 
%   rightZero       first baseLevel crossing or minimum between blinks on right 
%   leftRange
%   rightRange
%   leftPCoef
%   leftSCoef
%   leftMuCoef
%   leftR2
%   rightPCoef
%   rightSCoef
%   rightMuCoef
%   rightR2
%   xIntersect
%   yIntersect
%   leftXIntercept
%   rightXIntercept
%
if isempty(blinkComponent) || isempty(blinkPositions) || sum(isnan(blinkPositions(:)) ~= 0)
    blinkFits = [];
    return;
end
startBlinks = blinkPositions(1, :);
endBlinks = blinkPositions(2, :);

%% Find the maxFrames
maxFrames = zeros(1, length(startBlinks));
maxValues = zeros(1, length(startBlinks));
for k = 1:length(startBlinks);
    blinkRange = startBlinks(k):endBlinks(k);
    [maxValues(k), maxInd] = max(blinkComponent(blinkRange));
    maxFrames(k) = blinkRange(maxInd);
end

%% Calculate the fits
baseFraction = 0.1;   % Fraction from top and bottom
outerStarts = [1, maxFrames(1:end-1)];
outerEnds = [maxFrames(2:end), length(blinkComponent)];
blinkFits(length(maxFrames)) = createFitStructure();
for k = 1:length(maxFrames)
    blinkFits(k) = blinkFits(length(maxFrames));  %#ok<*AGROW>
end
blinkVelocity = diff(blinkComponent);
for k = 1:length(maxFrames)
    % Find the zero crossing or the minimum between blinks
    try
        blinkFits(k).number = k;
        blinkFits(k).maxFrame = maxFrames(k);
        blinkFits(k).maxValue = maxValues(k);
        blinkFits(k).leftOuter = outerStarts(k);
        blinkFits(k).rightOuter = outerEnds(k);
        %% Compute the left and right inner (0 crossing)
        theRange = outerStarts(k):maxFrames(k);
        [~, minIndex] = min(blinkComponent(theRange));
        minFrame = theRange(minIndex);
        theRange = minFrame:maxFrames(k);
        sInd = find(blinkComponent(theRange) <= baseLevel, 1, 'last');
        if ~isempty(sInd)
            blinkFits(k).leftZero = theRange(sInd);
        else % Take the smallest value before in the interval
            [~, sInd] = min(blinkComponent(theRange));
            blinkFits(k).leftZero = theRange(sInd);
        end
        theRange = maxFrames(k):outerEnds(k);
        [~, minIndex] = min(blinkComponent(theRange));
        minFrame = theRange(minIndex);
        theRange = maxFrames(k):minFrame;
        sInd = find(blinkComponent(theRange)  <= baseLevel, 1, 'first');
        if ~isempty(sInd)
            blinkFits(k).rightZero = theRange(sInd);
        else % Take the smallest value before in the interval
            [~, sInd] = min(blinkComponent(theRange));
            blinkFits(k).rightZero = theRange(sInd);
        end
        
       %% Compute the place of maximum positive and negative velocities
        upStroke = blinkFits(k).leftZero:blinkFits(k).maxFrame;
        [~, maxPosVelFrame] = max(blinkVelocity(upStroke));
        maxPosVelFrame = maxPosVelFrame + upStroke(1) - 1;
        
        downStroke = blinkFits(k).maxFrame:blinkFits(k).rightZero;
        [~, maxNegVelFrame] = min(blinkVelocity(downStroke));
        maxNegVelFrame = maxNegVelFrame + downStroke(1) - 1;
        
        %% Compute the left and right base frames
        leftBase = blinkFits(k).leftOuter: maxPosVelFrame;
        leftBaseVelocity = flip(blinkVelocity(leftBase));
        leftBaseIndex = find(leftBaseVelocity <= 0, 1, 'first');
        if isempty(leftBaseIndex)
            leftBaseIndex = 0;
        end
        blinkFits(k).leftBase =  maxPosVelFrame - leftBaseIndex;
        
        rightBase = maxNegVelFrame:...
            (min(blinkFits(k).rightOuter, length(blinkComponent) - 1));
        rightBaseVelocity = blinkVelocity(rightBase);
        rightBaseIndex = find(rightBaseVelocity >= 0, 1, 'first');
        if isempty(rightBaseIndex)
            rightBaseIndex = 0;
        end
        blinkFits(k).rightBase =  maxNegVelFrame + rightBaseIndex;
        
    
        
        %% Compute the left and right half-height frames from base
        leftHalfBase = blinkFits(k).leftBase:blinkFits(k).maxFrame;
        blinkHalfHeight = blinkComponent(maxFrames(k)) - ...
            0.5*(blinkComponent(maxFrames(k)) - blinkComponent(blinkFits(k).leftBase));
        blinkFits(k).leftBaseHalfHeight = blinkFits(k).leftBase + ...
            find(blinkComponent(leftHalfBase) >= blinkHalfHeight, 1, 'first');
        if isempty(blinkFits(k).leftBaseHalfHeight)
            blinkFits(k).leftBaseHalfHeight = nan;
        end
        rightHalfBase = blinkFits(k).maxFrame:blinkFits(k).rightOuter;
        blinkFits(k).rightBaseHalfHeight = min(blinkFits(k).rightOuter, ...
            blinkFits(k).maxFrame - 1 + ...
            find(blinkComponent(rightHalfBase) <= blinkHalfHeight, 1, 'first'));
        if isempty(blinkFits(k).rightBaseHalfHeight)
            blinkFits(k).rightBaseHalfHeight = nan;
        end
        
        %% Compute the left and right half-height frames from zero
        leftHalfBase = blinkFits(k).leftZero:blinkFits(k).maxFrame;
        blinkHalfHeight = 0.5*blinkComponent(maxFrames(k));
        blinkFits(k).leftZeroHalfHeight = blinkFits(k).leftZero + ...
            find(blinkComponent(leftHalfBase) >= blinkHalfHeight, 1, 'first');
        if isempty(blinkFits(k).leftZeroHalfHeight)
            blinkFits(k).leftZeroHalfHeight = nan;
        end
        rightHalfBase = blinkFits(k).maxFrame:blinkFits(k).rightZero;
        blinkFits(k).rightZeroHalfHeight = min(blinkFits(k).rightOuter, ...
            blinkFits(k).maxFrame - 1 + ...
            find(blinkComponent(rightHalfBase) <= blinkHalfHeight, 1, 'first'));
        if isempty(blinkFits(k).rightZeroHalfHeight)
            blinkFits(k).rightZeroHalfHeight = nan;
        end
        
        %% Compute fit ranges
        blinkHeight = blinkComponent(maxFrames(k)) - blinkComponent(blinkFits(k).leftZero);
        blinkTop = blinkComponent(maxFrames(k)) - baseFraction*blinkHeight;
        blinkBottom = blinkComponent(blinkFits(k).leftZero) + baseFraction*blinkHeight;
        blinkRange = blinkFits(k).leftZero:maxFrames(k);
        blinkTopPoint = find(blinkComponent(blinkRange) < blinkTop, 1, 'last');
        blinkBottomPoint = find(blinkComponent(blinkRange) > blinkBottom, 1, 'first');
        blinkFits(k).leftRange = ...
            [blinkRange(blinkBottomPoint), blinkRange(blinkTopPoint)];
        
        blinkRange = maxFrames(k):blinkFits(k).rightZero;
        blinkTopPoint = find(blinkComponent(blinkRange) < blinkTop, 1, 'first');
        blinkBottomPoint = find(blinkComponent(blinkRange) > blinkBottom, 1, 'last');
        blinkFits(k).rightRange = [blinkRange(blinkTopPoint), blinkRange(blinkBottomPoint)];
        xLeft = (blinkFits(k).leftRange(1):blinkFits(k).leftRange(2))';
        xRight = (blinkFits(k).rightRange(1):blinkFits(k).rightRange(2))';
        
        %% Below and above for types     
        if length(xLeft) > 1 && length(xRight) > 1
            yRight = blinkComponent(xRight)';
            yLeft = blinkComponent(xLeft)';
            [p, S, mu] = polyfit(xLeft, yLeft, 1);
            blinkFits(k).leftPCoef = p;
            blinkFits(k).leftSCoef = S;
            blinkFits(k).leftMuCoef = mu;
            yPred = polyval(p, xLeft, S, mu);
            blinkFits(k).leftR2 = corr(yLeft, yPred);
            
            [p, S, mu] = polyfit(xRight, yRight, 1);
            blinkFits(k).rightPCoef = p;
            blinkFits(k).rightSCoef = S;
            blinkFits(k).rightMuCoef = mu;
            yPred = polyval(p, xRight, S, mu);
            blinkFits(k).rightR2 = corr(yRight, yPred);
            [blinkFits(k).xIntersect, blinkFits(k).yIntersect, ...
                blinkFits(k).leftXIntercept, blinkFits(k).rightXIntercept] = ...
                getIntersection(blinkFits(k).leftPCoef, blinkFits(k).rightPCoef, ...
                blinkFits(k).leftMuCoef, blinkFits(k).rightMuCoef);
            if (blinkFits(k).xIntersect == blinkFits(k).leftXIntercept) || ...
                    (blinkFits(k).xIntersect == blinkFits(k).rightXIntercept)
                continue;
            end
            blinkFits(k).leftSlope = blinkFits(k).yIntersect./ ...
                (blinkFits(k).xIntersect - blinkFits(k).leftXIntercept);
            blinkFits(k).rightSlope = blinkFits(k).yIntersect./ ...
                (blinkFits(k).xIntersect - blinkFits(k).rightXIntercept);            
        end
    catch mex %#ok<NASGU>
        fprintf('Failed to fit blink %d\n', k);
    end
end


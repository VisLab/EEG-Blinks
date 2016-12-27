function blinkFits = fitBlinks(candidateSignal, blinkPositions)
% Fit a tent to potential blinks and calculate various shape parameters
%
%  Parameters:
%      candidateSignal    IC or channel time course of blinks to be fitted
%      blinkPositions     2 x n array of start and end frames of candidate blinks
%
%  Returns:
%      blinkFits         a structure with fit information 
%                        (See createFitStructure for definition)
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

if isempty(candidateSignal) || isempty(blinkPositions) ||...
          sum(isnan(blinkPositions(:)) ~= 0)
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
    [maxValues(k), maxInd] = max(candidateSignal(blinkRange));
    maxFrames(k) = blinkRange(maxInd);
end

%% Calculate the fits
baseFraction = 0.1;   % Fraction from top and bottom
outerStarts = [1, maxFrames(1:end-1)];
outerEnds = [maxFrames(2:end), length(candidateSignal)];
blinkFits(length(maxFrames)) = createFitStructure();
for k = 1:length(maxFrames)
    blinkFits(k) = blinkFits(length(maxFrames));  %#ok<*AGROW>
end
blinkVelocity = diff(candidateSignal);
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
        [~, minIndex] = min(candidateSignal(theRange));
        minFrame = theRange(minIndex);
        theRange = minFrame:maxFrames(k);
        sInd = find(candidateSignal(theRange) <= 0, 1, 'last');
        if ~isempty(sInd)
            blinkFits(k).leftZero = theRange(sInd);
        else % Take the smallest value before in the interval
            [~, sInd] = min(candidateSignal(theRange));
            blinkFits(k).leftZero = theRange(sInd);
        end
        theRange = maxFrames(k):outerEnds(k);
        [~, minIndex] = min(candidateSignal(theRange));
        minFrame = theRange(minIndex);
        theRange = maxFrames(k):minFrame;
        sInd = find(candidateSignal(theRange) <= 0, 1, 'first');
        if ~isempty(sInd)
            blinkFits(k).rightZero = theRange(sInd);
        else % Take the smallest value before in the interval
            [~, sInd] = min(candidateSignal(theRange));
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
            (min(blinkFits(k).rightOuter, length(candidateSignal) - 1));
        rightBaseVelocity = blinkVelocity(rightBase);
        rightBaseIndex = find(rightBaseVelocity >= 0, 1, 'first');
        if isempty(rightBaseIndex)
            rightBaseIndex = 0;
        end
        blinkFits(k).rightBase =  maxNegVelFrame + rightBaseIndex;
        
        
        
        %% Compute the left and right half-height frames from base
        leftHalfBase = blinkFits(k).leftBase:blinkFits(k).maxFrame;
        blinkHalfHeight = candidateSignal(maxFrames(k)) - ...
            0.5*(candidateSignal(maxFrames(k)) - candidateSignal(blinkFits(k).leftBase));
        blinkFits(k).leftBaseHalfHeight = blinkFits(k).leftBase + ...
            find(candidateSignal(leftHalfBase) >= blinkHalfHeight, 1, 'first');
        if isempty(blinkFits(k).leftBaseHalfHeight)
            blinkFits(k).leftBaseHalfHeight = nan;
        end
        rightHalfBase = blinkFits(k).maxFrame:blinkFits(k).rightOuter;
        blinkFits(k).rightBaseHalfHeight = min(blinkFits(k).rightOuter, ...
            blinkFits(k).maxFrame - 1 + ...
            find(candidateSignal(rightHalfBase) <= blinkHalfHeight, 1, 'first'));
        if isempty(blinkFits(k).rightBaseHalfHeight)
            blinkFits(k).rightBaseHalfHeight = nan;
        end
        
        %% Compute the left and right half-height frames from zero
        leftHalfBase = blinkFits(k).leftZero:blinkFits(k).maxFrame;
        blinkHalfHeight = 0.5*candidateSignal(maxFrames(k));
        blinkFits(k).leftZeroHalfHeight = blinkFits(k).leftZero + ...
            find(candidateSignal(leftHalfBase) >= blinkHalfHeight, 1, 'first');
        if isempty(blinkFits(k).leftZeroHalfHeight)
            blinkFits(k).leftZeroHalfHeight = nan;
        end
        rightHalfBase = blinkFits(k).maxFrame:blinkFits(k).rightZero;
        blinkFits(k).rightZeroHalfHeight = min(blinkFits(k).rightOuter, ...
            blinkFits(k).maxFrame - 1 + ...
            find(candidateSignal(rightHalfBase) <= blinkHalfHeight, 1, 'first'));
        if isempty(blinkFits(k).rightZeroHalfHeight)
            blinkFits(k).rightZeroHalfHeight = nan;
        end
        
        %% Compute fit ranges
        blinkHeight = candidateSignal(maxFrames(k)) - candidateSignal(blinkFits(k).leftZero);
        blinkTop = candidateSignal(maxFrames(k)) - baseFraction*blinkHeight;
        blinkBottom = candidateSignal(blinkFits(k).leftZero) + baseFraction*blinkHeight;
        blinkRange = blinkFits(k).leftZero:maxFrames(k);
        blinkTopPoint = find(candidateSignal(blinkRange) < blinkTop, 1, 'last');
        blinkBottomPoint = find(candidateSignal(blinkRange) > blinkBottom, 1, 'first');
        blinkFits(k).leftRange = ...
            [blinkRange(blinkBottomPoint), blinkRange(blinkTopPoint)];
        
        blinkRange = maxFrames(k):blinkFits(k).rightZero;
        blinkTopPoint = find(candidateSignal(blinkRange) < blinkTop, 1, 'first');
        blinkBottomPoint = find(candidateSignal(blinkRange) > blinkBottom, 1, 'last');
        blinkFits(k).rightRange = [blinkRange(blinkTopPoint), blinkRange(blinkBottomPoint)];
        xLeft = (blinkFits(k).leftRange(1):blinkFits(k).leftRange(2))';
        xRight = (blinkFits(k).rightRange(1):blinkFits(k).rightRange(2))';
        
        %% Below and above for types
        if length(xLeft) > 1 && length(xRight) > 1
            yRight = candidateSignal(xRight)';
            yLeft = candidateSignal(xLeft)';
            [pLeft, SLeft, muLeft] = polyfit(xLeft, yLeft, 1);
            yPred = polyval(pLeft, xLeft, SLeft, muLeft);
            blinkFits(k).leftR2 = corr(yLeft, yPred);
            
            [pRight, SRight, muRight] = polyfit(xRight, yRight, 1);
            yPred = polyval(pRight, xRight, SRight, muRight);
            blinkFits(k).rightR2 = corr(yRight, yPred);
            [blinkFits(k).xIntersect, blinkFits(k).yIntersect, ...
                blinkFits(k).leftXIntercept, blinkFits(k).rightXIntercept] = ...
                getIntersection(pLeft, pRight, muLeft, muRight);
            if (blinkFits(k).xIntersect == blinkFits(k).leftXIntercept) || ...
                    (blinkFits(k).xIntersect == blinkFits(k).rightXIntercept)
                continue;
            end
            blinkFits(k).leftSlope = blinkFits(k).yIntersect./ ...
                (blinkFits(k).xIntersect - blinkFits(k).leftXIntercept);
            blinkFits(k).rightSlope = blinkFits(k).yIntersect./ ...
                (blinkFits(k).xIntersect - blinkFits(k).rightXIntercept);
            blinkFits(k).averLeftVelocity = pLeft(1)./muLeft(2);
            blinkFits(k).averRightVelocity = pRight(1)./muRight(2);
        end
    catch mex %#ok<NASGU>
        fprintf('Failed to fit blink %d\n', k);
    end
end

    function [xIntersect, yIntersect, xIntercept1, xIntercept2] = getIntersection(p, q, u, v)
        % Return intersection of two lines given by fits p and q centered at u and v
        %
        %  Parameters:
        %      p   first linear fit:  y = p(1)*x + p(2)
        %      q   second linear fit:  y = q(1)*x + q(2)
        %      u   u(1) mean of first, u(2) std of first
        %      v   v(1) mean of first, v(2) std of first
        %
        if p(1) == 0
            xIntercept1 = NaN;
        else
            xIntercept1 = (p(1)*u(1) - p(2)*u(2))./p(1);
        end
        if q(1) == 0
            xIntercept2 = NaN;
        else
            xIntercept2 = (q(1)*v(1) - q(2)*v(2))./q(1);
        end
        if p(1) == p(2)
            xIntersect = NaN;
            yIntersect = NaN;
        else
            denom = p(1)*v(2) - q(1)*u(2);
            numer =  u(1)*p(1)*v(2) - v(1)*q(1)*u(2) ...
                + q(2)*v(2)*u(2) - p(2)*u(2)*v(2);
            xIntersect = numer./denom;
            yIntersect = p(1)*(xIntersect - u(1))./u(2) + p(2);
        end
    end

    function s = createFitStructure()
    %% Create a structure for the fits    
        s = struct( ...
            'number', nan, ...
            'maxFrame', nan, ... % Frame number of the maximum
            'maxValue', nan, ... % value of the blink maximum
            'leftOuter', nan, ... %
            'rightOuter', nan, ... %
            'leftZero', nan, ... % first baseLevel crossing or minimum between blinks on left
            'rightZero', nan, ... % first baseLevel crossing or minimum between blinks on
            'leftBase', nan, ... %
            'rightBase', nan, ... %
            'leftBaseHalfHeight', nan, ... %
            'rightBaseHalfHeight', nan, ... %
            'leftZeroHalfHeight', nan, ... %
            'rightZeroHalfHeight', nan, ... %
            'leftRange', nan, ... %
            'rightRange', nan, ... %
            'leftSlope', nan, ... %
            'rightSlope', nan, ... %
            'averLeftVelocity', nan, ...
            'averRightVelocity', nan, ...
            'leftR2', nan, ... %
            'rightR2', nan, ... %
            'xIntersect', nan, ... %
            'yIntersect', nan, ... %
            'leftXIntercept', nan, ... %
            'rightXIntercept', nan);
    end
end
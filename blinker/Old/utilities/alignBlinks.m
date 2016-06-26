function distances = alignBlinks(times1, times2, jitter)
% Creates an alignment of the blink times in times1 and times2
% Only blinks within jitter of each other can be aligned
%
% Parameters:
%    times1 = vector of times for version 1
%    times2 = vector of times for version 2
%    jitter = maximum distance allowed between blinks for alignment
%
% Output:
%    blinks = a two column vector with the times of the alignments 
%             entries of -1 if they don't match anything

%% Set up for the blink detection
distances = zeros(length(times1), length(times2));
for k = 1:length(times1)
    distances(k, :) = abs(times2(:) - times1(k));
end
distances(distances > jitter) = inf;

matchList = zeros(length(times1) + length(times2), 4);
matchList(1, :) = [1, 1, length(times1), length(times2)];
matchTop = 1;
while matchTop > 0  % While the stack has something on it
    ind = matchList(matchTop, :);
    matchTop = matchTop - 1;
    thisDist = distances(ind(1):ind(3), ind(2):ind(4));
    [minDist, minIndex] = min(thisDist(:));
    if isinf(minDist)   % No matches in this piece
        continue;
    end
    [theRow, theCol] = ind2sub(size(thisDist), minIndex);
    theRow = ind(1) + theRow - 1;
    theCol = ind(2) + theCol - 1;
    distances(theRow, :) = inf;
    distances(:, theCol) = inf;
    distances(theRow, theCol) = 0; % A placeholder
    preInd = [ind(1), ind(2), theRow - 1, theCol - 1];
    if checkIndices(preInd)
        matchTop = matchTop + 1;
        matchList(matchTop, :) = preInd;
    end
    postInd = [theRow + 1, theCol + 1, ind(3), ind(4)];
    if checkIndices(postInd)
        matchTop = matchTop + 1;
        matchList(matchTop, :) = postInd;
    end
end

    function okay = checkIndices(ind)
        okay = (sum(ind <= 0) == 0) && ind(1) <= length(times1) && ...
            ind(2) <= length(times2) && ...
            (ind(3) >= ind(1)) && (ind(4) >= ind(2));
    end
end

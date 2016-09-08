function [sortedBlinks, usedPositions] = getSortedBlinkMaxima(blinkData, n)
% Returns sorted array of blink maxima of the different types for dataset n
%
% Parameters:
%    blinkData     cell array of Blinker blinks data structures
%    n             position of the dataset to be extracted
%    sortedBlinks  (output) combined sorted blink maximum frames

%% Find total blinks and the individual blink maxima
totalBlinks = 0;
individualMaxima = cell(length(blinkData), 1);
usedPositions = -ones(length(blinkData), 1);
for k = 1:length(blinkData)
   [individualMaxima{k}, usedPositions(k)] = getBlinkMaxima(blinkData{k}(n), []);
   totalBlinks = totalBlinks + length(individualMaxima{k});                       
end

%% Now create an array with all of the blink max frames from all versions
sortedBlinks = nan(totalBlinks, 4);
startBlinks = 1;
for k = 1:length(blinkData)
    bMaxs = individualMaxima{k};
    if isempty(bMaxs)
        continue;
    end
    endBlinks = startBlinks + length(bMaxs) - 1;
    sortedBlinks(startBlinks:endBlinks, 1) = bMaxs(:);
    sortedBlinks(startBlinks:endBlinks, 2) = (1:length(bMaxs))';
    sortedBlinks(startBlinks:endBlinks, 3) = k;
    startBlinks = endBlinks + 1;
end

sortedBlinks = sortrows(sortedBlinks, [1, 2, 3]);
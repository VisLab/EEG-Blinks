function [sortedBlinks, usedIndices] = getSortedBlinkMaxima(blinkData, n)
% Returns sorted array containing positions of blink maxima.

%% Find total blinks
totalBlinks = 0;
individualMaxima = cell(length(blinkData), 1);
usedIndices = -ones(length(blinkData), 1);
for k = 1:length(blinkData)
   [individualMaxima{k}, usedIndices(k)] = getBlinkMaxima(blinkData{k}(n), []);
   totalBlinks = totalBlinks + length(individualMaxima{k});                       
end

%% Now create an array with all of the blinks
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
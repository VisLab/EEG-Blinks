function [blinkGroups, usedTypes, sortedBlinks, signalData, srate] = ...
                                groupBlinks(signalData, jitter, srate)
%% Group the blinks for multiple channels
%
%  Parameters:
%    signalData  
%    jitter
%    srate
%
%  Output:
%    blinkGroups
%    usedTypes
%    sortedBlinks
%    signalData
%    srate
%
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

frameThreshold = round(jitter*srate);
sortedBlinks = getSortedMaxima(signalData);
if isempty(sortedBlinks)
    blinkGroups = [];
    usedTypes = NaN;
    sortedBlinks = [];
    return;
end
usedTypes = unique(sortedBlinks(:, 4));  % Different signals
numberTypes = length(usedTypes);
blinkGroups = nan(size(sortedBlinks, 1), length(usedTypes));
blinkDist = diff(sortedBlinks(:, 1));
thisGroup = 0;
notDone = true;

%% Iterate to group
while (notDone)
  [mValue, mInd] = min(blinkDist);
  if mValue > frameThreshold
      break;
  end
  firstType = sortedBlinks(mInd(1), 4);
  firstType = find(usedTypes == firstType);
  nextType = sortedBlinks(mInd(1) + 1, 4);
  nextType = find(usedTypes == nextType);
  group1 = sortedBlinks(mInd(1), 5);
  group2 = sortedBlinks(mInd(1) + 1, 5);
  if isnan(group1) && isnan(group2)
     thisGroup = thisGroup + 1;
     sortedBlinks(mInd(1), 5) = thisGroup;
     sortedBlinks(mInd(1) + 1, 5) = thisGroup;
     blinkGroups(thisGroup, firstType) = sortedBlinks(mInd(1), 2);
     blinkGroups(thisGroup, nextType) = sortedBlinks(mInd(1) + 1, 2);
 
  elseif ~isnan(group1) && isnan(blinkGroups(group1, nextType))
       % First is in a group that second should join
        sortedBlinks(mInd(1) + 1, 5) = group1;
        blinkGroups(group1, nextType) = sortedBlinks(mInd(1) + 1, 2);
  elseif ~isnan(group2) && isnan(blinkGroups(group2, firstType))
        sortedBlinks(mInd(1), 5) = group2;
        blinkGroups(group2, firstType) = sortedBlinks(mInd(1), 2);
  end
  blinkDist(mInd(1)) = inf;
end

%% Consolidate extra groups
blinkGroups = blinkGroups(1:thisGroup, :);

%% Now put the ones that have been left out
for k = 1:numberTypes
    thisType = usedTypes(k);
    theseBlinks = sortedBlinks(:, 4) == thisType;
    theseBlinks = sortedBlinks(theseBlinks, 2);
    maxBlink = max(theseBlinks);
    thisGroup = unique(blinkGroups(:, k));
    thisGroup(isnan(thisGroup)) = [];
    leftOut = setdiff(1:maxBlink, thisGroup);
    if isempty(leftOut)
        continue;
    end
    additionalGroups = nan(length(leftOut), numberTypes);
    additionalGroups(:, k) = leftOut(:);
    blinkGroups = [blinkGroups; additionalGroups]; %#ok<AGROW>
end

%% Now consolidate duplicate blinks
for j = 1:length(usedTypes)
    blinkGroups = sortrows(blinkGroups, j);
    indices = 1:length(usedTypes);
    indices(indices == j) = [];
    for k = 1:size(blinkGroups, 1)-1
        if blinkGroups(k, j) == blinkGroups(k + 1, j)
            row1 = blinkGroups(k, 1:end);
            row2 = blinkGroups(k + 1, 1:end);
            bothNaNs = sum(isnan(row1) & isnan(row2));
            z = sum(xor(isnan(row1), isnan(row2)));
            if z == length(row1) - 1 - bothNaNs
                for m = 1:length(indices)
                    if isnan(row2(indices(m)))
                        blinkGroups(k + 1, indices(m)) = blinkGroups(k, indices(m));
                    end
                end
                blinkGroups(k, j) = -1;
            end
        end
    end
    blinkGroups(blinkGroups(:, j) == -1, :) = [];
end

%% Now expand the blinkGroups to compute the last frame of each group
blinkGroups = [blinkGroups, nan(size(blinkGroups, 1), 1)];
totalBlinks = size(sortedBlinks, 1);
maps = cell(numberTypes, 1);
for k = 1:length(maps)
   maps{k} = containers.Map('KeyType', 'double', 'ValueType', 'double');
   blinkMask = sortedBlinks(:, 4) == usedTypes(k);
   theseIndices = 1:totalBlinks;
   theseIndices = theseIndices(blinkMask);
   theseBlinks = sortedBlinks(blinkMask, :);
   for m = 1:length(theseBlinks)
       maps{k}(theseBlinks(m, 2)) = theseIndices(m);
   end
end

%% now regroup
for k = 1:size(blinkGroups, 1);
    maxTime = 0;
    for m = 1:numberTypes
        mPos = blinkGroups(k, m);
        if isnan(mPos)
            continue;
        end
        mInd = maps{m}(mPos); % Position in the sortedBlinks
        mTime = sortedBlinks(mInd, 1);
        maxTime = max(maxTime, mTime);
    end
    blinkGroups(k, end) = maxTime;
end

%% Sort the group by the frame and add group numbers to sorted blinks
blinkGroups = sortrows(blinkGroups, size(blinkGroups, 2));

gNums = nan(totalBlinks, 1);
for k = 1:size(blinkGroups, 1)
    for m = 1:numberTypes
        mPos = blinkGroups(k, m);
        if isnan(mPos)
            continue;
        end
        mInd = maps{m}(mPos); % Position in the sortedBlinks
        gNums(mInd) = k;
    end
end
sortedBlinks(:, end) = gNums;

%% Sort by the frame of the last item in the group.
blinkGroups = sortrows(blinkGroups, size(blinkGroups, 2));
sortedBlinks = [sortedBlinks, sortedBlinks(:, 1)/srate];
end

function sortedBlinks = getSortedMaxima(signalData)
% Returns sorted array of blink maxima for a signalData structure

%% Find total blinks and the individual blink maxima
    totalBlinks = 0;
    individualMaxima = cell(length(signalData), 1);
    for n = 1:length(signalData)
       individualMaxima{n} = ...
           getBlinkMaxima(signalData(n).signal, signalData(n).blinkPositions);
       totalBlinks = totalBlinks + length(individualMaxima{n});                       
    end

    %% Now create an array with all of the blink max frames from all versions
    sortedBlinks = nan(totalBlinks, 5);
    startBlinks = 1;
    for n = 1:length(signalData)
        bMaxs = individualMaxima{n};
        signal = signalData(n).signal;
        endBlinks = startBlinks + length(bMaxs) - 1;
        sortedBlinks(startBlinks:endBlinks, 1) = bMaxs(:);
        sortedBlinks(startBlinks:endBlinks, 2) = (1:length(bMaxs))';
        sortedBlinks(startBlinks:endBlinks, 3) = signal(bMaxs(:));
        sortedBlinks(startBlinks:endBlinks, 4) = n;
        startBlinks = endBlinks + 1;
    end

    sortedBlinks = sortrows(sortedBlinks, 1:4);
end

function blinkMaxima = getBlinkMaxima(signal, blinkPositions)
%% Returns array of frames at which blink maxima occur for specified positions
    startBlinks = blinkPositions(1, :);
    endBlinks = blinkPositions(2, :);
    blinkMaxima = nan(1, length(startBlinks));
    for n = 1:length(startBlinks);
        blinkRange = startBlinks(n):endBlinks(n);
        [~, maxInd] = max(signal(blinkRange));
        blinkMaxima(n) = blinkRange(maxInd);
    end
end
function [blinkGroups, usedTypes, sortedBlinks] = groupBlinks(sortedBlinks, frameThreshold)
% Return the groups
if isempty(sortedBlinks)
    blinkGroups = [];
    usedTypes = NaN;
    sortedBlinks = [];
    return;
end
usedTypes = unique(sortedBlinks(:, 3));
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
  firstType = sortedBlinks(mInd(1), 3);
  firstType = find(usedTypes == firstType);
  nextType = sortedBlinks(mInd(1) + 1, 3);
  nextType = find(usedTypes == nextType);
  group1 = sortedBlinks(mInd(1), 4);
  group2 = sortedBlinks(mInd(1) + 1, 4);
  if isnan(group1) && isnan(group2)
     thisGroup = thisGroup + 1;
     sortedBlinks(mInd(1), 4) = thisGroup;
     sortedBlinks(mInd(1) + 1, 4) = thisGroup;
     blinkGroups(thisGroup, firstType) = sortedBlinks(mInd(1), 2);
     blinkGroups(thisGroup, nextType) = sortedBlinks(mInd(1) + 1, 2);
 
  elseif ~isnan(group1) && isnan(blinkGroups(group1, nextType))
       % First is in a group that second should join
        sortedBlinks(mInd(1) + 1, 4) = group1;
        blinkGroups(group1, nextType) = sortedBlinks(mInd(1) + 1, 2);
  elseif ~isnan(group2) && isnan(blinkGroups(group2, firstType))
        sortedBlinks(mInd(1), 4) = group2;
        blinkGroups(group2, firstType) = sortedBlinks(mInd(1), 2);
  end
  blinkDist(mInd(1)) = inf;
end

%% Consolidate extra groups
blinkGroups = blinkGroups(1:thisGroup, :);

%% Now put the ones that have been left out
for k = 1:numberTypes
    thisType = usedTypes(k);
    theseBlinks = sortedBlinks(:, 3) == thisType;
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
   blinkMask = sortedBlinks(:, 3) == usedTypes(k);
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

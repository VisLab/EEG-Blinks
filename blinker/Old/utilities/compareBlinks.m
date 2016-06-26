function blinkMatches = compareBlinks(blinks, jitter)

blinkMatches = createMatchStructure();
numberCompares = length(blinks);
fileNames = cell(numberCompares, 1);
types = cell(numberCompares, 1);
numberBlinks = zeros(numberCompares, 1);
usedComponents = nan(numberCompares, 1);
indexPositions = nan(numberCompares, 1);

for k = 1:numberCompares
    fileNames{k} = blinks{k}.fileName;
    types{k} = blinks{k}.type;
    usedComponents(k) = blinks{k}.usedComponent;
    if ~isnan(usedComponents(k)) && ~isempty(usedComponents(k));
        indexPositions(k) = find(blinks{k}.componentIndices == usedComponents(k), ...
                        1, 'first');
        numberBlinks(k) = blinks{k}.numberBlinks(indexPositions(k));
    end
                    
end

blinkMatches.fileNames = fileNames;
blinkMatches.types = types;
blinkMatches.numberBlinks = numberBlinks;

%% Compute pairwise blinks
pairwiseMatches = cell(numberCompares - 1, 1);
if isnan(blinks{1}.usedComponent)
    return;
end
rawBase = blinks{1}.blinkPositions{indexPositions(1)};
rawBase = (rawBase(1, :) - 1)/blinks{1}.srate;
pairwiseSizes = zeros(numberCompares - 1, 1);
for k = 2:numberCompares
    if isnan(indexPositions(k))
        continue;
    end
    rawBlinks = blinks{k}.blinkPositions{indexPositions(k)};
    rawBlinks = (rawBlinks(1, :) - 1)/blinks{k}.srate;
    d = alignBlinks(rawBase', rawBlinks', jitter);
    pairwiseMatches{k - 1} = matchBlinks(rawBase, rawBlinks, d); 
    pairwiseSizes(k - 1) = size(pairwiseMatches{k - 1}, 1);
end
blinkMatches.pairwise = pairwiseMatches;
blinkMatches.pairwiseSizes = pairwiseSizes;


%% Combine all blinks
all = -ones(length(rawBase), numberCompares);
all(:, 1) = (1:length(rawBase))';
allCounts = zeros(numberCompares - 1, 1);
for k = 2:numberCompares
    pairs = pairwiseMatches{k - 1};
    baseIndex = 1;
    pairIndex = 1;
    while pairIndex <= size(pairs, 1)
        if pairs(pairIndex, 1) == baseIndex
            all(baseIndex, k) = pairs(pairIndex, 2);
            baseIndex = baseIndex + 1;
        elseif pairs(pairIndex, 1) ~= -1
            warning(['all match failed on comparison %d [baseIndex = %d,' ...
                    ' pairIndex = %d]'], k, baseIndex, pairIndex);
            break;
        end
        pairIndex = pairIndex + 1;
    end
    allCounts(k - 1) = sum(all(:, k) ~= -1);
end

matches = sum(all ~= -1, 2);
blinkMatches.allMatched = sum(matches == numberCompares);
blinkMatches.all = all;
blinkMatches.allCounts = allCounts;
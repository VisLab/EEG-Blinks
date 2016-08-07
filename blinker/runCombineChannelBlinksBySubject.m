%% Extract the blinks structure based on channel or EOG time series
% This script assumes that EEGLAB is in the path, that the datasets are
% in EEGLAB EEG structures. The particular example run is for the ARL-Shoot
% collection. To run for your own data:
% 
%  1)  Put your data in one of the supported formats as indicated by
%      the collectionType:
%        FILES    all of the .set files are in one directory
%        FILES2     .set files are in subdirectories one level down from root
%        ESSLEVEL1  .set files are in an ESS Level 1 container
%        ESSLEVEL2  .set files are in an ESS Level 2 container
%        ESSDERIVED .set files are in an ESS Level derived container
%      The collectionType is used with the getFileList function to 
%      get a cell array called files with the full paths of all of the 
%      EEG .set files to be analyzed. If your data is in a different 
%      format, you will need to provide your own cell array called files 
%      with the full paths of the EEG files to be analyzed.
%      
%   2)  Downstream analysis requires the following information for each
%       dataset: [subjectID, experiment, uniqueName, task, startTime]  
%       You must manually put this into the blinks structure or add
%       code to getDatasetInfo function to do this during this call.
%
%% Extract the blinks structure
pop_editoptions('option_single', false, 'option_savetwofiles', false);
correlationThreshold = 0.90;
correlationThresholdTop = 0.98;
correlationThresholdBottom = 0.90;
blinkLowerAmpThreshold = 3;  % Blink amplitudes to rest should be >= 3
blinkUpperAmpThreshold = 50; % Limit upper bound of amplitudes
cutoffRatioThreshold = 0.7;  % Test this
zeroLevel = 0;               % The base level of the blink (usually 0)
minGoodBlinks = 10;          % Minumum number of blinks to work;
%% Shooter
organizationType = 'Shooter';
type = 'EOGUnrefNewBoth';
%type = 'ChannelUnrefNewBoth';
collectionType = 'FILES2';    %Shooter organized is subdirectories by subject
experiment = 'Shooter';
pathName = 'E:\CTADATA\Shooter\Level0';
outDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
excludedTasks = {'EC', 'EO'};

%% BCI2000
% organizationType = 'BCI2000';
% type = 'ChannelMastNewBoth';
% experiment = 'BCI2000';
% outDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
% excludedTasks = {'EyesOpen', 'EyesClosed'};
%% Load the blink file
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([outDir filesep blinkFile]);

%% Set up the subject and task masks
subjectIDs = {blinks.subjectID};
tasks = {blinks.task};
taskMask = true(size(subjectIDs));
for k = 1:length(excludedTasks)
    taskMask = taskMask & ~strcmpi(tasks, excludedTasks{k});
end;
uniqueSubjects = unique(subjectIDs);

%% Run the blinker blink extraction to create a file.
blinkRemap(length(uniqueSubjects)) = struct('subjectID', nan, ...
         'signalLabels', nan,  'cutoffs', nan, 'bestMedians', nan, ...
         'bestRobustStds', nan, 'goodRatios', nan, 'goodCounts', nan, ...
         'numberBlinks', nan, 'usedSignal', nan, 'usedSign', nan);
for k = 1:length(uniqueSubjects)-1
    blinkRemap(k) = blinkRemap(length(uniqueSubjects));
end

for k = 1:length(uniqueSubjects)
    fprintf('Processing subject %s\n', uniqueSubjects{k});
    blinkRemap(k).subjectID = uniqueSubjects{k};
    theseTasks = strcmpi(subjectIDs, uniqueSubjects{k}) & taskMask;
    theseBlinks = blinks(theseTasks);
    blinkIndices = zeros(length(theseBlinks) + 1, 1);
    %% Create a map with locations --- last position is count
    signalMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
    for j = 1:length(theseBlinks)
        indices = theseBlinks(j).signalIndices;
        info = theseBlinks(j).signalInfo;
        for m = 1:length(indices)
            pos = find(info.signalIndices == indices(m), 1, 'first');
            label = lower(info.signalLabels{pos});
            if isKey(signalMap, label)
                thisList = signalMap(label);
            else
                thisList = blinkIndices;
            end
            thisList(j) = indices(m);
            thisList(end) = thisList(end) + size(theseBlinks(j).blinkPositions{m}, 2);
            signalMap(label) = thisList;
        end
    end
    
    %% Now consolidate the blinks and compute the distributions
    theKeys = keys(signalMap);
    blinkRemap(k).signalLabels = theKeys;
    cutoffs = nan(length(theKeys), 1);
    bestMedians = nan(length(theKeys), 1);
    bestRobustStds = nan(length(theKeys), 1);
    goodRatios = nan(length(theKeys), 1);
    goodCounts = zeros(size(goodRatios));
    numberBlinks = zeros(size(goodRatios));
    for n = 1:length(theKeys)
        thisKey = theKeys{n};
        thisList = signalMap(thisKey);
        combinedGoodMask = false(thisList(end), 1);
        combinedBestMask = false(thisList(end), 1);
        combinedMaxValues = nan(thisList(end), 1);
        numValues = 0;
        for j = 1:length(theseBlinks)
            thisIndex = thisList(j);
            dBlinks = theseBlinks(j);
            if thisIndex == 0
                continue;
            end
            indices = dBlinks.signalIndices;
            pos = find(indices == thisList(j), 1, 'first');
            
            blinkFits = fitBlinks(dBlinks.candidateSignals(pos, :), ...
                dBlinks.blinkPositions{pos}, zeroLevel);
            if isempty(blinkFits)
                continue;
            end
            
            %% Now calculate the cutoff ratios
            maxValues = {blinkFits.maxValue};
            indicesNaN = cellfun(@isnan, maxValues);
            maxValues = cellfun(@double, maxValues);
            bestMask = getGoodBlinkMask(blinkFits, correlationThresholdTop);
            goodMask = getGoodBlinkMask(blinkFits, correlationThresholdBottom);
            if length(bestMask) ~= length(maxValues)
                fprintf('Warning %s does not match top mask %d all %d\n', ...
                dBlinks.fileName, length(bestMask), length(maxValues));
                continue;
            end
            maxValues = maxValues(~indicesNaN);
            bestMask = bestMask(~indicesNaN);
            goodMask = goodMask(~indicesNaN);
            combinedMaxValues(numValues + 1: numValues + length(maxValues)) = ...
                maxValues;
            combinedBestMask(numValues + 1: numValues + length(maxValues)) = ...
                bestMask;
            combinedGoodMask(numValues + 1: numValues + length(maxValues)) = ...
                goodMask;
            numValues = numValues + length(maxValues);
        end
        if numValues < length(combinedMaxValues)
            fprintf('Channel %s: expected %d values but actually there were %d values\n', ...
                    thisKey, length(combinedMaxValues), numValues);
        end
        combinedMaxValues = combinedMaxValues(1:numValues);
        combinedBestMask = combinedBestMask(1:numValues);
        combinedGoodMask = combinedGoodMask(1:numValues);
        bestValues = combinedMaxValues(combinedBestMask);
        worstValues = combinedMaxValues(~combinedGoodMask);
        goodValues = combinedMaxValues(combinedGoodMask);
        goodCounts(n) = length(goodValues);
        fprintf('Best: %d, worst: %d, good: %d\n', ...
            length(bestValues), length(worstValues), length(goodValues));
        bestMedians(n) = nanmedian(bestValues);
        bestRobustStds(n) = 1.4826*mad(bestValues, 1);
        worstMedians = nanmedian(worstValues);
        worstRobustStds = 1.4826*mad(worstValues, 1);
        cutoffs(n) = (bestMedians(n)*worstRobustStds + ...
            worstMedians*bestRobustStds(n))/...
            (bestRobustStds(n) + worstRobustStds);

        all = sum(combinedMaxValues <= bestMedians(n) + 2*bestRobustStds(n) & ...
            combinedMaxValues >= bestMedians(n) - 2*bestRobustStds(n));
        if all == 0
            warning('Subject %s channel %d does not have blinks\n', ...
                uniqueSubjects{k}, theKeys{n});
        else
            goodRatios(n) = ...
                sum(goodValues <= bestMedians(n) + 2*bestRobustStds(n) & ...
                goodValues >= bestMedians(n) - 2*bestRobustStds(n))/all;
        end
             
        %% Now calculate the ratios of good blinks to all blinks
        numberBlinks(n) = numValues;
    end
    blinkRemap(k).cutoffs = cutoffs;
    blinkRemap(k).bestMedians = bestMedians;
    blinkRemap(k).bestRobustStds = bestRobustStds;
    blinkRemap(k).goodRatios = goodRatios;
    blinkRemap(k).numberBlinks = numberBlinks;
    blinkRemap(k).goodCounts = goodCounts;
  
    cutoffMask = goodRatios >= cutoffRatioThreshold;
    if sum(cutoffMask) > 0
       goodCandidates = goodCounts(cutoffMask);
       goodKeys = theKeys(cutoffMask);
       [maxBlinks, maxInd] = max(goodCandidates);
       blinkRemap(k).usedSignal = goodKeys{maxInd};
       blinkRemap(k).usedSign = 1;
    else
       [maxBlinks, maxInd] = max(goodCounts);
       blinkRemap(k).usedSignal = theKeys{maxInd};
       blinkRemap(k).usedSign = -1;
    end

end

%% Output the selected channel
for k = 1:length(uniqueSubjects)
    if isnan(blinkRemap(k).usedSignal)
        ratios = blinkRemap(k).cutoffRatios;
        [maxRatio, pos] = max(ratios);  
    else
        pos = find(strcmpi(blinkRemap(k).signalLabels, ...
                   blinkRemap(k).usedSignal), 1, 'first');
    end
    used = blinkRemap(k).signalLabels{pos};
    fprintf('%s: %s ratio=%g total=%g  good=%g\n', uniqueSubjects{k}, ...
         used, blinkRemap(k).goodRatios(pos), ...
         blinkRemap(k).numberBlinks(pos), blinkRemap(k).goodCounts(pos));
end

%% Now remap
combinedFile = [experiment 'BlinksNew' type 'CombinedMaps.mat'];
save ([outDir filesep combinedFile], 'blinkRemap', 'signalMap', '-v7.3');

%% Now create the new blinks file
subjects = {blinkRemap.subjectID};
blinksOld = blinks;
for k = 35%1:length(blinks)
    theSubject = blinks(k).subjectID;
    pos = find(strcmpi(subjects, theSubject), 1, 'first');
    rmap = blinkRemap(pos);
    used = rmap.usedSignal;
    if isnan(used)
        blinks(k).usedSignal = NaN; %#ok<*SAGROW>
        continue;
    end
    myLabels = blinks(k).signalInfo.signalLabels;
    myIndices = blinks(k).signalInfo.signalIndices;
    availableIndices = blinks(k).signalIndices;
    availableLabels = cell(size(availableIndices));
    mapIndices = zeros(size(availableIndices));
    for n = 1:length(availableIndices)
        pos = find(myIndices == availableIndices(n), 1, 'first');
        availableLabels{n} = myLabels{pos};
        pos = find(strcmpi(rmap.signalLabels, availableLabels{n}), 1, 'first');
        mapIndices(n) = pos;
    end
    blinks(k).bestMedian = rmap.bestMedians(mapIndices);
    blinks(k).bestRobustStd = rmap.bestRobustStds(mapIndices);
    blinks(k).goodRatios = rmap.goodRatios(mapIndices);
    blinks(k).cutoff = rmap.cutoffs(mapIndices);
    
   
    myPos = find(strcmpi(availableLabels, used), 1, 'first');
    if isempty(myPos)
        blinks(k).usedSignal = NaN; %#ok<*SAGROW>
        continue;
    end 
    blinks(k).usedSignal = rmap.usedSign*availableIndices(myPos);
end   
%% Save the combined file
combinedFile = [experiment 'BlinksNew' type 'Combined.mat'];
save ([outDir filesep combinedFile], 'blinks', '-v7.3');



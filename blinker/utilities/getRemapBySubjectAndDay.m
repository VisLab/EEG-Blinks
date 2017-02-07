function [blinkRemap, signalMap] = getRemapBySubjectAndDay(blinkIndir, blinkFiles, ...
    typeBlinks, excludedTasks, correlationTop, correlationBottom, cutoffRatioThreshold)

%% Calculate blinkRemap structure to select right signal based on amplitude
% using the subject and day for the combination
%
% Parameters
%    blinkIndir     directory of blink structures to be combined
%    blinkFiles     file with dataset subject and other metadata 
%    typeBlinks     string indicating "type" of dataset (used to get names)
%    excludedTasks  cell array of excluded task names
%    correlationTop correlation threshold for "best" blinks
%    correlationBottom  correlation threshold for "acceptable" blinks
%    cutoffRatioThreshold  cutoff for ratio of good blinks to all blinks
%                           (usually set to 0.7)
%
%  Output:
%    blinkRemap  -  gives combined remap data for the individual subjects
%    signalMap   -  channel number for subject
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
%
%% Set up the subject, task and day masks
subjectIDs = {blinkFiles.subjectID};
tasks = {blinkFiles.task};
startDates = {blinkFiles.startDate};
taskMask = true(size(subjectIDs));
for k = 1:length(excludedTasks)
    taskMask = taskMask & ~strcmpi(tasks, excludedTasks{k});
end;
uniqueSubjects = unique(subjectIDs);
uniqueDays = unique(startDates);

%% Unique subject map gives the start dates of the available items
uniqueSubjectMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
totalCombinations = 0;
for k = 1:length(uniqueSubjects)
    thisSubjectMask = strcmpi(subjectIDs, uniqueSubjects{k});
    theseStartDates = unique(startDates(thisSubjectMask));
    totalCombinations = totalCombinations + length(theseStartDates);
    uniqueSubjectMap(uniqueSubjects{k}) = theseStartDates;
end

%% Create the remap structure for the subjects
blinkRemap(totalCombinations) = getRemapStructure();
for k = 1:totalCombinations-1
    blinkRemap(k) = blinkRemap(end);
end

%% Now process to compute the remap
kN = 0;   % Keeps count of current remap
for k = 1:length(uniqueSubjects)
    thisSubject = uniqueSubjects{k};
    fprintf('\nProcessing subject %s\n', thisSubject);
    theseDates = uniqueSubjectMap(thisSubject);
    for kD = 1:length(theseDates)
        kN = kN + 1;
        thisDate = theseDates{kD};
        fprintf('     Date: %s\n', thisDate);
        blinkRemap(kN).subjectID = thisSubject;
        blinkRemap(kN).startDate = thisDate;
        theseTasks = strcmpi(subjectIDs, thisSubject) & ...
                             strcmpi(startDates, thisDate) & taskMask;
        theseBlinkFiles = blinkFiles(theseTasks);
        blinkStructures = cell(length(theseBlinkFiles), 1);
        signalMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
        blinkIndices = zeros(length(theseBlinkFiles) + 1, 1);
        blinkFileNames = cell(length(theseBlinkFiles), 1);
        %% Find the blinkStructures for this subject and date
        for n = 1:length(blinkStructures)
            blinkFileNames{n} = theseBlinkFiles(n).blinkFileName;
            try
                blinks = []; blinkFits = []; blinkProperties =[]; params = []; %#ok<*NASGU>
                theFile = [theseBlinkFiles(n).blinkFileName '_' typeBlinks '.mat'];
                sTemp = load([blinkIndir filesep theFile]);
                blinks = sTemp.blinks;
                blinkFits = sTemp.blinkFits;
                blinkProperties = sTemp.blinkProperties;
          
            catch Mex
                warning('%s could not be read: %s\n', ...
                    theseBlinkFiles(n).blinkFileName, Mex.message);
                continue;
            end
            if isempty(blinks) || isempty(blinkFits)
                warning('%s does not contain blinks\n', ...
                    theseBlinkFiles(n).blinkFileName);
                continue;
            end
            blinkStructures{n} = blinks;
            sData = blinkStructures{n}.signalData;
            for m = 1:length(sData)
                if isKey(signalMap, sData(m).signalLabel)
                    thisList = signalMap(sData(m).signalLabel);
                else
                    thisList = blinkIndices;
                end
                thisList(n) = sData(m).signalNumber;
                thisList(end) = thisList(end) + size(sData(m).blinkPositions, 2);
                signalMap(sData(m).signalLabel) = thisList;
            end
        end
             
        %% Now consolidate the blinks and compute the distributions
        theKeys = keys(signalMap);
        blinkRemap(kN).signalLabels = theKeys;
        blinkRemap(kN).blinkFileNames = blinkFileNames;
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
            for j = 1:length(blinkStructures)
                if thisList(j) == 0 || isempty(blinkStructures{j})
                    continue;
                end
                sData = blinkStructures{j}.signalData;
                indices = cellfun(@double, {sData.signalNumber});
                pos = find(indices == thisList(j), 1, 'first');
                
                blinkFits = fitBlinks(sData(pos).signal, sData(pos).blinkPositions);
                if isempty(blinkFits)
                    continue;
                end
                
                %% Now calculate the cutoff ratios
                maxValues = cellfun(@double, {blinkFits.maxValue});
                leftR2 = cellfun(@double, {blinkFits.leftR2});
                rightR2 = cellfun(@double, {blinkFits.rightR2});
                indicesNaN = isnan(maxValues)|isnan(leftR2)|isnan(rightR2);
                bestMask = leftR2 >= correlationTop & ...
                    rightR2 >= correlationTop & ~indicesNaN;
                goodMask = leftR2 >= correlationBottom & ...
                    rightR2 >= correlationBottom & ~indicesNaN;
                if length(bestMask) ~= length(maxValues)
                    %                     fprintf('Warning %s does not match top mask %d all %d\n', ...
                    %                         theseBlinks(j).fileName, length(bestMask), length(maxValues));
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
        
        blinkRemap(kN).cutoffs = cutoffs;
        blinkRemap(kN).bestMedians = bestMedians;
        blinkRemap(kN).bestRobustStds = bestRobustStds;
        blinkRemap(kN).goodRatios = goodRatios;
        blinkRemap(kN).numberBlinks = numberBlinks;
        blinkRemap(kN).goodCounts = goodCounts;
        
        cutoffMask = goodRatios >= cutoffRatioThreshold;
        if sum(cutoffMask) > 0
            goodCandidates = goodCounts(cutoffMask);
            goodKeys = theKeys(cutoffMask);
            [~, maxInd] = max(goodCandidates);
            blinkRemap(kN).usedSignal = goodKeys{maxInd};
            blinkRemap(kN).usedSign = 1;
        else
            [~, maxInd] = max(goodCounts);
            blinkRemap(kN).usedSignal = theKeys{maxInd};
            blinkRemap(kN).usedSign = -1;
        end
    end
end

%% Output the selected channel
for kN = 1:length(blinkRemap)
    if isempty(blinkRemap(kN).usedSignal)
        goodRatios = blinkRemap(kN).goodRatios;
        [~, pos] = max(goodRatios);
    else
        pos = find(strcmpi(blinkRemap(kN).signalLabels, ...
            blinkRemap(kN).usedSignal), 1, 'first');
    end
    if isempty(pos)
        fprintf('Subject %s failed on day %s\n', blinkRemap(kN).subjectID, ...
                blinkRemap(kN).startDate);
        continue;
    end
    used = blinkRemap(kN).signalLabels{pos};
    fprintf('Subject %s date %s: ratio=%g total=%g  good=%g\n', ...
        blinkRemap(kN).subjectID, blinkRemap(kN).startDate, ...
        used, blinkRemap(kN).goodRatios(pos), ...
        blinkRemap(kN).numberBlinks(pos), blinkRemap(kN).goodCounts(pos));
end

    function s = getRemapStructure()
        s = struct('subjectID', nan,  'startDate', nan, ...
            'blinkFiles', nan, ...
            'signalLabels', nan,  'cutoffs', nan, 'bestMedians', nan, ...
            'bestRobustStds', nan, 'goodRatios', nan, 'goodCounts', nan, ...
            'numberBlinks', nan, 'usedSignal', nan, 'usedSign', nan);
    end
end
function [blinks, params] = extractBlinks(candidateSignals, signalType, params)
% Extract blinks structure from array of time series -- assumes params checked
%
% Parameters:
%     candidateSignals  array of selected signals: numSignals x numFrames
%                       should be filtered (usually from 1 to 20 Hz)
%     params            parameter structure with all defaults filled in
%          
%
%  Output:
%     blinks             a blink structure 
%     params             parameter structure with all values filled in.
%
% The fields of params that are used in this function:
%     srate
%     signalNumbers
%     signalLabels
%     stdThreshold
%     correlationThresholdTop
%     correlationThresholdBottom
%     blinkAmpRange

% This is the low level blink extraction function, which is usually not
% called directly. Most of the time, you will want to call the wrapper 
% extractBlinksEEG to set up the calls using an EEGLAB EEG structure.
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

%% Set the blinks structure
blinks  = createBlinksStructure();
blinks.srate = params.srate;
blinks.status = ''; 

%% Preallocate the signal data structure and find the blink positions
signalData(length(params.signalNumbers)) = createSignalDataStructure();
for k = 1:length(params.signalNumbers)
    signalData(k) = createSignalDataStructure();
    signalData(k).signalType = signalType;
    signalData(k).signalNumber = params.signalNumbers(k);
    signalData(k).signalLabel = params.signalLabels{k};
    signalData(k).signal = candidateSignals(k, :);
    signalData(k).blinkPositions = getBlinkPositions(signalData(k).signal, ...
        params.srate, params.stdThreshold);
    signalData(k).numberBlinks = size(signalData(k).blinkPositions, 2);
end

%% Process each signal
correlationThresholdTop = params.correlationThresholdTop;
correlationThresholdBottom = params.correlationThresholdBottom;
parfor k = 1:length(params.signalNumbers)
    try
        blinkFits = fitBlinks(signalData(k).signal, signalData(k).blinkPositions);
        if isempty(blinkFits)
            continue;
        end
        
        %% Calculate an amplitude criterion (frames in blink to those out)
        leftZero = cellfun(@double, {blinkFits.leftZero});
        rightZero = cellfun(@double, {blinkFits.rightZero});
        maxValues = cellfun(@double, {blinkFits.maxValue});
        leftR2 = cellfun(@double, {blinkFits.leftR2});
        rightR2 = cellfun(@double, {blinkFits.rightR2});
        badIndices = isnan(leftZero) | isnan(rightZero) | isnan(maxValues) | ...
            isnan(leftR2) | isnan(rightR2);
        leftZero = leftZero(~badIndices);
        rightZero = rightZero(~badIndices);
        maxValues = maxValues(~badIndices);
        leftR2 = leftR2(~badIndices);
        rightR2 = rightR2(~badIndices);
        blinkMask = false(1, length(signalData(k).signal));
        for j = 1:length(leftZero)
            if rightZero(j) > leftZero(j)
                blinkMask(leftZero(j):rightZero(j)) = true;
            end
        end
        outsideBlink = signalData(k).signal > 0 & ~blinkMask;
        insideBlink =  signalData(k).signal > 0 & blinkMask;
        signalData(k).blinkAmpRatio = ...
            mean(signalData(k).signal(insideBlink))./ ...
            mean(signalData(k).signal(outsideBlink));
        
        %% Now calculate the cutoff ratios -- use default for the values
        goodMaskTop = leftR2 >= correlationThresholdTop & ...
            rightR2 >= correlationThresholdTop;
        goodMaskBottom = leftR2 >= correlationThresholdBottom & ...
            rightR2 >= correlationThresholdBottom;
        if sum(goodMaskTop) < 2 
            continue;
        end
        bestValues = maxValues(goodMaskTop);
        worstValues = maxValues(~goodMaskBottom);
        goodValues = maxValues(goodMaskBottom);
        allValues = maxValues;
        signalData(k).bestMedian = nanmedian(bestValues);
        signalData(k).bestRobustStd = 1.4826*mad(bestValues, 1);
        worstMedian = nanmedian(worstValues);
        worstRobustStd = 1.4826*mad(worstValues, 1);
        signalData(k).cutoff = (signalData(k).bestMedian*worstRobustStd + ...
            worstMedian*signalData(k).bestRobustStd)/...
            (signalData(k).bestRobustStd + worstRobustStd);
        all = sum(allValues <= signalData(k).bestMedian + ...
            2*signalData(k).bestRobustStd & ...
            allValues >= signalData(k).bestMedian - ...
            2*signalData(k).bestRobustStd);
        if all ~= 0
            signalData(k).goodRatio = ...
                sum(goodValues <= signalData(k).bestMedian + ...
                2*signalData(k).bestRobustStd & ...
                goodValues >= signalData(k).bestMedian - ...
                2*signalData(k).bestRobustStd)/all;
        end
        signalData(k).numberGoodBlinks = sum(goodMaskBottom);
    catch Mex
        fprintf('Failed at component: %d %s\n', k, Mex.message);
    end
end

%% Reduce the number of candidate signals based on the blink amp ratios
blinkAmpRatios = cellfun(@double, {signalData.blinkAmpRatio});
goodIndices = blinkAmpRatios >= params.blinkAmpRange(1) & ...
              blinkAmpRatios <= params.blinkAmpRange(2);
if sum(goodIndices) == 0 || isempty(goodIndices)
    blinks.usedSignal = nan;
    blinks.status = ['failure: ' blinks.status ...
        '[Blink amplitude too low -- may be noise]'];
    return;
end
signalData = signalData(goodIndices);

%% Find the ones that meet the minimum good blink threshold
usedSign = 1;
candidates = cellfun(@double, {signalData.numberGoodBlinks});
goodCandidates = candidates > params.minGoodBlinks;
if sum(goodCandidates) == 0
    blinks.status = ['failure: ' blinks.status ...
        '[fewer than ' num2str(params.minGoodBlinks) ' were found]'];
    blinks.usedSignal = NaN;
    return;
end
signalData = signalData(goodCandidates);

%% Now see if any candidates meet the good blink ratio criteria
goodRatios = cellfun(@double, {signalData.goodRatio});
ratioIndices = goodRatios >= params.goodRatioThreshold;
testData = signalData;
if sum(ratioIndices) == 0
    usedSign = -1;
    blinks.status = ['failure: ' blinks.status '[Good ratio too low]'];
elseif ~params.keepSignals
    testData = testData(ratioIndices);
end

%% Now pick the one with the maximum number of good blinks
goodBlinks = cellfun(@double, {testData.numberGoodBlinks});
[~, maxIndex ] = max(goodBlinks);
if usedSign == 1
    blinks.status = ['success: ' blinks.status];
end
blinks.usedSignal = usedSign*testData(maxIndex).signalNumber;
blinks.signalData = testData;

    function s = createSignalDataStructure()
        %% Create a structure for a signalData structure
        s = struct( ...
            'signalType', NaN, ...
            'signalNumber', NaN, ...
            'signalLabel', NaN, ...
            'numberBlinks', NaN, ...
            'numberGoodBlinks', NaN, ...
            'blinkAmpRatio', NaN, ...
            'cutoff', NaN, ...
            'bestMedian', NaN, ...
            'bestRobustStd', NaN, ...
            'goodRatio', NaN, ...
            'signal', NaN', ...
            'blinkPositions', NaN ...
            );
    end

    function s = createBlinksStructure()
        % Return an empty blink structure
        s  = struct('fileName', NaN, ...
            'srate', NaN, ...
            'subjectID', NaN, ...
            'experiment', NaN, ...
            'uniqueName', NaN, ...
            'task', NaN, ...
            'startTime', NaN, ...
            'signalData', NaN, ...
            'usedSignal', NaN, ...
            'status', NaN);
    end
end
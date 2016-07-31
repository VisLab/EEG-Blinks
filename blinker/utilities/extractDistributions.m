function  = extractDistributions(blinks, srate)
% Extract a blinks structure from an array of time series
%
% Parameters:
%     signals           channels(ICs) x time array of potential signals
%     srate             sampling rate for the signal
%     signalInfo        structure with details about the signals
%     stdThreshold      threshold for extracting initial blinks
%
%  Output:
%     blinks             a blink structure 
%
% The function band-pass filters prior to analysis. The signals can be
% EEG channels, 

%% Defaults           
correlationThreshold = 0.90;
correlationThresholdTop = 0.98;
correlationThresholdBottom = 0.90; 
blinkLowerAmpThreshold = 3;  % Blink amplitudes to rest should be >= 3
blinkUpperAmpThreshold = 50; % Limit upper bound of amplitudes
cutoffRatioThreshold = 0.7;  % Test this
zeroLevel = 0;               % The base level of the blink (usually 0)
minGoodBlinks = 10;          % Minumum number of blinks to work;
%% Set the blinks structure
blinks  = createBlinksStructure();
blinks.srate = srate;
blinks.status = ''; 
%% Set the blink information in the blinks structure
blinks.candidateSignals = signals;
blinks.signalInfo = signalInfo;
signalIndices = signalInfo.signalIndices;
blinks.signalIndices = signalIndices;

%% Compute raw blinks
blinkPositions = cell(length(signalIndices), 1);
numberBlinks = zeros(length(signalIndices), 1);

for k = 1:length(signalIndices)
  blinkPositions{k} = getBlinkPositions(signals(k, :), srate, stdThreshold);
  numberBlinks(k) = size(blinkPositions{k}, 2);
end

blinks.blinkPositions = blinkPositions;
blinks.numberBlinks = numberBlinks;
goodBlinks = zeros(length(signalIndices), 1);
blinkAmpRatios = zeros(length(signalIndices), 1);
cutoff = zeros(length(signalIndices), 1);
cutoffRatios = zeros(length(signalIndices), 1);
minusCutoffRatios = zeros(length(signalIndices), 1);
bothCutoffRatios = zeros(length(signalIndices), 1);
bestMedian = zeros(length(signalIndices), 1);
bestRobustStd = zeros(length(signalIndices), 1);
ratioDirections = nan(length(signalIndices), 1);
for k = 1:length(signalIndices)
    try
      blinkFits = fitBlinks(blinks.candidateSignals(k, :), ...
                               blinks.blinkPositions{k}, zeroLevel);
      if isempty(blinkFits)
          continue;
      end
      goodMask = getGoodBlinkMask(blinkFits, correlationThreshold);
      goodBlinks(k) = sum(goodMask);
     %% Calculate an amplitude criterion (frames in blink to those out)
      leftZero = {blinkFits.leftZero};
      rightZero = {blinkFits.rightZero};
      badIndices = cellfun(@isnan, leftZero) | ...
                   cellfun(@isnan, rightZero)| ...
                   cellfun(@isempty, leftZero) | ...
                   cellfun(@isempty, rightZero);
      leftZero = cell2mat(leftZero(~badIndices));
      rightZero = cell2mat(rightZero(~badIndices));
      blinkMask = false(1, length(blinks.candidateSignals(k, :)));
      for j = 1:length(leftZero)
          if rightZero(j) > leftZero(j)
              blinkMask(leftZero(j):rightZero(j)) = true;
          end
      end
      outsideBlink = blinks.candidateSignals(k, :) > 0 & ~blinkMask;
      insideBlink =  blinks.candidateSignals(k, :) > 0 & blinkMask;
      blinkAmpRatios(k) = mean(blinks.candidateSignals(k, insideBlink))./ ...
                         mean(blinks.candidateSignals(k, outsideBlink));
                     
      %% Now calculate the cutoff ratios
        maxValues = {blinkFits.maxValue};
        indicesNaN = cellfun(@isnan, maxValues);
        maxValues = cellfun(@double, maxValues);
        goodMaskTop = getGoodBlinkMask(blinkFits, correlationThresholdTop);
        goodMaskBottom = getGoodBlinkMask(blinkFits, correlationThresholdBottom);
        if isempty(goodMaskTop) || isempty(goodMaskBottom)
            continue;
        end
               bestValues = maxValues(goodMaskTop & ~indicesNaN);
        worstValues = maxValues(~goodMaskBottom & ~indicesNaN);
        goodValues = maxValues(goodMaskBottom & ~indicesNaN);
        allValues = maxValues(~indicesNaN);
        bestMedian(k) = nanmedian(bestValues);
        bestRobustStd(k) = 1.4826*mad(bestValues, 1);
        worstMedian = nanmedian(worstValues);
        worstRobustStd = 1.4826*mad(worstValues, 1);
        cutoff(k) = (bestMedian(k)*worstRobustStd + ...
                     worstMedian*bestRobustStd(k))/...
                    (bestRobustStd(k) + worstRobustStd);
        all = sum(allValues >= cutoff(k));
        if all ~= 0
            cutoffRatios(k) = sum(goodValues >= cutoff(k))/all;
        end
        all = sum(allValues <= cutoff(k));
        if all ~= 0
            minusCutoffRatios(k) = sum(goodValues <= cutoff(k))/all;
        end
        all = sum(allValues <= bestMedian(k) + 2*bestRobustStd(k) & ...
                  allValues >= bestMedian(k) - 2*bestRobustStd(k));
        if all ~= 0
           bothCutoffRatios(k) = sum(goodValues <= bestMedian(k) + 2*bestRobustStd(k) & ...
                     goodValues >= bestMedian(k) - 2*bestRobustStd(k))/all;
        end
    catch Mex
        fprintf('Failed at component: %d %s\n', k, Mex.message);
    end
end
blinks.goodBlinks = goodBlinks;
blinks.blinkAmpRatios = blinkAmpRatios;

%% Reduce based on amplitude
goodIndices = blinkAmpRatios >= blinkLowerAmpThreshold & ...
              blinkAmpRatios <= blinkUpperAmpThreshold;
if sum(goodIndices) == 0
   blinks.usedSignal = nan;
   blinks.status = ['failure: ' blinks.status ...
                    '[Blink amplitude too low -- may be noise]'];
   return;
end
blinks.signalIndices = blinks.signalIndices(goodIndices);
blinks.candidateSignals = blinks.candidateSignals(goodIndices, :);
blinks.blinkPositions = blinks.blinkPositions(goodIndices);
blinks.numberBlinks = blinks.numberBlinks(goodIndices);
blinks.goodBlinks = blinks.goodBlinks(goodIndices);
blinks.blinkAmpRatios = blinks.blinkAmpRatios(goodIndices);
blinks.cutoff = cutoff(goodIndices);

blinks.bestMedian = bestMedian(goodIndices);
blinks.bestRobustStd = bestRobustStd(goodIndices);

%% Now calculate the ratios of good blinks to all blinks
ratioDirections = ones(size(cutoffRatios));
minusIndices =  cutoffRatios < minusCutoffRatios;
ratioDirections(minusIndices) = -1;
cutoffRatios(minusIndices) = minusCutoffRatios(minusIndices);
bothIndices = cutoffRatios < bothCutoffRatios;
ratioDirections(bothIndices) = 0;
cutoffRatios(bothIndices) = bothCutoffRatios(bothIndices);

ratioDirections = ratioDirections(goodIndices);
blinks.ratioDirections = ratioDirections;
cutoffRatios = cutoffRatios(goodIndices);
blinks.goodRatios = cutoffRatios;

if isempty(cutoffRatios)
   blinks.usedSignal = nan;
   blinks.status = ['failure: ' blinks.status '[Amplitude ratio out of range]'];
   return;
end
%% Find the ones that meet the threshold
ratioIndices = cutoffRatios >= cutoffRatioThreshold;
if sum(ratioIndices) == 0
   blinks.usedSignal = nan;
   blinks.status = ['failure: ' blinks.status '[Good ratio too low]'];
   return;
end
signalIndices = blinks.signalIndices;
goodBlinks = blinks.goodBlinks;
candidates = goodBlinks(ratioIndices);
candidateIndices = signalIndices(ratioIndices);
[maxGood, maxIndex ] = max(candidates);
if maxGood < minGoodBlinks
    blinks.usedSignal = nan;
    blinks.status = ['failure: ' blinks.status ...
                    '[fewer than ' num2str(minGoodBlinks) ' were found]'];
else
    blinks.usedSignal = candidateIndices(maxIndex);
    blinks.status = ['success: ' blinks.status];
end
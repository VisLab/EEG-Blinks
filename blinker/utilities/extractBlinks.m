function blinks = extractBlinks(signals, srate, signalIndices, signalInfo)
% Extract a blinks structure from an array of time series
%
% Parameters:
%     signals           channels(ICs) x time array of potential signals
%     srate             sampling rate for the signal
%     signalIndices     indices in the original data array of the signals
%     signalInfo        structure with details about the signals
%
%  Output:
%     blinks             a blink structure 
%
% The function band-pass filters prior to analysis. The signals can be
% EEG channels, 

%% Defaults 
correlationThreshold = 0.90;
blinkLowerAmpThreshold = 3;  % Blink amplitudes to rest should be >= 3
blinkUpperAmpThreshold = 100;% Limit upper bound of amplitudes
zeroLevel = 0;               % The base level of the blink (usually 0)
%% Set the blinks structure
blinks  = createBlinksStructure();
blinks.srate = srate;
blinks.status = ''; 
%% Set the blink information in the blinks structure
blinks.blinkComponents = signals;
blinks.blinkInfo = signalInfo;
blinks.componentIndices = signalIndices;

%% Compute raw blinks
blinkPositions = cell(length(signalIndices), 1);
numberBlinks = zeros(length(signalIndices), 1);

for k = 1:length(signalIndices)
  blinkPositions{k} = getBlinkPositions(signals(k, :), srate);
  numberBlinks(k) = size(blinkPositions{k}, 2);
end
blinks.blinkPositions = blinkPositions;
blinks.numberBlinks = numberBlinks;
goodBlinks = zeros(length(signalIndices), 1);
blinkAmpRatio = zeros(length(signalIndices), 1);
for k = 1:length(signalIndices)
    try
      blinkFits = fitBlinks(blinks.blinkComponents(k, :), ...
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
      blinkMask = false(1, length(blinks.blinkComponents(k, :)));
      for j = 1:length(leftZero)
          if rightZero(j) > leftZero(j)
              blinkMask(leftZero(j):rightZero(j)) = true;
          end
      end
      outsideBlink = blinks.blinkComponents(k, :) > 0 & ~blinkMask;
      insideBlink =  blinks.blinkComponents(k, :) > 0 & blinkMask;
      blinkAmpRatio(k) = mean(blinks.blinkComponents(k, insideBlink))./ ...
                         mean(blinks.blinkComponents(k, outsideBlink));
    catch Mex
        fprintf('Failed at component: %d %s\n', k. Mex.message);
    end
end
blinks.goodBlinks = goodBlinks;
blinks.blinkAmpRatio = blinkAmpRatio;

%% Reduce based on amplitude
goodIndices = blinkAmpRatio >= blinkLowerAmpThreshold & ...
              blinkAmpRatio <= blinkUpperAmpThreshold;
if sum(goodIndices) == 0
   blinks.usedComponent = nan;
   blinks.status = ['failure: ' blinks.status ...
                    '[Blink amplitude too low -- may be noise]'];
   return;
end

blinks.componentIndices = blinks.componentIndices(goodIndices);
blinks.blinkComponents = blinks.blinkComponents(goodIndices, :);
blinks.blinkPositions = blinks.blinkPositions(goodIndices);
blinks.numberBlinks = blinks.numberBlinks(goodIndices);
blinks.goodBlinks = blinks.goodBlinks(goodIndices);
blinks.blinkAmpRatio = blinks.blinkAmpRatio(goodIndices);
[maxGood, maxIndex] = max(blinks.goodBlinks);
if maxGood == 0
    [~, maxIndex] = max(blinks.numberBlinks);
end
if blinks.numberBlinks(maxIndex) == 0
    blinks.usedComponent = nan;
    blinks.status = ['failure: ' blinks.status '[no blinks were found]'];
else
    blinks.usedComponent = blinks.componentIndices(maxIndex);
    blinks.status = ['success: ' blinks.status];
end

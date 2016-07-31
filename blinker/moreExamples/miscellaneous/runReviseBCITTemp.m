%% Adds post-processing minus

%% BCIT Examples
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNew';
%type = 'EOGUnrefNew';
type = 'ChannelUnrefNew';
%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkFileNew = [experiment 'BlinksNew' type 'Revised.mat'];
%load([blinkDir filesep blinkFile]);

%% Run through the items that are NaN and adjust
NanCount = 0;
revisedCount = 0;
for k = 1:length(blinks)
    if isnan(blinks(k).cutoff)
        NanCount = NanCount + 1;
        continue;
    elseif isnan(blinks(k).usedSignal) || blinks(k).usedSignal < 0
        revisedCount = revisedCount + 1;
        goodCounts = blinks(k).goodBlinks;
        goodRatios = blinks(k).goodRatios;
       
        signalIndices = blinks(k).signalIndices;
%         eligible = goodCounts > 10 & (signalIndices >= 65 & signalIndices <=68) | ...
%                     (signalIndices >= 257 & signalIndices <= 260);
        eligible = goodCounts > 10;
        if sum(eligible) == 0
            NanCount = NanCount + 1;
            blinks(k).usedSignal = NaN;
            continue;
        end
        goodRatios = goodRatios(eligible);
        [maxValue, maxIndex] = max(goodRatios);
        signalIndices = signalIndices(eligible);
        
        usedChannel = signalIndices(maxIndex);
        indices = blinks(k).signalInfo.signalIndices;
        labels = blinks(k).signalInfo.signalLabels;
        pos = find(indices == usedChannel, 1, 'first');
        fprintf('%d: now channel %d (%s) ratio = %g\n', k, usedChannel, ...
                 labels{pos}, goodRatios(maxIndex));
        blinks(k).usedSignal = -usedChannel;
    end
end
fprintf('NanCount = %d  revisedCount = %d\n', NanCount, revisedCount);

%% Save the
save ([blinkDir filesep blinkFileNew], 'blinks', '-v7.3');
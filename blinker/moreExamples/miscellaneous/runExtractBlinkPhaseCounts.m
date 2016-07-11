%% This extracts blink information for an individual file
%          
%% Set up the files for reading
inDir = 'E:\CTADATA\WholeNightDreams\data\level0';
blinkDir = 'E:\CTADATA\WholeNightDreams\data\blinks';
experiment = 'Dreams';
type = 'EOGMast';
outputDir = 'E:\CTADATA\WholeNightDreams\data\blinks';

%% Set up the rating scale
numberSubjects = 20;
ratingIndices = {-3:5; -3:5};
numberRatings = length(ratingIndices);
meaningsAASM = {'Unk', 'Unk', 'Unk', 'Unk', 'N3', 'N2', 'N1', 'REM', 'Wake'};
meaningsRK = {'Unk', 'Unk', 'Move', 'S4', 'S3', 'S2', 'S1', 'REM', 'Wake'};
myMeanings{1} = containers.Map(ratingIndices{1}, meaningsAASM);
myMeanings{2} = containers.Map(ratingIndices{2}, meaningsRK);

%% Load the blink data and the hypnodata
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);
hBlinkFile = [experiment 'HBlinksNew' type '.mat'];
load([blinkDir filesep hBlinkFile]);
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
load([blinkDir filesep blinkPropertiesFile]);

%% Save the extracted blink datasets
blinksPerMin = cell(length(ratingIndices), 1);
stageMinutes = cell(length(ratingIndices), 1);
blinkDurations = cell(length(ratingIndices), 1);
pAVRs = cell(length(ratingIndices), 1);
nAVRs = cell(length(ratingIndices), 1);
for n = 1:numberRatings
    blinkCounts = zeros(length(ratingIndices{n}), numberSubjects);
    sleepCounts = zeros(length(ratingIndices{n}), numberSubjects);
    bDurations = zeros(length(ratingIndices{n}), numberSubjects);
    bPAVR = zeros(length(ratingIndices{n}), numberSubjects);
    bNAVR = zeros(length(ratingIndices{n}), numberSubjects);
    theseIndices = ratingIndices{n};
    numberStages = length(theseIndices);
    for k = 1:numberSubjects
        
        %% Get out the start frames of the blinks
        startBlinks = hBlinks(k).blinkPositions(1, :);
        srate = blinks(k).srate;
        durations = cell2mat({blinkProperties{k}.durationHalfZero});
        pAVR = cell2mat({blinkProperties{k}.posAmpVelRatioZero});
        nAVR = cell2mat({blinkProperties{k}.negAmpVelRatioZero});
        %% Get out the sleep stage ratings
        hypnoChannels = hBlinks(k).hypnoChannels;
        blinkRatings = hypnoChannels(:, startBlinks);
        [numberRatings, numberBlinks] = size(blinkRatings);
        if numberRatings ~= length(ratingIndices)
            warning('%d: subject only has %d hypnochannels', k, numberRatings);
            continue;
        end
        for s = 1:numberStages
            thisRating = ratingIndices{n}(s);
            blinkCounts(s, k) = sum(blinkRatings(n, :) == thisRating);
            sleepCounts(s, k) = sum(hypnoChannels(n, :) == thisRating);
            bDurations(s, k) = nanmean(durations(blinkRatings(n, :) == thisRating));
            bPAVR(s, k) = nanmean(pAVR(blinkRatings(n, :) == thisRating));
            bNAVR(s, k) = nanmean(nAVR(blinkRatings(n, :) == thisRating));
            
        end
        sleepCounts(:, k) = sleepCounts(:, k)/srate/60;
        sleepMask = sleepCounts(:, k) > 0;
        blinkCounts(sleepMask, k) = blinkCounts(sleepMask, k)./sleepCounts(sleepMask, k);
    end
    blinksPerMin{n} = blinkCounts;
    stageMinutes{n} = sleepCounts;
    blinkDurations{n} = bDurations;
    pAVRs{n} = bPAVR;
    nAVRs{n} = bNAVR;
end

%% Save the values
theName = [experiment 'DatasetBlinksByStages' type '.mat'];
outName = [outputDir filesep theName];
save(outName, 'meaningsAASM', 'meaningsRK', 'blinksPerMin', ...
    'stageMinutes', 'blinkDurations', 'pAVRs', 'nAVRs', '-v7.3');

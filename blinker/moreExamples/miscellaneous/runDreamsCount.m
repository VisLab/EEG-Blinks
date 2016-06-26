%% Load the data
blinkDir = 'E:\CTADATA\WholeNightDreams\SebastiansData';
fileName = 'DreamsDatasetBlinksHypnogramsEOGMastsubject1.mat';
load([blinkDir filesep fileName]);

meaningsAASM = {'Unk', 'N3', 'N2', 'N1', 'REM', 'Wake'};
meaningsRK = {'S4', 'S3', 'S2', 'S1', 'REM', 'Wake'};

myMeanings{1} = containers.Map(0:5, meaningsAASM);
myMeanings{2} = containers.Map(0:5, meaningsRK);
%% Get out the start frames of the blinks
startBlinks = dHBlinks.blinkPositions(1, :);

%% Get out the sleep stage ratings
hypnoChannels = dHBlinks.hypnoChannels;
blinkRatings = hypnoChannels(:, startBlinks);
uniqueRatings = unique(blinkRatings(:));

%% Count how many blinks in the original data in each stage of sleep
numberStages = length(uniqueRatings);
numberFrames = size(hypnoChannels, 2);
[numberRatings, numberBlinks] = size(blinkRatings);
blinkCounts = zeros(numberStages, numberRatings);
sleepCounts = zeros(numberStages, numberRatings);
for k = 1:numberStages
    thisRating = uniqueRatings(k);
    blinkCounts(k, :) = sum(blinkRatings == thisRating, 2);
    sleepCounts(k, :) = sum(hypnoChannels == thisRating, 2);
end
sleepStageMinutes = sleepCounts/dBlinks.srate/60;
blinksPerMinuteByStage = blinkCounts./sleepStageMinutes;

%% Output number of blinks per min for each of the stages of sleep.
for n = 1:numberRatings
    fprintf('Rating System %s\n', dHBlinks.hypnoLabels{n});
    thisMap = myMeanings{n};
    for k = 1:numberStages
        thisRating = uniqueRatings(k);
        if isKey(thisMap, thisRating)
            stage = thisMap(thisRating);
        else
            stage = 'Unk';
        end
        fprintf('  Stage %s: %g\n', stage, blinksPerMinuteByStage(k, n));
    end
end

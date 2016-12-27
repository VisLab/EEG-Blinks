%% Script to calculate breakdown of select channels and blink totals
% Requires the blinks data structure to have been computed.

%% BCIT counts
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinksNew';
% typeBlinks = 'EOGUnrefNewBoth';
% %typeBlinks = 'ChannelUnrefNewBoth';
% excludeTasks = {};

%% BCI2000 counts
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
% excludeTasks = {'EyesOpen', 'EyesClosed'};
% typeBlinks = 'ChannelMastNewBothCombined';

%% NCTU counts
blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
experiment = 'NCTU_LK';
typeBlinks = 'AllMastNewBoth';
excludeTasks = {};
%% Shooter examples
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRevised';
% experiment = 'Shooter';
% %typeBlinks = 'ChannelUnrefNewBothCombined';
% typeBlinks = 'EOGUnrefNewBothCombined';
% excludeTasks = {'EO', 'EC'};

%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];
load([blinkDir filesep blinkFile]);

%% Find the excluded tasks
excludeMask = false(1, length(blinks));
for k = 1:length(blinks)
    truth = false;
    for n = 1:length(excludeTasks)    
        if strcmpi(blinks(k).task, excludeTasks{n})
            truth = true;
            break;
        end
    end
    excludeMask(k) = truth;
end

%% Analyze the blinks 
usedSignals = cellfun(@double, {blinks.usedSignal});
nanComponents = isnan(usedSignals) & ~excludeMask;
numDatasets = length(blinks);
numActual = sum(~excludeMask);
%% Display the count of nan datasets
datasetBase = 1:numDatasets;
fprintf('Percentage of NaN datasets: %g\n', ...
                         100*sum(nanComponents)/numActual);
fprintf('Number of NaN datasets: %g\n  [', sum(nanComponents));
fprintf('%d ', datasetBase(isnan(usedSignals) & ~excludeMask));
fprintf(']\n');

%% Display the count of marginal datasets
datasetBase = 1:numDatasets;
marginalComponents = usedSignals < 0 & ~excludeMask;
fprintf('Percentage of marginal datasets: %g\n', ...
                         100*sum(marginalComponents)/numActual);
fprintf('Number of marginal datasets: %g\n  [', sum(marginalComponents));
fprintf('%d ', datasetBase(marginalComponents));
fprintf(']\n');

goodComponents = usedSignals > 0 & ~excludeMask;
fprintf('Number of good datasets: %g\n', sum(goodComponents));
fprintf('Percentage of good datasets: %g\n', ...
         100*sum(goodComponents)/numActual);

%%
datasetBase = 1:length(usedSignals);
mapGood = containers.Map('KeyType', 'char', 'ValueType', 'any');
mapMarginal = containers.Map('KeyType', 'char', 'ValueType', 'any');
totalBlinksMarginal = 0;
totalBlinksGood = 0;
goodBlinksMarginal = 0;
goodBlinksGood = 0;
totalSecondsGood = 0;
totalSecondsMarginal = 0;
for k = 1:length(blinks)
    if isnan(usedSignals(k)) || excludeMask(k)
        continue;
    end
    sData = blinks(k).signalData;
    signalNumbers = cellfun(@double, {sData.signalNumber});
    pos = find(signalNumbers == abs(usedSignals(k)), 1, 'first');
    theLabel = lower(sData(pos).signalLabel);
    seconds = length(sData(pos).signal)/blinks(k).srate;
    if usedSignals(k) < 0 
        if isKey(mapMarginal, theLabel)
            theCount = mapMarginal(theLabel);
        else
            theCount = 0;
        end
        theCount = theCount + 1;
        mapMarginal(theLabel) = theCount;
        totalBlinksMarginal = totalBlinksMarginal + sData(pos).numberBlinks;
        goodBlinksMarginal = goodBlinksMarginal + sData(pos).numberGoodBlinks;
        totalSecondsMarginal = totalSecondsMarginal + seconds;
    else
        if isKey(mapGood, theLabel)
            theCount = mapGood(theLabel);
        else
            theCount = 0;
        end
        theCount = theCount + 1;
        mapGood(theLabel) = theCount;
        totalBlinksGood = totalBlinksGood + sData(pos).numberBlinks;
        goodBlinksGood = goodBlinksGood + sData(pos).numberGoodBlinks;
        totalSecondsGood = totalSecondsGood + seconds;
    end
    maxGood = max(cellfun(@double, {sData.goodRatio}));
    fprintf('%d: channel %s (%d) good ratio %g (max good ratio %g)\n', ...
        k, theLabel, usedSignals(k), sData(pos).goodRatio, maxGood);
end          

%% Now output the counts
fprintf('Channel counts for the good datasets\n');
goodKeys = keys(mapGood);
for k = 1:length(goodKeys)
    fprintf('%s: %d\n', goodKeys{k}, mapGood(goodKeys{k}));
end

fprintf('\nChannel counts for the marginal datasets\n');
marginalKeys = keys(mapMarginal);
for k = 1:length(marginalKeys)
    fprintf('%s: %d\n', marginalKeys{k}, mapMarginal(marginalKeys{k}));
end

%% Print total values
fprintf('Total blinks good datasets: %d\n', totalBlinksGood);
fprintf('Total good blinks good datasets: %d\n', goodBlinksGood);
fprintf('Total seconds good datasets: %d\n', totalSecondsGood);
totalMinutesGood = totalSecondsGood/60;
fprintf('Minutes good datasets: %g\n', totalMinutesGood);
fprintf('Blinks/minute good datasets: %g\n', totalBlinksGood/totalMinutesGood);

%% Print marginal values
fprintf('Total blinks marginal datasets: %d\n', totalBlinksMarginal);
fprintf('Total good blinks good datasets: %d\n', goodBlinksMarginal);
fprintf('Total seconds marginal datasets: %d\n', totalSecondsMarginal);
totalMinutesMarginal = totalSecondsMarginal/60;
fprintf('Minutes marginal datasets: %g\n', totalMinutesMarginal);
fprintf('Blinks/minute marginal datasets: %g\n', totalBlinksMarginal/totalMinutesMarginal);

%% Print overal values
totalBlinks = totalBlinksGood + totalBlinksMarginal;
totalGoodBlinks = goodBlinksGood + goodBlinksMarginal;
totalSeconds = totalSecondsGood + totalSecondsMarginal;
fprintf('Total blinks: %d\n', totalBlinks);
fprintf('Total good blinks: %d\n', totalGoodBlinks);
fprintf('Total seconds: %d\n', totalSeconds);
totalMinutes = totalSeconds/60;
fprintf('Minutes datasets: %g\n', totalMinutes);
fprintf('Blinks/minute datasets: %g\n', totalBlinks/totalMinutes);


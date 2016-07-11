%% BCIT counts
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinks';
type = 'EOGUnrefNew';
excludedTasks = {};
VEOGChannels = [67, 68, 259, 260];

%% Shooter examples
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
% experiment = 'Shooter';
% type = 'ChannelUnref';
% %type = 'EOGUnref';
% excludedTasks = {'EO', 'EC'};
% VEOGChannels = [5, 6];
%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
%load([blinkDir filesep blinkFile]);

%% Find the excluded tasks
excludedMask = false(1, length(blinks));
for k = 1:length(blinks)
    truth = false;
    for n = 1:length(excludedTasks)    
        if strcmpi(blinks(k).task, excludedTasks{n})
            truth = true;
            break;
        end
    end
    excludedMask(k) = truth;
end

%% Analyze the blinks 
usedSignals = {blinks.usedSignal};
usedSignals = cellfun(@double, usedSignals);
uniqueComponents = unique(usedSignals(~excludedMask));
nanComponents = isnan(uniqueComponents);
theComponents = uniqueComponents(~nanComponents);
numDatasets = length(blinks);
numActual = sum(~excludedMask);
%% Display the counts
datasetBase = 1:numDatasets;
fprintf('Percentage of NaN datasets: %g\n', ...
                         100*sum(nanComponents)/numActual);
fprintf('Number of NaN datasets: %g\n  [', sum(nanComponents));
fprintf('%d ', datasetBase(isnan(usedSignals) & ~excludedMask));
fprintf(']\n');
datasetBase = 1:length(usedSignals);
for k = 1:length(theComponents)
    theseDatasets = (usedSignals == theComponents(k)) & ~excludedMask;
    numberDatasets = sum(theseDatasets);
    datasetIndices = datasetBase(theseDatasets);
    fprintf('Component %g: has %g datasets \n  [ ', ...
            theComponents(k), numberDatasets);
    fprintf('%d ', datasetIndices);
    fprintf(']\n');
end

%% Now check to make sure that the desired one is there.
signalIndices = {blinks.signalIndices};
for k = 1:length(signalIndices)
    if excludedMask(k)
       continue;
    end
    theseIndices = signalIndices{k};
    totalThese = 0;
    for n = 1:length(VEOGChannels)
        totalThese = totalThese + sum(theseIndices == VEOGChannels(n));
    end
    if totalThese == 0
        fprintf('%g:%s does not contain VEOG\n', k, blinks(k).uniqueName);
    end
end

%% Now compute total number of blinks, number of good blinks and overall blink rate
totalBlinks = 0;
totalGood = 0;
totalSeconds = 0;
for k = 1:numDatasets
    if excludedMask(k)
        continue;
    end
    thisComponent = blinks(k).usedSignal;
    theseComponents = blinks(k).signalIndices;
    if isnan(blinks(k).usedSignal)
        continue;
    end
    thisIndex = find(theseComponents == thisComponent);
    numberBlinks = blinks(k).numberBlinks(thisIndex);
    goodBlinks = blinks(k).goodBlinks(thisIndex);
    totalBlinks = totalBlinks + numberBlinks;
    totalGood = totalGood + goodBlinks;
    totalSeconds = totalSeconds + ...
                length(blinks(k).candidateSignals(1, :))/blinks(k).srate;
end
fprintf('Total blinks: %d\n', totalBlinks);
fprintf('Total good blinks: %d\n', totalGood);
fprintf('Total seconds: %d\n', totalSeconds);
totalMinutes = totalSeconds/60;
fprintf('Minutes: %g\n', totalMinutes);
fprintf('Blinks/minute: %g\n', totalBlinks/totalMinutes);
%% Calculate the blink duration statistics from a property summary file
% Run a script like runCombinePropertyData first to get the combined
% property file

%% NCTU blinks
% propertiesDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% propertiesFile = 'NCTU_LKAllMastNewBothProperties.mat';

%% BCIT Examples
% propertiesDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
% propertiesFile = 'BCITLevel0AllUnrefNewBothBlinksProperties.mat';

%% BCI2000 counts
propertiesFile = 'BCI2000AllMastNewBothCombinedProperties.mat';
propertiesDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';

%% Shooter blinks
% propertiesDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% propertiesFile = 'ShooterAllMastNewBothCombinedProperties.mat';

%% Read in the blink data for this collection
load([propertiesDir filesep propertiesFile]);

%% Remove the bad files
bProperties(badFiles) = [];
bNames(badFiles) = [];
marginalMask(badFiles) = [];

%% Count the good data
goodDatasetBlinks = 0;
for k = 1:length(bProperties)
    if ~marginalMask(k)
        goodDatasetBlinks = goodDatasetBlinks + length(bProperties{k});
    end
end
fprintf('Total blinks: %d  good dataset blinks: %d\n', ...
    totalBlinks, goodDatasetBlinks);

%% 
theTypes = {'durationHalfBase', 'durationHalfZero', 'durationZero', ...
            'durationBase', 'durationTent'};
dataBlinks = cell(length(theTypes), 1);
goodDataBlinks = cell(length(theTypes), 1);
for k = 1:length(theTypes)
    allValues = nan(totalBlinks, 1);
    goodValues = nan(goodDatasetBlinks, 1);
    startInd = 1;
    goodStartInd = 1;
    for n = 1:length(bProperties) 
       theseProperties = bProperties{n};
       values = cellfun(@double, {theseProperties.(theTypes{k})});
       endInd = startInd + length(values) - 1;
       allValues(startInd:endInd) = values;
       startInd = endInd + 1;
       if marginalMask(n)
           continue;
       end
       goodEndInd = goodStartInd + length(values) - 1;
       goodValues(goodStartInd:goodEndInd) = values;
       goodStartInd = goodEndInd + 1;
    end
    dataBlinks{k} = allValues;
    goodDataBlinks{k} = goodValues;
end

%% Now print out the statistics for the blink durations
fprintf('All datasets\n');
for k = 1:length(theTypes)
    durations = dataBlinks{k};
    theMeans = nanmean(durations);
    theStds = nanstd(durations);
    fprintf('%s: mean %g std %g\n', theTypes{k}, theMeans, theStds);
end

fprintf('Good datasets\n');
for k = 1:length(theTypes)
    durations = goodDataBlinks{k};
    theMeans = nanmean(durations);
    theStds = nanstd(durations);
    fprintf('%s: mean %g std %g\n', theTypes{k}, theMeans, theStds);
end
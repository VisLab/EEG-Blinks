%% Calculate ocular index histograms for a data collection.
% The script assumes that a summary properties file has been computed
% for the data 
%% NCTU blinks
% propertiesDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% propertiesFile = 'NCTU_LKAllMastNewBothProperties.mat';
% histogramFile = 'NCTU_LKAllMastNewBothHistograms.mat';
%% BCIT Examples
propertiesDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
propertiesFile = 'BCITLevel0AllUnrefNewBothBlinksProperties.mat';
histogramFile = 'BCITLevel0AllUnrefNewBothBlinksHistograms.mat';
%% BCI2000 counts
% propertiesFile = 'BCI2000AllMastNewBothCombinedProperties.mat';
% propertiesDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% histogramFile = 'BCI2000AllMastNewBothCombinedHistograms.mat';
%% Shooter blinks
% propertiesDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% propertiesFile = 'ShooterAllMastNewBothCombinedProperties.mat';
% histogramFile = 'ShooterAllMastNewBothCombinedHistograms.mat';

%% Read in the blink data for this collection
load([propertiesDir filesep propertiesFile]);

%% Remove the bad files
bProperties(badFiles) = [];
bNames(badFiles) = [];
marginalMask(badFiles) = [];

%% 
theTypes = {'durationHalfBase', 'durationHalfZero', 'durationZero', ...
            'durationBase', 'durationTent', 'posAmpVelRatioZero', ...
            'negAmpVelRatioZero'};
limits = [0.05, 0.5, 20; ... % half base duration
          0.05, 0.35, 20; ... % half zero duration
          0.05, 0.5, 20; ... % duration zero
          0.05, 0.5, 20; ... % duration base
          0.05, 0.5, 20; ... % duration tent
          0, 10, 20; ...     % pAVR
          0, 15, 20];        % nAVR
%% Set up the structure
numberTypes = length(theTypes);
theHist(numberTypes) = struct('name', NaN, ...
                  'limits', NaN, 'binCounts', NaN, 'binCenters', NaN);
dataBlinks = cell(numberTypes, 1);
for k = 1:numberTypes
    theHist(k) = theHist(numberTypes);
    theHist(k).name = theTypes{k};
    theHist(k).limits = limits(k, :);
    allValues = nan(totalBlinks, 1);
    startInd = 1;
    for n = 1:length(bProperties) 
       theseProperties = bProperties{n};
       values = cellfun(@double, {theseProperties.(theTypes{k})});
       endInd = startInd + length(values) - 1;
       allValues(startInd:endInd) = values;
    end
    dataBlinks{k} = allValues;
    bins = linspace(limits(k, 1), limits(k, 2), limits(k, 3));
    [binCounts, binCenters] = hist(allValues(:), bins);
    theHist(k).binCounts = binCounts;
    theHist(k).binCenters = binCenters;
end
blinkHistograms = theHist;

%% Save the histogram file
save([propertiesDir filesep histogramFile], 'blinkHistograms',  '-v7.3');
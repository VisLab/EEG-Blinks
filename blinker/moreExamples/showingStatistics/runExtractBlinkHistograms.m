%% Calculate ocular index histograms for a data collection.
% The script assumes that a summary properties file has been computed
% for the data 

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

%% Setup the summary for the VEP data
% blinkDirInd = 'O:\ARL_Data\VEP\BlinkOutput\AllUnRef';
% blinkFileList = 'O:\ARL_Data\VEP\BlinkOutput\vep_blinkFileInfo';
% typeBlinks = 'AllUnRef';
% excludedTasks = {};
% summaryFile = 'O:\ARL_Data\VEP\BlinkOutput\vep_oddball_ALLUnRef_summary.mat';
% histogramFile = 'O:\ARL_Data\VEP\BlinkOutput\vep_oddball_ALLUnRef_histogram.mat';
% experimentName = 'vep';

%% Setup for the shooter data from combined distributions
blinkDirInd = 'O:\ARL_Data\Shooter\BlinkOutput\AllMastRefCombined';
blinkFileList = 'O:\ARL_Data\Shooter\BlinkOutput\shooter_blinkFileInfo';
typeBlinks = 'AllMastRefCombined';
excludedTasks = {'EC', 'EO'};
summaryFile = 'O:\ARL_Data\Shooter\BlinkOutput\shooter_AllMastRefCombined_summary.mat';
histogramFile = 'O:\ARL_Data\Shooter\BlinkOutput\shooter_AllMastRefCombined_histogram.mat';
experimentName = 'shooter';
   
%% Load the blink file information and find the information
load(blinkFileList);
numberFiles = length(blinkFiles);
[blinkFilePaths, fileMask] = getBlinkFilePaths(blinkDirInd, blinkFiles, ...
    typeBlinks, {});

%% Load the blink property files
bProperties = cell(numberFiles, 1);
totalBlinks = 0;
for k = 1:length(bProperties)
    clear blinks blinkFits blinkProperties blinkStatistics params;
    if ~fileMask(k)
        bProperties{k} = NaN;
        continue;
    end
    load(blinkFilePaths{k});
    if strcmpi(excludedTasks, blinks.task)
        continue;
    end
    bProperties{k} = blinkProperties;
    totalBlinks = totalBlinks + length(blinkProperties);
end
%% Remove the bad files
bProperties(~fileMask) = [];

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
       if isempty(theseProperties)
           continue;
       end
       values = cellfun(@double, {theseProperties.(theTypes{k})});
       endInd = startInd + length(values) - 1;
       allValues(startInd:endInd) = values;
       startInd = endInd + 1;
    end
    dataBlinks{k} = allValues;
    bins = linspace(limits(k, 1), limits(k, 2), limits(k, 3));
    [binCounts, binCenters] = hist(allValues(:), bins);
    theHist(k).binCounts = binCounts;
    theHist(k).binCenters = binCenters;
end
blinkHistograms = theHist;

%% Save the histogram file
save(histogramFile, 'blinkHistograms', 'experimentName', '-v7.3');
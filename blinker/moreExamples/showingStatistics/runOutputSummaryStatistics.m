%% Output the break down of selected signals and blink totals.
%
% This script assumes that you have created a summary file for datasets

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
%% VEP summary file
%summaryFile = 'O:\ARL_Data\VEP\BlinkOutput\vep_oddball_ALLUnRef_summary.mat';

%% Shooter summary file
summaryFile = 'O:\ARL_Data\Shooter\BlinkOutput\shooter_AllMastRefCombined_summary.mat';

%% Load the summary file
load(summaryFile);

%% Overall counts
fprintf('Total datasets: %d\n', length(fileMask));
fprintf('Excluded datasets: %d\n', sum(~fileMask));
fprintf('Nan datasets: %d\n', sum(fileMask & nanMask));

%% Output the channel counts
keysGood = keys(mapGood);
keysMarginal = keys(mapMarginal);
fprintf('Good datasets:\n')
totalGood = 0;
for k = 1:length(keysGood)
    fprintf('\tSignal %s: %d datasets\n', keysGood{k}, mapGood(keysGood{k}));
    totalGood = totalGood + mapGood(keysGood{k});
end
fprintf('Total good datasets = %d\n', totalGood);
totalMarginal = 0;
fprintf('Marginal datasets:\n')
for k = 1:length(keysMarginal)
    fprintf('\tSignal %s: %d datasets\n', keysMarginal{k}, mapMarginal(keysMarginal{k}));
    totalMarginal = totalMarginal + mapMarginal(keysMarginal{k});
end
fprintf('Total marginal datasets = %d\n', totalMarginal);

%% Output the total channel counts
fprintf('Total channel counts\n');
channelLabels = union(keysGood, keysMarginal);
channelCounts = zeros(size(channelLabels));
for k = 1:length(channelLabels)
    if isKey(mapGood, channelLabels{k})
        channelCounts(k) = channelCounts(k) + mapGood(channelLabels{k});
    end
    if isKey(mapMarginal, channelLabels{k})
        channelCounts(k) = channelCounts(k) + mapMarginal(channelLabels{k});
    end
end
[sortCounts, sortOrder] = sort(channelCounts);
channelLabels = channelLabels(sortOrder);
for k = 1:length(channelLabels)
   fprintf('\tSignal %s: %d datasets\n', channelLabels{k}, sortCounts(k));
end

%% Display the count of nan datasets
fprintf('Original number of datasets %d\n', length(blinkStatisticsSummary));
srates = cellfun(@double, {blinkStatisticsSummary.srate});
nanComponents = isnan(srates);
fprintf('Number of NaN datasets: %g [percentage %g]\n', ...
    sum(nanComponents),  100*sum(nanComponents)/length(blinkStatisticsSummary));
blinkStatisticsSummary(nanComponents) = [];
numDatasets = length(blinkStatisticsSummary);
fprintf('Total number of datasets %d\n', numDatasets);
signalNumbers = cellfun(@double, {blinkStatisticsSummary.usedNumber});
nanComponents = isnan(signalNumbers);

%% Display the count of marginal datasets
marginalComponents = strcmpi({blinkStatisticsSummary.status}, 'marginal');
fprintf('Number of marginal datasets: %g [Percentage %g]\n', ...
    sum(marginalComponents), 100*sum(marginalComponents)/numDatasets);

marginalIndices = find(marginalComponents);
for k = 1:sum(marginalComponents)
    pos = marginalIndices(k);
    fprintf('%d: %s (ratio %g) %s\n', pos, blinkStatisticsSummary(pos).usedLabel, ...
        blinkStatisticsSummary(pos).goodRatio, blinkStatisticsSummary(pos).uniqueName);
end

totalBlinksMarginal = 0;
totalBlinksGood = 0;
goodBlinksMarginal = 0;
goodBlinksGood = 0;
totalSecondsGood = 0;
totalSecondsMarginal = 0;
for k = 1:length(blinkStatisticsSummary)
    if isnan(blinkStatisticsSummary(k).usedNumber) 
        continue;
    end
    if marginalComponents(k)
        totalBlinksMarginal = totalBlinksMarginal + blinkStatisticsSummary(k).numberBlinks;
        goodBlinksMarginal = goodBlinksMarginal + blinkStatisticsSummary(k).numberGoodBlinks;
        totalSecondsMarginal = totalSecondsMarginal + blinkStatisticsSummary(k).seconds;
    else
        totalBlinksGood = totalBlinksGood + blinkStatisticsSummary(k).numberBlinks;
        goodBlinksGood = goodBlinksGood  + blinkStatisticsSummary(k).numberGoodBlinks;
        totalSecondsGood  = totalSecondsGood  + blinkStatisticsSummary(k).seconds;
    end
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

%% Print overall values
totalBlinks = totalBlinksGood + totalBlinksMarginal;
totalGoodBlinks = goodBlinksGood + goodBlinksMarginal;
totalSeconds = totalSecondsGood + totalSecondsMarginal;
fprintf('Total blinks: %d\n', totalBlinks);
fprintf('Total good blinks: %d\n', totalGoodBlinks);
fprintf('Total seconds: %d\n', totalSeconds);
totalMinutes = totalSeconds/60;
fprintf('Minutes datasets: %g\n', totalMinutes);
fprintf('Blinks/minute datasets: %g\n', totalBlinks/totalMinutes);

%% Display histograms of individual blink properties
%
% This script assumes that a histogram summary for the collection has been
% computed using runExtractBlinkHistograms. 
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

%% Set up the histogram information
histogramFiles = ...
    {'O:\ARL_Data\VEP\BlinkOutput\vep_oddball_ALLUnRef_histogram.mat';
     'O:\ARL_Data\Shooter\BlinkOutput\shooter_AllMastRefCombined_histogram.mat'};
experimentNames = {'vep'; 'shooter'};

%% Show blink histograms
numExp = length(histogramFiles);
theColors = [0.7, 0.7, 0.7; 0.5, 0.5, 0.5; 0, 1, 0; 0, 0, 1];
theShapes = {'o', 's', 'x', '^'};

%% Read in the occular indices for these collections
theHistograms = cell(numExp, 1);
for k = 1:numExp
    load(histogramFiles{k});
    theHistograms{k} = blinkHistograms;
end

%% Get the masks
theFields = {blinkHistograms.name};
numFields = length(theFields);
for k = 1:numFields
    theTitle = [theFields{k} ' all blinks'];
    figure('Name', theTitle, 'Color', [1, 1, 1])
    hold on
    legendStrings = cell(1, numExp);
    numLegends = 0;
    limits = [inf, -inf];
    for n = 1:numExp
        hists = theHistograms{n}(k);
        numLegends = numLegends + 1;
        legendStrings{numLegends} = experimentNames{n};
        centers = hists.binCenters;
        counts = hists.binCounts;
        plot(centers, counts/sum(counts), 'Color', theColors(n, :), ...
            'LineWidth', 2);
        limits(1) = min(limits(1), hists.limits(1));
        limits(2) = max(limits(2), hists.limits(2));
    end
    set(gca, 'XLim', limits);
    hold off
    xlabel(theFields{k});
    ylabel('Fraction');
    title(theTitle)
    legend(legendStrings(1:numLegends), 'Interpreter', 'None')
    box on
 
    hold off
    xlabel(theFields{k});
    ylabel('Fraction');
    title(theTitle)
    legend(legendStrings(1:numLegends), 'Interpreter', 'None')
    box on
end


%% Compute the totals
% counts = 0;
% for n = 1:numExp
%     x = sum(experiments(n).blinkHistograms.pAVRZ.binCounts);
%     fprintf('Experiment %s: %d blinks\n', experiments(n).experiment, x);
%     counts = counts + x;
% end
% fprintf('Total blinks: %d%d\n', counts);


%% Merge blinks from multiple sources in a signalData structure.
%  The first part of the setup reads in a list of blink structures. 
%  Blinks are then sorted by their maximum and merged into groups based
%  on whether they are within jitter of each other.
%  The final result allows comparison of different methods of getting
%  blinks.
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
%
%% 
% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% blinkFile = 'BCITLevel0_S2007_T2X2_R1_T2_M021_AllUnrefNewBothBlinks';
% just did 1-9

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2008_XB_R1_T2_M023_AllUnrefNewBothBlinks';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2018_XB_R1_T2_M053_AllUnrefNewBothBlinks';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2019_T2X2_R1_T2_M056_AllUnrefNewBothBlinks';
%% VEP example -- assumes a blink info file has been created
experiment = 'vep';
blinkDir = 'O:\ARL_Data\VEP\BlinkOutput\AllUnRefA';
blinkFile = 'vep_01_oddball_AllUnRefA';
groupDir = 'O:\ARL_Data\VEP\BlinkOutput\AllUnRefAGroups';

%% Set parameters
jitter = 0.1;  % Seconds of tolerance for matching blinks

%% Load the blinks file
load([blinkDir filesep blinkFile])

%% Merge the blinks
[blinkGroups, usedTypes, sortedBlinks, signalData, srate] = ...
     groupBlinks(blinks.signalData, jitter, blinks.srate);
fprintf('Dataset %s:\n\tsorted %d groups %d\n\tnan counts\n', blinkFile, ...
    length(sortedBlinks), length(blinkGroups));

%%
groupVotes = sum(isnan(blinkGroups), 2);
for k = 0:size(blinkGroups, 2) - 1
    fprintf(' %d:[%d]\n', k, sum(groupVotes == k));
end
fprintf('\n');

%% Save the files
if ~exist(groupDir, 'dir')
    mkdir(groupDir);
end
save([groupDir filesep blinkFile 'Grouped.mat'], ...
     'blinkGroups', 'sortedBlinks', 'usedTypes', ...
     'signalData', 'srate', 'jitter');
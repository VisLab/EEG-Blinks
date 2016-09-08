%% Merge blinks from multiple sources in a signalData structure.
%  The first part of the setup reads in a list of blink structures. 
%  Blinks are then sorted by their maximum and merged into groups based
%  on whether they are within jitter of each other.
%  The final result allows comparison of different methods of getting
%  blinks.
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

blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
blinkFile = 'BCITLevel0_S2019_T2X2_R1_T2_M056_AllUnrefNewBothBlinks';

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
save([groupDir filesep blinkFile 'Grouped.mat'], ...
     'blinkGroups', 'sortedBlinks', 'usedTypes', ...
     'signalData', 'srate', 'jitter');
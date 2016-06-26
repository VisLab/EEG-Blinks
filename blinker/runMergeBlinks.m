%% This script merges blink data for different blink versions
%blinkTypes = {'IC', 'Channel', 'EOG', 'ICUnref', 'ChannelUnref', 'EOGUnref'};
%blinkTypes = {'IC', 'Channel', 'EOG', 'ICUnref'};
%blinkTypes = {'IC', 'Channel', 'EOG'};
%blinkTypes = {'ChannelUnref', 'EOGUnref'};

suffix = 'BlinksNew';
jitter = 0.1;  % Seconds of tolerance for matching blinks

%% Shooter
% scriptDir = 'D:\Research\BlinkDetectionCurrentCopy2\EEG-Blinks\blinker\examples';
% scriptName = 'publishShooterBlinks.m';
% inputDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
% inputBlinkFile = 'shooterBlinks_With_PREPClean_ICA.mat';
% outputDir = 'O:\ARL_Data\Shooter\ShooterBlinkOutput\PREPClean_ICA_Linear';
% blinkStatsFiles = 'shooterBlinks_With_PREPClean_ICABlinkOut.mat';

%% BCIT
organizationType = 'BCIT';
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
% % %experiment = 'Experiment X6 Speed Control';
% % %experiment = 'X3 Baseline Guard Duty';
% % %experiment = 'X4 Advanced Guard Duty';
% % %experiment = 'X1 Baseline RSVP';
% experiment = 'Experiment XC Calibration Driving';
% % %experiment = 'Experiment XB Baseline Driving';
% % %experiment = 'X2 RSVP Expertise';

blinkTypes = {'IC', 'ICPrepClean'};

%% VEP setup
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% BCIT VIDEO GENERATION
% scriptDir = 'D:\Research\BlinkDetectionCurrentCopy2\EEG-Blinks\blinker\examples';
% dataDir = 'D:\Research\BlinkerLeftovers\VideoHTML';
% blinkDir = 'D:\Research\BlinkerLeftovers\VideoHTML';

% %% Shooter
% % type = 'ChannelUnref';
% % undoReference = false;
% collectionType = 'FILES2';
% experiment = 'Shooter';
% pathName = 'E:\CTA_DATA\Shooter\Level0';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';


%% LSIE tests
% scriptDir = 'D:\Research\BlinkDetectionCurrentCopy2\EEG-Blinks\blinker\examples';
% scriptName = 'publishLSIEPlotBlinks.m';
% dataDir = 'E:\CTAData\LSIE_UM_ICA';
% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
% blinkFile = 'LSIEBlinks.mat';
% blinkStatsFile = 'LSIEStatsOut.mat';
% outputDir = 'E:\CTAData\LSIE_UM_BlinkOutput';
% channelLabel = 'E12';
% EOGLabel = '';
% blinkBatchSize = 250;

%% Load the data blinks
blinkFiles = cell(length(blinkTypes), 1);
blinkFileNames = cell(length(blinkTypes), 1);
for t = 1:length(blinkTypes)
    blinkFileNames{t} = [blinkDir filesep experiment suffix blinkTypes{t} '.mat'];
    load(blinkFileNames{t});
    blinkFiles{t} = blinks;
end

%% Merge the blinks
numberDatasets = length(blinks);
blinkGroups = cell(numberDatasets, 1);
sortedBlinks = cell(numberDatasets, 1);
usedTypes = cell(numberDatasets, 1);
for n = 1:numberDatasets
    frameThreshold = round(jitter*blinkFiles{t}(n).srate);
    [sortedBlinks{n}, usedIndices] = getSortedBlinkMaxima(blinkFiles, n);
    [blinkGroups{n}, usedTypes{n}, sortedBlinks{n}] = groupBlinks(sortedBlinks{n}, frameThreshold);                
    fprintf('Dataset %d:\n\tsorted %d groups %d\n\tnan counts', n, ...
            length(sortedBlinks{n}), length(blinkGroups{n}));
    groupVotes = sum(isnan(blinkGroups{n}), 2);
    for k = 0:length(blinkTypes)
        fprintf(' %d:[%d]', k, sum(groupVotes == k));
    end
    fprintf('\n');
end

%% Save the files
save([blinkDir filesep experiment suffix 'matched.mat'], 'experiment', ...
     'blinkTypes', 'blinkGroups', 'sortedBlinks', 'usedTypes');
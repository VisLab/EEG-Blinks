%% This calculates overall occular Index summary

%% NCTU blinks
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
% experiment = 'NCTU_LK';
% typeBlinks = 'ChannelMastNewBoth';
% typeBlinkProperties = 'ChannelMastNewBoth';
% typeBlinkSummary = 'ChannelMastNewBoth';
% typeBlinkOccular = 'ChannelMastNewBoth';
% excludeTasks = {};

%% BCIT Examples
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinksNew';
typeBlinks = 'EOGUnrefNewBoth';
typeBlinkProperties = 'EOGUnrefNewBoth';
typeBlinkSummary = 'EOGUnrefNewBoth';
typeOccular =  'EOGUnrefNewBoth';
% typeBlinks = 'ChannelUnrefNewBoth';
% typeBlinkProperties = 'ChannelUnrefNewBoth';
% typeBlinkSummary = 'ChannelUnrefNewBoth';
% typeOccular = 'ChannelUnrefNewBoth';
excludeTasks = {};

%% BCI2000 blinks
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
% excludeTasks = {'EyesOpen', 'EyesClosed'};
% typeBlinks = 'ChannelMastNewBothCombined';
% typeBlinkProperties = 'ChannelMastNewBothCombined';
% typeBlinkSummary = 'ChannelMastNewBothCombined';
% typeBlinkOccular = 'ChannelMastNewBothCombined';
% % typeBlinks = 'ChannelMastNewBoth';
% % typeBlinkProperties = 'ChannelMastNewBoth';
% % typeBlinkSummary = 'ChannelMastNewBoth';
% % typeBlinkOccular = 'ChannelMastNewBoth';

%% Shooter blinks
% experiment = 'Shooter';
% %blinkDir = 'K:\CTAData\Shooter\ShooterBlinks';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
% typeBlinks = 'EOGUnrefNewBothCombined';
% typeBlinkProperties = 'EOGUnrefNewBothCombined';
% typeBlinkSummary = 'EOGUnrefNewBothCombined';
% typeBlinkOccular = 'EOGUnrefNewBothCombined';
% % typeBlinks = 'ChannelUnrefNewBothCombined';
% % typeBlinkProperties = 'ChannelUnrefNewBothCombined';
% % typeBlinkSummary = 'ChannelUnrefNewBothCombined';
% % typeBlinkOccular = 'ChannelUnrefNewBothCombined';
% excludeTasks = {'EO', 'EC'};

% %% VEP
% type = 'ChannelUnref';
% experiment = 'VEP';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% excludeTasks = {};

% %% Dreams
% organizationType = 'Dreams';
% type = 'EOGMast';
% experiment = 'Dreams';
% blinkDir = 'E:\CTADATA\WholeNightDreams\data\blinks';
% %byType = 'EEG';
% byType = 'EOG';
% excludeTasks = {};

%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];
blinkPropertiesFile = [experiment 'BlinksNew' typeBlinkProperties 'Properties.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);

%% 
used = cellfun(@double, {blinks.usedSignal});
isNanMask = isnan(used);
durations = [];
goodDurations = [];
for k = 1:length(blinks) 
    if isnan(used(k))
        continue;
    end
    theseDurations = zeros(length(blinkProperties{k}), 5);
    theseDurations(:, 1) = cellfun(@double, {blinkProperties{k}.durationBase});
    theseDurations(:, 2) = cellfun(@double, {blinkProperties{k}.durationZero});
    theseDurations(:, 3) = cellfun(@double, {blinkProperties{k}.durationTent});
    theseDurations(:, 4) = cellfun(@double, {blinkProperties{k}.durationHalfBase});
    theseDurations(:, 5) = cellfun(@double, {blinkProperties{k}.durationHalfZero});
    durations = [durations;theseDurations];                 %#ok<*AGROW>
    if used(k) < 0
        continue;
    end
    goodDurations = [goodDurations;theseDurations];
end 

%% Output the results
theMeans = nanmean(durations);
theStds = nanstd(durations);
fprintf('All datasets\n');
fprintf('Duration base: mean %g std %g\n', theMeans(1), theStds(1));
fprintf('Duration zero: mean %g std %g\n', theMeans(2), theStds(2));
fprintf('Duration tent: mean %g std %g\n', theMeans(3), theStds(3));
fprintf('Duration half base: mean %g std %g\n', theMeans(4), theStds(4));
fprintf('Duration half zero: mean %g std %g\n', theMeans(5), theStds(5));
fprintf('Total blinks datasets %d\n', size(durations, 1));

theMeans = nanmean(goodDurations);
theStds = nanstd(goodDurations);
fprintf('Good datasets\n');
fprintf('Duration base: mean %g std %g\n', theMeans(1), theStds(1));
fprintf('Duration zero: mean %g std %g\n', theMeans(2), theStds(2));
fprintf('Duration tent: mean %g std %g\n', theMeans(3), theStds(3));
fprintf('Duration half base: mean %g std %g\n', theMeans(4), theStds(4));
fprintf('Duration half zero: mean %g std %g\n', theMeans(5), theStds(5));
fprintf('Total blinks good datasets %d\n', size(goodDurations, 1));
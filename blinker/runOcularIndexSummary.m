%% This calculates overall ocular Index summary

%% NCTU blinks
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
% experiment = 'NCTU_LK';
% typeBlinks = 'ChannelMastNewBoth';
% typeBlinkProperties = 'ChannelMastNewBoth';
% typeBlinkSummary = 'ChannelMastNewBoth';
% typeBlinkOcular = 'ChannelMastNewBoth';
% excludeTasks = {};
%% BCIT Examples
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinksNew';
% % typeBlinks = 'EOGUnrefNewBoth';
% % typeBlinkProperties = 'EOGUnrefNewBoth';
% % typeBlinkSummary = 'EOGUnrefNewBoth';
% typeBlinks = 'ChannelUnrefNewBoth';
% typeBlinkProperties = 'ChannelUnrefNewBoth';
% typeBlinkSummary = 'ChannelUnrefNewBoth';
% typeOcular =  'EOGUnrefNewBoth';
% excludeTasks = {};
%% BCI2000 blinks
% typeBlinks = 'ChannelMastNewBothCombined';
% typeBlinkProperties = 'ChannelMastNewBothCombined';
% typeBlinkSummary = 'ChannelMastNewBothCombined';
% typeBlinkocular = 'ChannelMastNewBothCombined';
% typeBlinks = 'ChannelMastNewBoth';
% typeBlinkProperties = 'ChannelMastNewBoth';
% typeBlinkSummary = 'ChannelMastNewBoth';
% typeBlinkOcular = 'ChannelMastNewBoth';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
% excludeTasks = {'EyesOpen', 'EyesClosed'};

%% Shooter blinks
experiment = 'Shooter';
%blinkDir = 'K:\CTAData\Shooter\ShooterBlinks';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
% typeBlinks = 'EOGUnrefNewBothCombined';
% typeBlinkProperties = 'EOGUnrefNewBothCombined';
% typeBlinkSummary = 'EOGUnrefNewBothCombined';
% typeBlinkOcular = 'EOGUnrefNewBothCombined';
typeBlinks = 'ChannelUnrefNewBothCombined';
typeBlinkProperties = 'ChannelUnrefNewBothCombined';
typeBlinkSummary = 'ChannelUnrefNewBothCombined';
typeBlinkOcular = 'ChannelUnrefNewBothCombined';
excludeTasks = {'EO', 'EC'};

% %% VEP
% type = 'ChannelUnref';
% experiment = 'VEP';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% excludeTasks = {};

%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];
blinkPropertiesFile = [experiment 'BlinksNew' typeBlinkProperties 'Properties.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);

%% Run examples for all blinks
correlationThreshold = 0.98;
ocularIndices = struct('subjects', [], 'tasks', [], 'uniqueNames', [], ...
                 'headers', [], 'pAVRZ', [], 'nAVRZ', [], 'durationZ', [], ...
                 'durationB', [], 'durationT', [], ...
                 'durationHZ', [], 'durationHB', [], 'blinksPerMin', []);
ocularIndicesGoodOnly = ocularIndices;
used = {blinks.usedSignal};
used = cellfun(@double, used);
goodDatasetMask = ~isnan(used) & used > 0;
theTypes = fieldnames(ocularIndices);
taskList = {};
for t = 1:length(theTypes)
    if strcmpi(theTypes{t}, 'subjects')
        ocularIndices.subjects = {blinks.subjectID};
    elseif strcmpi(theTypes{t}, 'tasks')
        ocularIndices.tasks = {blinks.task};
        taskList = ocularIndices.tasks;
    elseif strcmpi(theTypes{t}, 'uniqueNames')
        ocularIndices.uniqueNames = {blinks.uniqueName};
    elseif strcmpi(theTypes{t}, 'headers')
        ocularIndices.headers = ...
                         {'All mean', 'All std', 'Good mean', 'Good std'};
    else
        ocular = nan(length(blinks), 4);
        ocularGoodOnly = nan(length(blinks), 4);
        for k = 1:length(blinks)
            ocular(k, :) = getocularIndexNew(blinks(k), blinkProperties{k}, ...
                 blinkFits{k}, theTypes{t}, correlationThreshold);
            if goodDatasetMask(k)
                ocularGoodOnly(k, :) = ocular(k, :);
            end
        end
        ocularIndices.(theTypes{t}) = ocular;
        ocularIndicesGoodOnly.(theTypes{t}) = ocularGoodOnly;
    end
end

%%
save([blinkDir filesep experiment 'BlinksNew' typeBlinkOcular 'Ocular.mat'], ...
    'ocularIndices', 'ocularIndicesGoodOnly', '-v7.3');


%% Calculate the correlations for the different types for all indices
fprintf('Correlations using all data\n');
taskMask = true(size(taskList));
for k = 1:length(excludeTasks);
    taskMask = taskMask & ~strcmpi(taskList, excludeTasks{k});
end
for t = 1:length(theTypes)
    thisType = theTypes{t};
    if strcmpi('subjects', thisType) || strcmpi('tasks', thisType) ...
            || strcmpi('uniqueNames', thisType) || strcmpi('headers', thisType)
        continue;
    end
    theseValues = ocularIndices.(thisType);
    allOcular = theseValues(:, 1);
    goodOcular = theseValues(:, 3);
    nanMask = isnan(goodOcular) | isnan(allOcular);
    allOcular = allOcular(~nanMask & taskMask(:));
    goodOcular = goodOcular(~nanMask & taskMask(:)); 
    fprintf('%s: good vs all corr = %g\n', ...
        theTypes{t}, corr(goodOcular(:, 1), allOcular(:, 1)));
end

%% Calculate the correlations for the different types for good indices
fprintf('Correlations using good data\n');
taskMask = true(size(taskList));
for k = 1:length(excludeTasks);
    taskMask = taskMask & ~strcmpi(taskList, excludeTasks{k});
end
for t = 1:length(theTypes)
    thisType = theTypes{t};
    if strcmpi('subjects', thisType) || strcmpi('tasks', thisType) ...
            || strcmpi('uniqueNames', thisType) || strcmpi('headers', thisType)
        continue;
    end
    theseValues = ocularIndicesGoodOnly.(thisType);
    allOcular = theseValues(:, 1);
    goodOcular = theseValues(:, 3);
    nanMask = isnan(goodOcular) | isnan(allOcular);
    allOcular = allOcular(~nanMask & taskMask(:));
    goodOcular = goodOcular(~nanMask & taskMask(:)); 
    fprintf('%s: good vs all corr = %g\n', ...
        theTypes{t}, corr(goodOcular(:, 1), allOcular(:, 1)));
end

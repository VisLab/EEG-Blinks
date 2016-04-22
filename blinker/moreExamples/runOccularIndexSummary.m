%% This calculates overall occular Index summary

%% NCTU blinks
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% %type = 'IC';
% type = 'Channel';

%% BCIT Examples
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinks';
% type = 'ChannelUnref';
%% BCI2000 blinks
% type = 'Channel';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
%% Shooter blinks
experiment = 'Shooter';
%blinkDir = 'K:\CTAData\Shooter\ShooterBlinks';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
%type = 'EOGUnref';
type = 'ChannelUnref';
%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);

%% Run examples for all blinks
occularIndices = struct('subjects', [], 'tasks', [], 'uniqueNames', [], ...
                 'headers', [], 'pAVRZ', [], 'nAVRZ', [], 'durationZ', [], ...
                 'durationB', [], 'durationT', [], ...
                 'durationHZ', [], 'durationHB', [], 'blinksPerMin', []);
theTypes = fieldnames(occularIndices);
for t = 1:length(theTypes)
    if strcmpi(theTypes{t}, 'subjects')
        occularIndices.subjects = {blinks.subjectID};
    elseif strcmpi(theTypes{t}, 'tasks')
        occularIndices.tasks = {blinks.task};
    elseif strcmpi(theTypes{t}, 'uniqueNames')
        occularIndices.uniqueNames = {blinks.uniqueName};
    elseif strcmpi(theTypes{t}, 'headers')
        occularIndices.headers = ...
                         {'All mean', 'All std', 'Good mean', 'Good std'};
    else
        occular = nan(length(blinks), 4);
        for k = 1:length(blinks)
            occular(k, :)  = getOccularIndex(blinks(k), ...
                blinkProperties{k}, blinkFits{k}, theTypes{t});
        end
        occularIndices.(theTypes{t}) = occular;
    end
end

%%
save([blinkDir filesep experiment 'BlinksNewOccular' type '.mat'], ...
    'occularIndices', '-v7.3');


%% Calculate the correlations for the different types
for t = 1:length(theTypes)
    thisType = theTypes{t};
    if strcmpi('subjects', thisType) || strcmpi('tasks', thisType) ...
            || strcmpi('uniqueNames', thisType) || strcmpi('headers', thisType)
        continue;
    end
    theseValues = occularIndices.(thisType);
    allOccular = theseValues(:, 1);
    goodOccular = theseValues(:, 3);
    nanMask = isnan(goodOccular) | isnan(allOccular);
    allOccular = allOccular(~nanMask);
    goodOccular = goodOccular(~nanMask); 
    fprintf('%s: good vs all corr = %g\n', ...
        theTypes{t}, corr(goodOccular(:, 1), allOccular(:, 1)));
end

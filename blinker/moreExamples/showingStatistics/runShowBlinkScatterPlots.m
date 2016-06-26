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
type = 'EOGUnref';
%type = 'ChannelUnref';
excludeTasks = {'EO', 'EC'};

%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);

%%
numFiles = length(blinks);
theCorrs = nan(numFiles, 6);
theMeans = nan(numFiles, 6);
figure
hold on
for k = 1:numFiles
    dBlinks = blinks(k);
    if isnan(dBlinks.usedComponent)
        continue;
    end
    durationHZ = cell2mat({blinkProperties{k}.durationHalfZero})';
    pAVRZ = cell2mat({blinkProperties{k}.posAmpVelRatioZero})';
    pAVRB = cell2mat({blinkProperties{k}.posAmpVelRatioBase})';
    nAVRZ = cell2mat({blinkProperties{k}.negAmpVelRatioZero})';
    nAVRB = cell2mat({blinkProperties{k}.negAmpVelRatioBase})';
    corrNaN = isnan(durationHZ) | isnan(pAVRZ) | ...
              isnan(pAVRB) | isnan(nAVRZ) | isnan(nAVRB);
    durationHZ = durationHZ(~corrNaN);
    pAVRZ = pAVRZ(~corrNaN);
    pAVRB = pAVRB(~corrNaN);
    nAVRZ = nAVRZ(~corrNaN);
    nAVRB = nAVRB(~corrNaN);
    theCorrs(k, 1) = corr(durationHZ, pAVRZ);
    theCorrs(k, 2) = corr(durationHZ, pAVRB);
    theCorrs(k, 3) = corr(durationHZ, nAVRZ);
    theCorrs(k, 4) = corr(durationHZ, nAVRB);
    theCorrs(k, 5) = corr(pAVRZ, nAVRZ);
    theCorrs(k, 6) = corr(pAVRB, nAVRB);
    theMeans(k, 1) = mean(durationHZ);
    theMeans(k, 2) = mean(pAVRZ);
    theMeans(k, 3) = mean(pAVRB);
    theMeans(k, 4) = mean(nAVRZ);
    theMeans(k, 5) = mean(nAVRB);
    plot(durationHZ, nAVRZ, 'ks')
end
hold off
%% 
figure
plot(theMeans(:, 2), theMeans(:, 4), 'ko')
%%

figure
plot(theCorrs(:, 3), theCorrs(:, 5), 'ks');
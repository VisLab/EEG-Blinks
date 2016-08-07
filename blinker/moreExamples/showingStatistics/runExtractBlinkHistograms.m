%% This calculates blink Histograms for the occular indicators
%          
%% NCTU blinks
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
% experiment = 'NCTU_LK';
% typeBlinks = 'ChannelMastNewBoth';
% typeBlinkProperties = 'ChannelMastNewBoth';
% typeBlinkHistograms = 'ChannelMastNewBoth';
% excludeTasks = {};
%% BCIT Examples
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinksNew';
% typeBlinks = 'ChannelUnrefNewBoth';
% typeBlinkProperties = 'ChannelUnrefNewBoth';
% typeBlinkHistograms = 'ChannelUnrefNewBoth';
% excludeTasks = {};

%% BCI2000 blinks
% typeBlinks = 'ChannelMastNewBothCombined';
% typeBlinkProperties = 'ChannelMastNewBothCombined';
% typeBlinkHistograms = 'ChannelMastNewBothCombined';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNew';
% excludeTasks = {'EyesOpen', 'EyesClosed'};

%% Shooter blinks
experiment = 'Shooter';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNew';
% typeBlinks = 'ChannelUnrefNewBothCombined';
% typeBlinkProperties = 'ChannelUnrefNewBothCombined';
% typeBlinkHistograms = 'ChannelUnrefNewBothCombined';
typeBlinks = 'EOGUnrefNewBothCombined';
typeBlinkProperties = 'EOGUnrefNewBothCombined';
typeBlinkHistograms = 'EOGUnrefNewBothCombined';
excludeTasks = {'EC', 'EO'};

%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];
blinkPropertiesFile = [experiment 'BlinksNew' typeBlinkProperties 'Properties.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkPropertiesFile]);

%% Histogram parameters
blinksRateInterval = 3;  % Number of minutes to average blink rate
items = {'blinksPerMin', [0, 30, 15]; ...
         'pAVRZ',  [0, 10, 20]; ...
         'nAVRZ',  [0, 15, 20]; ...
         'durationZ', [0.05, 0.5, 30]; ...
         'durationB',  [0.05, 0.5, 30]; ...
         'durationT', [0.05, 0.5, 30]; ...
         'durationHZ', [0.05, 0.35, 30]; ...
         'durationHB', [0.05, 0.5, 30]};
numItems = size(items, 1);     
theStruct = struct('name', NaN, 'excludeTasks', [], 'numberDatasets', [], ...
                  'limits', NaN, 'binCounts', NaN, 'binCenters', NaN);
for k = 1:numItems
    thisStruct = theStruct();
    thisStruct.name = items{k, 1};
    thisStruct.limits = items{k, 2};
    blinkHistograms.(items{k, 1}) = thisStruct;
end
%goodBlinkHistograms = blinkHistograms;


%% Calculate the histograms across all of the tasks
numberDatasets = 0;
for n = 1:length(blinks)
   if isempty(blinks(n).usedSignal) || isnan(blinks(n).usedSignal)
       continue;
   elseif strcmpi(excludeTasks, blinks(n).task)
       continue;
   end
   numberDatasets = numberDatasets + 1;
   maxTime = size(blinks(n).candidateSignals, 2)./blinks(n).srate;
   for k = 1:numItems   
      [binCounts, binCenters] = getOccularHistogram(blinkProperties{n}, ...
                                 items{k, 1}, items{k, 2}, [], maxTime);
      if isnan(blinkHistograms.(items{k}).binCounts)
          blinkHistograms.(items{k}).binCounts = binCounts(:); %#ok<*SAGROW>
          blinkHistograms.(items{k}).binCenters = binCenters(:);
      else
          blinkHistograms.(items{k}).binCounts = ...
              blinkHistograms.(items{k}).binCounts + binCounts(:);
      end
   end
end

%% Add individual items
for k = 1:numItems
    blinkHistograms.(items{k, 1}).numberDatasets = numberDatasets;
    blinkHistograms.(items{k, 1}).excludeTasks = excludeTasks;
end

%% Save the histogram file
blinkHistFile = [experiment 'BlinksNew' typeBlinkHistograms 'Histograms.mat'];
save([blinkDir filesep blinkHistFile], 'blinkHistograms',  '-v7.3');
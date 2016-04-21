%% This plots individual blinks for a dataset from EEG, a channel, and EOG
%  The script assumes that the following variables have been set:
%  dBlinks has been set to the dataset's blinks 
%  blinkFits
%  blinkProps
%  bestEEGChannel
%  bestEEGChannelLabel
%  bestEOGChannel
%  bestEEGChannelLabel
%  
%% Set up the counts for plotting
baseLevel = 0;
usedComponent = dBlinks.usedComponent;
used = find(dBlinks.componentIndices == usedComponent, 1, 'first');
blinkPositions = dBlinks.blinkPositions{used};
startBlinks = blinkPositions(1, :);
endBlinks = blinkPositions(2, :);

extendSeconds = 0.5;   % Maximum seconds to extend on either side of blink
extendFrames = round(extendSeconds*dBlinks.srate);
preLimits = max(startBlinks - extendFrames, 1);
postLimits = min(endBlinks + extendFrames, size(blinkTraces, 2));


%% Output the correlation of the different blink traces
if length(blinkTypes) > 1
    fprintf('Trace correlations\n');
    for k = 1:length(blinkTypes) - 1
        for j = k + 1:length(blinkTypes)
            fprintf('%s vs %s: %g\n', blinkTypes{k}, blinkTypes{j}, ...
                corr(blinkTraces(k, :)', blinkTraces(j, :)'));
        end
    end
end

%% Publish the plots

for k = startBatch:endBatch
    plotBlinkFit(dataName, dBlinks.srate, blinkTraces, blinkTypes, ...
             bFits(k), bProperties(k), preLimits(k), postLimits(k));
end
   
  

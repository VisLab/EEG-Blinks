function [combinedMean, combinedStd] = weightedAverages(counts, theMeans, the Stds)

if length(counts)~= length(theMeans) || length(counts) ~= length(Stds)
    error('Inputs must be the same length');
end


   
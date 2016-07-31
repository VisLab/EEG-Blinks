minGoodBlinks = 10;
cutoffRatioThreshold = 0.70;  % Test this
for k = 1:length(blinks)
    usedSign = 1;
    if isnan(blinks(k).cutoff)
        continue;
    end
    candidateIndices = blinks(k).signalIndices;
    candidates = blinks(k).goodBlinks;
    goodCandidates = candidates > minGoodBlinks;
    if sum(goodCandidates) == 0
        blinks(k).status = ['failure: ' ...
            '[fewer than ' num2str(minGoodBlinks) ' were found]'];
        blinks(k).usedSignal = NaN;
        continue;
    end
    candidateIndices = candidateIndices(goodCandidates);
    candidates = candidates(goodCandidates);
    cutoffRatios = blinks(k).goodRatios;
    cutoffRatios = cutoffRatios(goodCandidates);
    ratioIndices = cutoffRatios >= cutoffRatioThreshold;
    if sum(ratioIndices) == 0
        usedSign = -1;
        blinks(k).status = ['failure: [Good ratio too low]'];
    else
        candidates = candidates(ratioIndices);
        candidateIndices = candidateIndices(ratioIndices);
    end
    
    [~, maxIndex ] = max(candidates);
    if usedSign == 1
        blinks(k).status = ['success: '];
    end
    blinks(k).usedSignal = usedSign*candidateIndices(maxIndex);
end
function values = getSummaryValues(blinkSummary, type, position)
% Extracts a vector of values from the ocular blink summary
    theVector = {blinkSummary.(type)};
    values = nan(size(theVector));
    for k = 1:length(theVector)
        values(k) = theVector{k}(position);
    end
end
    
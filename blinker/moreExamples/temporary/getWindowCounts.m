function counts = getWindowCounts(theTimes, windowSize, ...
                                  windowOffset, timeRange)
% Return counts of number of times the items occurred each window
%
% Parameters:
%    theTimes = vector of times at which item occurred
%    windowSize = time of a window 
%    windowOffset = time each window offset from others
%    timeRange = two-element vector containing the start and end range
%
% Assumptions: All of the times are in the same units

totalTime = timeRange(2) - timeRange(1);
numberWindows = floor((totalTime - windowSize)/windowOffset) + 1;
counts = zeros(numberWindows, 1);
itemNumbers = floor((theTimes - timeRange(1))/windowOffset) + 1;
for k = 1:numberWindows
    counts(k) = sum(itemNumbers == k);
end

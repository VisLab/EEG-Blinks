function badBlinkMask = getBadBlinks(blinkFits, blinkProperties) 
% Extract mask indicating suspect blinks
corrThreshhold = 0.95;

%% Test for negative durations
durationTent = cellfun(@double, {blinkProperties.durationTent}) < 0.05;
closingTime = cellfun(@double,{blinkProperties.closingTimeTent}) < 0;
reopeningTime = cellfun(@double,{blinkProperties.reopeningTimeTent}) < 0;

%% Test for bad correlations
leftR2 = cellfun(@double,{blinkFits.leftR2}) < corrThreshhold;
rightR2 = cellfun(@double,{blinkFits.rightR2}) < corrThreshhold;

badBlinkMask = durationTent | closingTime | reopeningTime | leftR2 | rightR2;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%       blink_comp:  The independent component (IC) of eye-related
%                    activations derived from EEG.  This component should
%                    be "upright" 
%
%       srate:       the sample rate at which the EEG data was taken
%
% Output:
%       blinks:      a structure containing, for each blink:
%         t_up:      time tick for event threshold crossing going up
%         t_dn:      time tick for event threshold crossing going down
%
% Notes:
%   This function uses EEGLAB functions, so EEGLAB must be running
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function blinkPosition = getBlinkPositions(blinkComp, srate)
%% Constants:
minEventLen = 0.05; % events less than 50 ms are discarded
stdThreshold = 1.5; % factor (# of std devs) for blink detection

mu = mean(blinkComp); 
stdDev = std(blinkComp);
minBlink = minEventLen * srate;              % minimum blink frames
threshold = mu + stdThreshold * stdDev;      % actual threshold

% The return structure.  Initially there is room for an event at every time
% tick, to be trimmed later
blinkPosition = zeros(2, length(blinkComp));  % t_up, t_dn, max, start, end

% Find Events
numBlinks = 0;
inBlink = false;                  % flag indicating during blink
for index = 1:length(blinkComp);   
    % If amplitude exceeds threshold and not currently detecting a blink
    if (~inBlink && blinkComp(index) > threshold)
        % record index as a possible start
        start = index;
        inBlink = true;
    end
    
    % if previous point was in a blink and signal retreats below threshold
    % and duration greater than discard threshold
    if (inBlink && blinkComp(index) < threshold)
        % check to make sure this is not caused by noise
       if (index - start > minBlink)
           numBlinks = numBlinks + 1;
           blinkPosition(1, numBlinks) = start;  % t_up
           blinkPosition(2, numBlinks) = index;  % t_dn
       end
       inBlink = false;
    end   
end

%% trim blink events to remove zeros
blinkPosition = blinkPosition(:,1:numBlinks);

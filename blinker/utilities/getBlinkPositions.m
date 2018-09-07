function blinkPositions = getBlinkPositions(blinkComp, srate, stdThreshold)

% Parameters:
%    blinkComp       independent component (IC) of eye-related
%                    activations derived from EEG.  This component should
%                    be "upright" 
%    srate:         sample rate at which the EEG data was taken
%    stdTreshold    number of standard deviations above threshold for blink
%    blinkPositions (output) 2 x n array with start and end frames of blinks
%
% Notes:
%   This function uses EEGLAB functions, so EEGLAB must be running
%
%
% BLINKER extracts blinks and ocular indices from time series. 
% Copyright (C) 2016  Kay A. Robbins, Kelly Kleifgas, UTSA
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.


%% Constants:
minEventLen = 0.05; % events less than 50 ms are discarded
minEventSep = 0.05; % events less than 50 ms apart are discarded

mu = mean(blinkComp); 
%robustStdDev = 1.4826*mad(blinkComp);
robustStdDev = 1.4826*mad(blinkComp, 1);
minBlink = minEventLen * srate;              % minimum blink frames
threshold = mu + stdThreshold * robustStdDev;      % actual threshold

% The return structure.  Initially there is room for an event at every time
% tick, to be trimmed later
blinkPositions = zeros(2, length(blinkComp));  % t_up, t_dn, max, start, end

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
           blinkPositions(1, numBlinks) = start;  % t_up
           blinkPositions(2, numBlinks) = index;  % t_dn
       end
       inBlink = false;
    end   
end

%% Trim blink events to remove zeros
blinkPositions = blinkPositions(:,1:numBlinks);

%% Now remove blinks that aren't separated 
positionMask = true(numBlinks, 1);
startBlinks = blinkPositions(1, :);
endBlinks = blinkPositions(2, :);
x = (startBlinks(2:end) - endBlinks(1:end-1))/srate;
y = find(x <= 0.05);
positionMask(y) = false;
positionMask(y+1) = false;
blinkPositions = blinkPositions(:, positionMask);

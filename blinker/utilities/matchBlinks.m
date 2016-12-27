function matches = matchBlinks(times1, times2, distances)
% Matches blinks between two pairs of 
%
% Parameters:
%    times1 = vector of times for blinks in version 1 (length n)
%    times2 = vector of times for blinks in version 2 (length m)
%    distances = n x m matrices of match distances (0 or inf)
%
% Output:
%    matches = a two column vector with blink numbers of matches
%             entries of -1 if they don't match anything.  The vector
%             will be of length n + m - number of zeros in distances
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

%% Set up for the blink detection
numberMatches = sum(distances(:) == 0);
matches = -1*ones(length(times1) + length(times2) - numberMatches, 2);
pos1 = 1;
pos2 = 1;
matchSize = size(matches, 1);
for k = 1:matchSize
    if pos1 == -1
        matches(k, 2) = pos2;
        pos2 = pos2 + 1;
    elseif pos2 == -1
        matches(k, 1) = pos1;
        pos1 = pos1 + 1;
    elseif distances(pos1, pos2) == 0
        matches(k, 1) = pos1;
        matches(k, 2) = pos2;
        pos1 = pos1 + 1;
        pos2 = pos2 + 1;
    elseif times1(pos1) <= times2(pos2)
        matches(k, 1) = pos1;
        pos1 = pos1 + 1;
    else
        matches(k, 2) = pos2;
        pos2 = pos2 + 1;
    end
    if pos1 > length(times1)
        pos1 = -1;
    end
    if pos2 > length(times2)
        pos2 = -1;
    end
end

function values = getSummaryValues(blinkSummary, type, position)
% Extracts a vector of values from the ocular blink summary
%
% Parameters:
%    blinkSummary    structure containing summary information
%    type            string specifying the field in blink summary
%    position        position in the array of statistics in specified field
%    values          (output) values of the sti
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
%
    theVector = {blinkSummary.(type)};
    values = nan(size(theVector));
    for k = 1:length(theVector)
        if isnan(theVector{k})
            continue;
        end
        values(k) = theVector{k}(position);
    end
    values(isnan(values)) = [];
end    
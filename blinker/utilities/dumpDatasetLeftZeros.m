function [] = dumpDatasetLeftZeros(fileOut, blinkFits, srate)
%% Save the extracted blinks in a text file for comparison with video
%
% Parameters:
%   fileOut    path name of the file to save the blinks in
%   blinkFits  structure with the landmarks of individual blinks
%   srate      sampling rate of the dataset
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
leftZeros = cellfun(@double, {blinkFits.leftZero});
maxValues = cellfun(@double, {blinkFits.maxValue});
isnanMask = isnan(leftZeros) | isnan(maxValues);
leftZeros(isnanMask) = [];
maxValues(isnanMask) = [];
leftZeroSeconds = (leftZeros - 1)./srate;
fprintf('Help dump\n');
fid = fopen(fileOut, 'w');
fprintf(fid,'Blink   Frame     Seconds  Value\n');
for n = 1:length(leftZeros)
    fprintf(fid, '%d\t\t%d\t%10.3f\t%10.3f\n', n, ...
        leftZeros(n), leftZeroSeconds(n), maxValues(n));
end
fclose(fid);

    
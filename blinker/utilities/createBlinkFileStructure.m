function s = createBlinkFileStructure()
% Return an empty structure describing metadata for blink files
%
% If you generate a structure array containing this structure
% for the data files in your collection, you can run the blinker pipeline
% using this structure array as the file list input
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

s  = struct('pathName', NaN, ...      % Full pathname of data file
            'blinkFileName', NaN, ... % Leading name of blink output file
            'subjectID', NaN, ...     % Unique subject ID within experiment
            'experiment', NaN, ...    % Experiment name
            'task', NaN, ...          % Task name within the experiment
            'uniqueName', NaN, ...    % Unique dataset name within experiment
            'startDate', NaN', ...    % Start date dd-mm-yyyy
            'startTime', NaN);        % Start time hh:mm:ss
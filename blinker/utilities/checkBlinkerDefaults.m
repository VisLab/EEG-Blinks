function [structOut, errors] = checkBlinkerDefaults(structIn, defaults)
% Check structIn input parameters against defaults put in structOut
%
% Parameters:
%    structIn   structure with current values of parameters
%    defaults   structure with default values of parameters
%    structOut  (output) structure with all parameters set
%    errors     (output) cell array of error messages
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

errors = cell(0);
fNames = fieldnames(defaults);
structOut = struct();
for k = 1:length(fNames)
    try
       nextValue = getStructureParameters(structIn, fNames{k}, ...
                                          defaults.(fNames{k}).value);
       validateattributes(nextValue, defaults.(fNames{k}).classes, ...
                         defaults.(fNames{k}).attributes);
       structOut.(fNames{k}) = nextValue;
    catch mex
        errors{end+1} = [fNames{k} ' invalid: ' mex.message]; %#ok<AGROW>
    end
end

function p = getStructureParameters(mystruct, myfield, value)
% Sets p to mystruct.myfield if it exists, other assigns it to value
if  ~exist('value', 'var') && ~isfield(mystruct, myfield)
    error('Either value of mystruct.myfield must exist');
elseif exist('value', 'var') && ~isfield(mystruct, myfield) 
    p = value;
else
    p = mystruct.(myfield);
end
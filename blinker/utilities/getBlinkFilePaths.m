function [blinkFilePaths, fileMask] =  getBlinkFilePaths(inDir, ...
    dataInfo, typeBlinks, excludedTasks)
% Get the blink files in inDir of typeBlinks that exist among blinkFiles
%
% Parameters:
%    inDir       directory where blink files are stored
%    dataInfo    structure containing the data collection information
%    typeBlinks  string containing type of blinks
%    excludedTasks cell array with excluded task names
%
%    blinkFilePaths   cell array with full pathnames of the blink files
%    fileMask    logical array indicating whether this file present in directory
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

%% Get the blinks files from the base directory
inList = dir(inDir);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
fileNames = dirNames(~dirTypes);
numberActualFiles = length(fileNames);

%% Set up the mapping since not all expected blinks files may be there
numberFiles = length(dataInfo);
blinkFilePaths = cell(numberFiles, 1);
fileMask = true(numberFiles, 1);
fileMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
for k = 1:numberActualFiles
    fileMap(fileNames{k}) = k;
end

for k = 1:numberFiles
    thisFile = [dataInfo(k).blinkFileName '_' typeBlinks '.mat'];
    if ~isKey(fileMap, thisFile)
        fileMask(k) = false;
        warning('---%s does not have a blink file\n', thisFile); 
        continue;
    elseif sum(strcmpi(excludedTasks, dataInfo(k).task)) > 0
        fileMask(k) = false;
        warning('---%s has excluded task %s\n', blinkFilePaths{k}, dataInfo(k).task);
        continue;
    end
    blinkFilePaths{k} = [inDir filesep thisFile];
end

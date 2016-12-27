%% Create a file list structure for the shooter data. This script
% relies on having a file called sFilesEstimated.mat with metatadata.

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
%% Set up directories
infoFile = 'E:\CTADATA\Shooter\AdditionalDocumentation\sFilesEstimated.mat';
blinkDir = 'O:\ARL_Data\Shooter\BlinkOutput';
experiment = 'Shooter';
collectionType = 'FILES2';
pathName = 'E:\CTADATA\Shooter\Level0';

%% Create the list of files to be processed
fileList  = getFileList(collectionType, pathName);
numFiles = length(fileList);
blinkFiles(numFiles) = createBlinkFileStructure();

%% Create the file name of the output
blinkFileListName = [blinkDir filesep experiment '_blinkFileInfo.mat'];

%% Load the subject and experiment information
load(infoFile);

%% Create a map for the times
timeMap = containers.Map('KeyType', 'char', 'ValueType', 'double');
for s = 1:length(sFilesEstimated)
    sFile = sFilesEstimated{s};
    for k = 1:length(sFile)
        key = [sFile(k).subject '_' sFile(k).task];
        timeMap(key) = sFile(k).startTime;
    end
end

%% Remap the files
numberFiles = length(fileList);
for k = 1:numberFiles
    blinkFiles(k).pathName = fileList{k};
    [thePath, theName, theExt] = fileparts(fileList{k});
    pieces = strsplit(theName, '_');
    blinkFiles(k).subjectID = pieces{2};  %#ok<*SAGROW>
    blinkFiles(k).uniqueName = [pieces{2} '_' pieces{3}];
    blinkFiles(k).task = pieces{3};
    blinkFiles(k).experiment = experiment;
    if isKey(timeMap, blinkFiles(k).uniqueName)
        thisTime = datestr(timeMap(blinkFiles(k).uniqueName));
        pieces = strsplit(thisTime, ' ');
        blinkFiles(k).startDate = pieces{1};
        if length(pieces) > 1
            blinkFiles(k).startTime = pieces{2};
        end
    end
    blinkFiles(k).blinkFileName = ...
        [blinkFiles(k).experiment '_' blinkFiles(k).uniqueName];
end

%% Save the blinks and blink map
save (blinkFileListName, 'blinkFiles', '-v7.3');
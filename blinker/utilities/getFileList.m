function fileList = getFileList(type, pathName)
%% Returns a list of EEG set file names for different file organizations
%
% Parameters:
%    type       String specifying directory structure (ESSDERIVED,
%               ESSLEVEL2, ESSLEVEL1, FILES, FILES2
%    pathName   Base directory path
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


if strcmpi(type, 'ESSDERIVED')  
    obj = levelDerivedStudy('levelDerivedXmlFilePath', pathName);
    [filesUnsorted, ~, ~, sessionNumbers] =  getFilename(obj);
    %% Make sure that these are in sorted order
    sessions = zeros(length(sessionNumbers), 1);
    for k = 1:length(sessions)
        sessions(k) = str2double(sessionNumbers{k});
    end
    [~, sortedIndices] = sort(sessions);
    
    fileList = filesUnsorted(sortedIndices);
elseif strcmpi(type, 'ESSLEVEL2')
    obj = level2Study('level2XmlFilePath', pathName);
    [filesUnsorted, ~, ~, sessionNumbers] =  getFilename(obj);
    %% Make sure that these are in sorted order
    sessions = zeros(length(sessionNumbers), 1);
    for k = 1:length(sessions)
        sessions(k) = str2double(sessionNumbers{k});
    end
    [~, sortedIndices] = sort(sessions);
    
    fileList = filesUnsorted(sortedIndices);  
elseif strcmpi(type, 'ESSLEVEL1')
    obj = level1Study(pathName);
    [filesUnsorted, ~, ~, sessionNumbers] =  getFilename(obj);
    %% Make sure that these are in sorted order
    sessions = zeros(length(sessionNumbers), 1);
    for k = 1:length(sessions)
        sessions(k) = str2double(sessionNumbers{k});
    end
    [~, sortedIndices] = sort(sessions);
    
    fileList = filesUnsorted(sortedIndices);    
elseif strcmpi(type, 'FILES')    
    thisList = dir(pathName);
    fileList= {thisList(:).name};
    fileTypes = [thisList(:).isdir];
    fileList = fileList(~fileTypes);
    goodFiles = true(length(fileList), 1);
    for k = 1:length(goodFiles)
        [~, ~, myExt ] = fileparts(fileList{k});
        if ~strcmpi(myExt, '.set')
            goodFiles(k) = false;
        end
        fileList{k} = [pathName filesep fileList{k}];
    end
    fileList = fileList(goodFiles);
elseif strcmpi(type, 'FILES2')
    inList = dir(pathName);
    dirNames = {inList(:).name};
    dirTypes = [inList(:).isdir];
    dirNames = dirNames(dirTypes);
    dirNames(strcmpi(dirNames, '.')| strcmpi(dirNames, '..')) = [];
    
    %% Step through the individual subdirectories
    totalFiles = 0;
    tempFiles = cell(length(dirNames), 1);
    for k = 1:length(dirNames)
        thisDir = [pathName filesep dirNames{k}];
        thisList = dir(thisDir);
        fileList = {thisList(:).name};
        theseTypes = [thisList(:).isdir];
        fileList = fileList(~theseTypes);
        goodFiles = true(length(fileList), 1);
        for j = 1:length(fileList)
            [~, ~, myExt ] = fileparts(fileList{j});
            if ~strcmpi(myExt, '.set')
                goodFiles(j) = false;
            end
            fileList{j} = [thisDir filesep fileList{j}];
        end
        fileList = fileList(goodFiles);
        totalFiles = totalFiles + length(fileList);
        tempFiles{k} = fileList;
    end
    fileListFinal = cell(totalFiles, 1);
    thisStart = 1;
    for k = 1:length(dirNames)
        thisEnd = thisStart + length(tempFiles{k}) - 1;
        fileListFinal(thisStart:thisEnd) = tempFiles{k};
        thisStart = thisEnd + 1;
    end
    fileList = fileListFinal;
end
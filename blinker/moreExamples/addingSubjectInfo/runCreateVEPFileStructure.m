%% Create a file list structure for the VEP data. 
% This file creates an information file that allows BLINKER to run in batch
% mode for the specified data collection. See createBlinkFileStructure for
% the format of the information structure. This script is specific to the
% data collection and must be written individually for each collection.

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

%% Set the input directory and experiment information
baseDir = 'E:\CTADATA\VEP\BIOSIMIOriginal';
blinkFileDir = 'O:\ARL_Data\VEP\BlinkOutput';
numFiles = 18;
experiment = 'vep';
task = 'oddball';
blinkFiles(numFiles) = createBlinkFileStructure();
for k = 1:numFiles
    fileNum = sprintf('%02d', k);
    theDir = [baseDir filesep fileNum filesep 'Biosemi'];
    theFiles = dir(theDir);
    fileMask = strcmpi({theFiles.name}, '.') | strcmpi({theFiles.name}, '..');
    theFiles = theFiles(~fileMask);
    if length(theFiles) > 1
        warning('%d: too many files', k);
    end
    thisFile = [theDir filesep theFiles(1).name];
    blinkFiles(k) = blinkFiles(end);
    blinkFiles(k).pathName = thisFile;
    [thePath, theName, theExt] = fileparts(thisFile);

    blinkFiles(k).subjectID = fileNum;
    blinkFiles(k).experiment = experiment;
    blinkFiles(k).task = task;
    blinkFiles(k).uniqueName = ...
        [blinkFiles(k).subjectID '_' blinkFiles(k).task];
    blinkFiles(k).blinkFileName = ...
        [blinkFiles(k).experiment '_' blinkFiles(k).uniqueName] ;
    blinkFiles(k).startDate = datestr(theFiles(1).datenum, 'dd-mmm-yyyy');   
    blinkFiles(k).startTime = datestr(theFiles(1).datenum, 'HH:MM:SS');    
end  

%% VEP had two versions of the files .set format and .bdf format. We needed
% the .bdf format for the date but will use .set files for blinks. This
% code replaces the .bdf paths with the .set paths for computing blinks.
setDir = 'E:\CTADATA\VEP\BIOSIMIOriginalSet';
for k = 1:numFiles
   [thePath, theName, theExt] = fileparts(blinkFiles(k).pathName);
  blinkFiles(k).pathName = [setDir filesep theName '.set'];
end

%% Save the blinks and blink map
save([blinkFileDir filesep experiment '_blinkFileInfo.mat'], 'blinkFiles', '-v7.3');
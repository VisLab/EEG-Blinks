%% Extract the blinks structure based on channel or EOG time series
% This script assumes that EEGLAB is in the path, that the datasets are
% in EEGLAB EEG structures. 
%
% To run for your own data you must have first generated a 
% blink file list which contains a list of files with the appropriate 
% subject and other metadata.  See examples in
% ./moreExamples/addingSubjectInfo.
% 
% The BLINKER pipeline produces a directory of blink files (one file per data
% file). Each file contains a blinks structure with the eligible signals
% and metadata information, a blinkFits structure with the fits for the
% used signal, a blinkProperties structure for the blinks of the used
% signal, a blinkStatistics structure with the statistics of the basic
% ocular indices, and the params structure used to run the program.
%
% See also pop_blinker 
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
%% Setup
pop_editoptions('option_single', false, 'option_savetwofiles', false);
params = struct();

%% VEP example -- assumes a blink info file has been created
experiment = 'vep';
blinkDir = 'O:\ARL_Data\VEP\BlinkOutput';
typeBlinks = 'AllUnRefA';
blinkFileList = [blinkDir filesep experiment '_blinkFileInfo.mat'];
blinkIndDir = [blinkDir filesep typeBlinks];

%% Shooter example -- assumes a blink info file has been created
% Shows example of two phases with combining
% experiment = 'shooter';
% blinkDir = 'O:\ARL_Data\Shooter\BlinkOutput';
% typeBlinks = 'AllMastRef';
% blinkFileList = [blinkDir filesep experiment '_blinkFileInfo.mat'];
% blinkIndDir = [blinkDir filesep typeBlinks];

%% NCTU_RWN_VDE
%% Make the directory for the blink extraction
if ~exist(blinkIndDir, 'dir')
    mkdir(blinkIndDir);
end

%% Load the file list
load(blinkFileList);

%% Run the blinker blink extraction to create a file.
skipIfPresent = true;
numberFiles = length(blinkFiles);
for k = 1:numberFiles
    fprintf('%d: %s\n', k, blinkFiles(k).pathName);
    blinkerSaveFile = [blinkIndDir filesep ...
                      blinkFiles(k).blinkFileName '_' typeBlinks '.mat'];
    if skipIfPresent && exist(blinkerSaveFile, 'file')
       fprintf('.....already computed....skipping\n');
       continue;
    end
    try
        EEG = pop_loadset(blinkFiles(k).pathName);
        params = checkBlinkerDefaults(struct(), getBlinkerDefaults(EEG));
        params.subjectID = blinkFiles(k).subjectID;
        params.experiment = blinkFiles(k).experiment;
        params.uniqueName = blinkFiles(k).uniqueName;
        params.task = blinkFiles(k).task;
        params.fileName = blinkFiles(k).pathName;
        params.startDate = blinkFiles(k).startDate;
        params.startTime = blinkFiles(k).startTime;
        params.blinkerSaveFile = blinkerSaveFile;
        params.dumpBlinkerStructures = true;
        params.blinkerDumpDir = blinkIndDir;
        params.dumpBlinkImages = false;
        params.dumpBlinkPositions = false;
        params.keepSignals = true;      % Make true if combining downstream
        params.showMaxDistribution = false;
        params.verbose = false;
        %params.excludeLabels = {'a1', 'a2', 'vehicle position'}; 
       [EEG, com, blinks, blinkFits, blinkProperties, blinkStatistics, ...
           params] = pop_blinker(EEG, params); 
    catch Mex
        blinks.status = ['failure:' Mex.message];
    end
    
end
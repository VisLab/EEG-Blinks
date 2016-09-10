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
% Written by Kay Robbins and Kelly Kleigfas, UTSA, 2016
%
%% Setup
pop_editoptions('option_single', false, 'option_savetwofiles', false);
params = struct();

%% Set up for the BCIT driving data
blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
typeBlinks = 'AllUnrefNewBoth';
experiment = 'BCITLevel0';
blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
blinkIndDir = [blinkDir filesep experiment typeBlinks];

%% Shooter
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% typeBlinks = 'AllMastNewBoth';
% blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
% blinkIndDir = [blinkDir filesep typeBlinks];

%% BCI2000
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% typeBlinks = 'AllMastNewBoth';
% blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
% blinkIndDir = [blinkDir filesep typeBlinks];

%% NCTU Lane Keeping
% experiment = 'NCTU_LK';
% blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% typeBlinks = 'AllMastNewBoth';
% blinkFileList = [blinkDir filesep experiment 'FileList.mat'];
% blinkIndDir = [blinkDir filesep typeBlinks];

%% Load the file list
load(blinkFileList);

%% Run the blinker blink extraction to create a file.
numberFiles = length(blinkFiles);
for k = 1:numberFiles
    fprintf('%d: %s\n', k, blinkFiles(k).fileName);
    try
        EEG = pop_loadset(blinkFiles(k).fileName);
        params = checkBlinkerDefaults(struct(), getBlinkerDefaults(EEG));
        params.subjectID = blinkFiles(k).subjectID;
        params.experiment = blinkFiles(k).experiment;
        params.uniqueName = blinkFiles(k).uniqueName;
        params.task = blinkFiles(k).task;
        params.fileName = blinkFiles(k).fileName;
        params.startDate = blinkFiles(k).startDate;
        params.startTime = blinkFiles(k).startTime;
        params.blinkerSaveFile = [blinkIndDir filesep ...
            blinkFiles(k).blinkFileName '_' typeBlinks '.mat'];
        params.dumpBlinkerStructures = true;
        params.blinkerDumpDir = blinkIndDir;
        params.dumpBlinkImages = false;
        params.dumpBlinkPositions = false;
        params.keepSignals = false;      % Make true if combining downstream
        params.showMaxDistribution = false;
        params.verbose = false;
        %params.excludeLabels = {'a1', 'a2', 'vehicle position'}; 
       [EEG, com, blinks, blinkFits, blinkProperties, blinkStatistics, ...
           params] = pop_blinker(EEG, params); 
    catch Mex
        blinks.status = ['failure:' Mex.message];
    end
    
end
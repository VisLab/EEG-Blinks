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
blinkDirInd = [blinkDir filesep 'AllUnrefNewBoth'];

%% Shooter
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';
% blinkDirInd = [blinkDir filesep 'AllMastNewBothCombined'];

%% BCI2000
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% blinkDirInd = [blinkDir filesep 'AllMastNewBothCombined'];

%% NCTU Lane Keeping
% blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
% blinkDirInd = [blinkDir filesep 'AllMastNewBoth'];

%% Get the files from the base directory
inList = dir(blinkDirInd);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
fileNames = dirNames(~dirTypes);
numberFiles = length(fileNames);

%% Add the statistics to each file
for k = 1:numberFiles
    fprintf('Loading %s\n', fileNames{k});
    clear blinks blinkFits blinkProperties blinkStatistics params;
    [thisPath, thisName, thisExt] = fileparts(fileNames{k});
    fileName = [blinkDirInd filesep thisName thisExt];
    load(fileName);
    blinkStatistics = extractBlinkStatistics(blinks, blinkFits, ...
                                              blinkProperties, params);
    save(fileName, 'blinks', 'blinkFits', ...
                 'blinkProperties', 'blinkStatistics', 'params', '-v7.3');
end

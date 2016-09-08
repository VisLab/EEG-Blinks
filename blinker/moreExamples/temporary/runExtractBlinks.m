%% Extract the blinks structure based on channel or EOG time series
% This script assumes that EEGLAB is in the path, that the datasets are
% in EEGLAB EEG structures. The particular example run is for the ARL-Shoot
% collection. To run for your own data:
% 
%  1)  Put your data in one of the supported formats as indicated by
%      the collectionType:
%        FILES    all of the .set files are in one directory
%        FILES2     .set files are in subdirectories one level down from root
%        ESSLEVEL1  .set files are in an ESS Level 1 container
%        ESSLEVEL2  .set files are in an ESS Level 2 container
%        ESSDERIVED .set files are in an ESS Level derived container
%      The collectionType is used with the getFileList function to 
%      get a cell array called files with the full paths of all of the 
%      EEG .set files to be analyzed. If your data is in a different 
%      format, you will need to provide your own cell array called files 
%      with the full paths of the EEG files to be analyzed.
%      
%   2)  Downstream analysis requires the following information for each
%       dataset: [subjectID, experiment, uniqueName, task, startTime]  
%       You must manually put this into the blinks structure or add
%       code to getDatasetInfo function to do this during this call.
%
%% Extract the blinks structure
pop_editoptions('option_single', false, 'option_savetwofiles', false);
params = struct();
%% Set type of calculation (channels)
% params.signalTypeIndicator = 'UseLabels';
% params.channelLabels = {'FP1', 'FP2', 'F3', 'Fz', 'F4', ...
%    'Fpz', 'Fp1', 'Fp2', 'AF7', 'AF3', 'AFz', 'AF4', 'AF8', ...
%    'E12', 'E13', 'E14', 'E11', 'E10', 'E9', 'E28', 'E27', 'E26'};
% byType = '';

% %% Set type of calculation (EOG)
% channelList = {'HEOL', 'HEOR', 'VEOU', 'VEOL', ...
%                 'EXG1', 'EXG2', 'EXG3', 'EXG4'};

%% Set type of calculation (EOG)
% reference = [];
% channelList32 = {'VEOU'};
% channelList64 = {'EXG3'};
% channelList256 = {'EXG3'};
% byType = [];
% %% VEP
% organizationType = 'VEP';
% type = 'ChannelUnref';
% undoReference = false;
% collectionType = 'FILES';  
% experiment = 'VEP';
% pathName = 'E:\CTADATA\VEP_BIOSIMI';
% outDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% BCIT
% organizationType = 'BCIT';
% type = 'AllUnrefNewBoth';
% collectionType = 'FILES';
% baseDir = 'E:\CTADATA\BCIT\level_0';
% outDir = 'O:\ARL_Data\BCITBlinksNewRefactored';
% experiment = 'BCITLevel0';
% pathName = baseDir;
% experiment = 'Experiment X2 Traffic Complexity';
% experiment = 'Experiment X6 Speed Control';
% experiment = 'X3 Baseline Guard Duty';
% experiment = 'X4 Advanced Guard Duty';
% experiment = 'X1 Baseline RSVP';
% experiment = 'Experiment XC Calibration Driving';
% experiment = 'Experiment XB Baseline Driving';
% experiment = 'X2 RSVP Expertise';

%% Dreams
% organizationType = 'Dreams';
% %type = 'ChannelUnref';
% type = 'EOGMast';
% undoReference = false;
% collectionType = 'FILES';
% experiment = 'Dreams';
% pathName = 'E:\CTADATA\WholeNightDreams\data\level0';
% outDir = 'E:\CTADATA\WholeNightDreams\data\blinksNew';
% %byType = 'EEG';
% byType = 'EOG';

%% Shooter
% %type = 'EOGUnrefNewBoth';
% type = 'AllUnrefNewBoth';
% collectionType = 'FILES2';    %Shooter organized is subdirectories by subject
% experiment = 'Shooter';
% pathName = 'E:\CTADATA\Shooter\Level0';
% outDir = 'O:\ARL_Data\Shooter\ShooterBlinksNewRefactored';

%% BCI2000
% organizationType = 'BCI2000';
% type = 'ChannelMastNewBoth';
% undoReference = false;
% collectionType = 'FILES2';
% experiment = 'BCI2000';
% pathName = 'E:\CTADATA\BCI2000\BCI2000Set';
% outDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRevised';

%% NCTU Lane Keeping
experiment = 'NCTU_LK';
collectionType = 'ESSLEVEL1';
baseDir = 'E:\CTADATA\NCTU\Level0\01. NCTU lane-keeping task';
pathName = [baseDir filesep 'study_description.xml'];
blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
typeBlinks = 'AllMastNewBoth';

%% UMICH LSIE
% organizationType = 'UM';
% type = 'ChannelUnref';
% undoReference = false;
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% % pathName = 'E:\CTADATA\Michigan\EEG_data_for_blink_detection_out1';
% pathName = 'E:\CTADATA\Michigan\EEG_data_for_blink_detection3_out';
% outDir = 'E:\CTADATA\Michigan\EEG_blinks3';
%% Get a list of the EEG files -- remainder of the code needs list of .set files
files  = getFileList(collectionType, pathName);

%% Set the blink files
blinkFile = [experiment 'BlinksNew' typeBlinks '.mat'];

%% Run the blinker blink extraction to create a file.
blinks(length(files)) = createBlinksStructure();
for k = 1:length(files)
    fprintf('%d: %s\n', k, files{k});
    [myPath, myName, myExt] = fileparts(files{k});
    try
        EEG = pop_loadset(files{k});
        blinks(k) = extractBlinks(EEG, params);
    catch Mex
        blinks(k).status = ['failure:' Mex.message];
    end
    blinks(k).fileName = files{k};
end

%% Save the blinks 
save ([blinkDir filesep blinkFile], 'blinks', '-v7.3');
%% Extract the blinks structure based on IC time series
% This script assumes that EEGLAB is in the path, that the datasets are
% in EEGLAB EEG structures and that these datasets contain an ICA 
% decomposition. The particular example run is for the ARL-Shoot
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
%% Start of the script
% Set up options for EEGLAB
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% Shooter collection location
type = 'ICPrepClean';
undoReference = false;
collectionType = 'FILES';   % Shooter has all files in same directory
organizationType = 'Shoot'; %
experiment = 'Shooter';
pathName = 'O:\ARL_Data\Shooter\Shooter_Robust_1Hz_PrepInfomax';
outDir = 'O:\ARL_Data\Shooter\ShooterBlinks';

%% Get a list of the EEG files
files = getFileList(collectionType, pathName);

%% Set the blink files
blinkFile = [experiment 'BlinksNew' type '.mat'];

%% Run the blinker blink extraction to create a file.
blinks(length(files)) = createBlinksStructure(); 
for k = 1:length(files)
    [myPath, myName, myExt] = fileparts(files{k});
    blinks(k) = createBlinksStructure();
    try   
       EEG = pop_loadset(files{k});
       if undoReference
           EEG = unreference(EEG); %#ok<UNRCH>
       end
       [blinkComponents, blinkInfo, componentIndices] = ...
                                  getICBlinkComponents(EEG);
       blinks(k) = extractBlinks(blinkComponents, EEG.srate,  ...
                                 componentIndices, blinkInfo);
       blinks(k).status = 'success';
    catch Mex
        blinks(k).status = ['failure:' Mex.message]; 
    end
    blinks(k).fileName = files{k};
    blinks(k).type = type;
    [subjectID, experiment, uniqueName, task, startTime] = ...
                                 getDatasetInfo(EEG, organizationType);
    blinks(k).subjectID = subjectID;
    blinks(k).experiment = experiment;
    blinks(k).uniqueName = uniqueName;
    blinks(k).task = task;
    blinks(k).startTime = startTime;
end

%% Save the blinks and blink map
save ([outDir filesep blinkFile], 'blinks', '-v7.3');
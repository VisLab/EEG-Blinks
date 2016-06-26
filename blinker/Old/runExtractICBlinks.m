%% Extract the blinks structure
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% BCIT
organizationType = 'BCIT';
%type = 'IC';
type = 'ICPrepClean';
undoReference = false;
collectionType = 'ESSDERIVED';
baseDir = 'O:\ARL_Data\BCIT_ESS_256Hz_PrepClean_ICA';
%baseDir = 'O:\ARL_Data\BCIT_ESS_256Hz_ICA_Infomax';
levelDerivedFile = 'studyLevelDerived_description.xml';
outDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
%experiment = 'Experiment X6 Speed Control';
%experiment = 'X3 Baseline Guard Duty';
%experiment = 'X4 Advanced Guard Duty';
%experiment = 'X1 Baseline RSVP';
%experiment = 'Experiment XC Calibration Driving';
%experiment = 'Experiment XB Baseline Driving';
%experiment = 'X2 RSVP Expertise';
pathName = [baseDir filesep experiment filesep levelDerivedFile];

%% NCTU
% baseDir = 'O:\ARL_Data\NCTU\NCTU_PrepClean_InfomaxNew';
% %baseDir = 'O:\ARL_Data\NCTU\NCTU_Robust_0p5HzHP_ICA_Infomax';
% levelDerivedFile = 'studyLevelDerived_description.xml';
% outDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% derivedXMLFile = [baseDir filesep levelDerivedFile];

%% VEP
% collectionType = 'File';
% baseDir = 'O:\ARL_Data\VEP\VEP_PrepClean_Infomax';
% outDir = 'O:\ARL_Data\VEP\VEPBlinks';
% experiment = 'VEP';

% %% UMICH LSIE
% type = 'IC';
% undoReference = false;
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% pathName = 'E:\CTAData\LSIE_UM_ICA';
% outDir = 'E:\CTAData\LSIE_UM_Blinks';

%% Shooter
% %type = 'ICNoPrepClean';
% type = 'ICPrepClean';
% undoReference = false;
% collectionType = 'FILES';
% experiment = 'Shooter';
% pathName = 'O:\ARL_Data\Shooter\Shooter_Robust_1Hz_PrepInfomax';
% %pathName = 'O:\ARL_Data\Shooter\Shooter_Robust_1Hz_Infomax';
% outDir = 'O:\ARL_Data\Shooter\ShooterBlinks';

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
           EEG = unreference(EEG);
       end
       [blinkComponents, blinkInfo, componentIndices] = ...
                                  getICBlinkComponents(EEG);
       blinks(k) = extractBlinks(blinkComponents, blinkInfo, ...
                                 componentIndices, EEG.srate);
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
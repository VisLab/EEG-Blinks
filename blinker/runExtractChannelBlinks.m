%% Extract the blinks structure
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% Set type of calculation
reference = [];
channelList32 = {'FP1', 'FP2', 'F3', 'Fz', 'F4'};
channelList64 = {'Fpz', 'Fp1', 'Fp2', 'AF7', 'AF3', 'AFz', 'AF4', 'AF8'};
channelList256 = {'E12', 'E13', 'E14', 'E11', 'E10', 'E9', 'E28', 'E27', 'E26'};

% reference = [];
% channelList32 = {'HEOL', 'HEOR', 'VEOU', 'VEOL'};
% channelList64 = {'EXG1', 'EXG2', 'EXG3', 'EXG4', 'EXG5', 'EXG6'};
% channelList256 = {'EXG1', 'EXG2', 'EXG3', 'EXG4', 'EXG5', 'EXG6', 'EXG7', 'EXG8'};

% %% BCIT
% organizationType = 'BCIT';
% %type = 'IC';
% type = 'EOG';
% undoReference = false;
% collectionType = 'ESSDERIVED';
% baseDir = 'O:\ARL_Data\BCIT_ESS_256Hz_PrepClean_ICA';
% %baseDir = 'O:\ARL_Data\BCIT_ESS_256Hz_ICA_Infomax';
% levelDerivedFile = 'studyLevelDerived_description.xml';
% outDir = 'O:\ARL_Data\BCITBlinks';
% %experiment = 'BCITLevel0';
% experiment = 'Experiment X2 Traffic Complexity';
% %experiment = 'Experiment X6 Speed Control';
% %experiment = 'X3 Baseline Guard Duty';
% %experiment = 'X4 Advanced Guard Duty';
% %experiment = 'X1 Baseline RSVP';
% %experiment = 'Experiment XC Calibration Driving';
% %experiment = 'Experiment XB Baseline Driving';
% %experiment = 'X2 RSVP Expertise';
% pathName = [baseDir filesep experiment filesep levelDerivedFile];

%% NCTU
% organizationType = 'NCTU';
% collectionType = 'ESSLEVEL2';
% type = 'Channel';
% undoReference = false;
% %baseDir = 'O:\ARL_Data\NCTU\NCTU_PrepClean_InfomaxNew';
% %baseDir = 'O:\ARL_Data\NCTU\NCTU_Robust_0p5HzHP_ICA_Infomax';
% baseDir = 'O:\ARL_Data\NCTU\NCTU_Robust_1Hz';
% levelDerivedFile = 'studyLevel2_description.xml';
% outDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% pathName = [baseDir filesep levelDerivedFile];

%% BCI2000
% organizationType = 'BCI2000';
% type = 'Channel';
% undoReference = false;
% collectionType = 'FILES';
% experiment = 'BCI2000';
% pathName = 'O:\ARL_Data\BCI2000\BCI2000Robust_1Hz_Unfiltered';
% outDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';

%% VEP
% collectionType = 'File';
% baseDir = 'E:\CTAData\VEP';
% %baseDir = 'O:\ARL_Data\VEP\VEP_PrepClean_Infomax';
% outDir = 'O:\ARL_Data\VEP\VEPBlinks';
% experiment = 'VEP';

%% UMICH LSIE
% type = 'Channel';
% undoReference = false;
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% pathName = 'E:\CTAData\LSIE_UM_ICA';
% outDir = 'E:\CTAData\LSIE_UM_Blinks';

%% Shooter
organizationType = 'Shooter';
type = 'ChannelUnref';
undoReference = false;
collectionType = 'FILES2';
experiment = 'Shooter';
pathName = 'E:\CTADATA\Shooter\Level0';
outDir = 'O:\ARL_Data\Shooter\ShooterBlinks';

%% Get a list of the EEG files
files  = getFileList(collectionType, pathName);

%% Set the blink files
blinkFile = [experiment 'BlinksNew' type '.mat'];

%% Run the blinker blink extraction to create a file.
blinks(length(files)) = createBlinksStructure();
for k = 1:length(files)
    fprintf('%d: %s\n', k, files{k});
    [myPath, myName, myExt] = fileparts(files{k});
    try
        EEG = pop_loadset(files{k});
        if undoReference
           EEG = unreference(EEG); %#ok<UNRCH>
        end
        if length(EEG.chanlocs) >= 256
            channelList = channelList256;
        elseif length(EEG.chanlocs) >= 64
            channelList = channelList64;
        else
            channelList = channelList32;
        end

        [blinkComponents, blinkInfo, componentIndices] = ...
            getChannelBlinkComponents(EEG, channelList);       
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
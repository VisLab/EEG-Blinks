%% Run the blink statistics given
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% VEP setup
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% Miscellaneous
% blinkDir = 'D:\Research\BlinkerLeftovers\VideoHTML';
% blinkFile = 'ARL_BCIT_T1_M051_S1026PREPICABlinks.mat';
% blinkStatsFiles = 'ARL_BCIT_T1_M051_S1026PREPICAStatsOut.mat';

% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
% blinkFile = 'LSIEBlinks.mat';
% blinkStatsFiles = 'LSIEStatsOut.mat';

%% BCIT Examples
% collectionType = 'FILES';
% experiment = 'BCITLevel0';
% blinkDir = 'O:\ARL_Data\BCITBlinks';

% %type = 'EOG';
% type = 'IC';
% blinkDir = 'O:\ARL_Data\BCITBlinks';
% %blinkDir = 'K:\BCITBlinks';
% experiment = 'Experiment X2 Traffic Complexity';
% experiment = 'Experiment X6 Speed Control';
% experiment = 'X3 Baseline Guard Duty';
% experiment = 'X4 Advanced Guard Duty';
% experiment = 'X1 Baseline RSVP';
%experiment = 'Experiment XC Calibration Driving';
%experiment = 'Experiment XB Baseline Driving';
% experiment = 'X2 RSVP Expertise';

%% VEP
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% experiment = 'VEP';

% %% NCTU
% collectionType = 'ESSLEVEL2';
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% %type = 'IC';
% type = 'Channel';

% %% UMICH LSIE
% %type = 'Channel';
% type = 'IC';
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';

%% Shooter
% % type = 'ChannelUnref';
% type = 'EOGUnref';
% collectionType = 'FILES2';
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';

%% BCI2000
organizationType = 'BCI2000';
type = 'Channel';
undoReference = false;
collectionType = 'FILES';
experiment = 'BCI2000';
blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
excludedTasks = 'EyesClosed';
%% Update file names with the experiment
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);

%% Exclude files
tasks = {blinks.task};
taskMask = zeros(size(tasks));
for k = 1:length(excludedTasks)
    thisMask = strcmpi(tasks, excludedTasks{k});
    c
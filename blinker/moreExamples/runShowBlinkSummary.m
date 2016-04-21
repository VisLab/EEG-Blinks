%% This script displays various graphs summarizing blink statistics
individual = 0;

%% Set up the input and output files for VEP Summary
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';

%% Set up input and output for BCIT
%type = 'IC';
%type = 'Channel';
% type = 'EOGUnref';
% blinkDir = 'O:\ARL_Data\BCITBlinks';
% experiment = 'BCITLevel0';
%experiment = 'Experiment X2 Traffic Complexity';
%experiment = 'Experiment X6 Speed Control';
%experiment = 'X3 Baseline Guard Duty';
%experiment = 'X4 Advanced Guard Duty';
%experiment = 'X1 Baseline RSVP';
%experiment = 'Experiment XC Calibration Driving';
%experiment = 'Experiment XB Baseline Driving';
%experiment = 'X2 RSVP Expertise';

% %% NCTU
% type = 'ChannelUnref';
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';

% %% UMICH LSIE
% %type = 'Channel';
% type = 'IC';
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';

%% Shooter
%type = 'ChannelUnref';
type = 'EOGUnref';
collectionType = 'FILES2';
experiment = 'Shooter';
blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';

%% Set up the files for the collection
blinkSummaryFile = [experiment 'BlinksNewSummary' type '.mat'];

%% Load the blink summary file
load([blinkDir filesep blinkSummaryFile]);

%% Show the statistics
showBlinkSummary(blinkSummary, individual);

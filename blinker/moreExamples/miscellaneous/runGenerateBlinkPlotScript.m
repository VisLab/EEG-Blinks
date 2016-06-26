%% This script that generates an unrolled script for publishing blink plots
scriptDir = 'D:\Research\BlinkDetectionCurrent\EEG-Blinks\blinker\examples';
suffix = 'BlinksNew';
blinkBatchSize = 150;
pause on;
publishOn = false;
%% Shooter
% scriptDir = 'D:\Research\BlinkDetectionCurrentCopy2\EEG-Blinks\blinker\examples';
% scriptName = 'publishShooterBlinks.m';
% inputDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
% inputBlinkFile = 'shooterBlinks_With_PREPClean_ICA.mat';
% outputDir = 'O:\ARL_Data\Shooter\ShooterBlinkOutput\PREPClean_ICA_Linear';
% blinkStatsFiles = 'shooterBlinks_With_PREPClean_ICABlinkOut.mat';

%% VEP
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% scriptDir = 'D:\Research\BlinkDetectionCurrent\EEG-Blinks\blinker\examples';
% scriptName = 'publishBlinksVEP.m';
% outputDir = 'O:\ARL_Data\VEP\VEPBlinkOutput\PREPClean';
% blinkBatchSize = 250;

%% BCIT
blinkTypes = {'IC', 'Channel', 'EOG'};
scriptName = 'publishBlinksBCITX2.m';
% baseDir = 'O:\ARL_Data\BCIT_ESS_256Hz_PrepClean_ICA';
% levelDerivedFile = 'studyLevelDerived_description.xml';
blinkDir = 'O:\ARL_Data\BCITBlinks';
outputDir = 'O:\ARL_Data\BCITOutput';
%experiment = 'Experiment X2 Traffic Complexity';
%experiment = 'Experiment X6 Speed Control';
%experiment = 'X3 Baseline Guard Duty';
%experiment = 'X4 Advanced Guard Duty';
%experiment = 'X1 Baseline RSVP';
%experiment = 'Experiment XC Calibration Driving';
%experiment = 'Experiment XB Baseline Driving';
%experiment = 'X2 RSVP Expertise';
%%
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinks';
type = 'ChannelUnref';
excludeTasks = {};

%% VEP setup
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
% outputDir = 'O:\ARL_Data\VEP\BlinkOutput';
%% BCIT VIDEO GENERATION
% scriptDir = 'D:\Research\BlinkDetectionCurrentCopy2\EEG-Blinks\blinker\examples';
% scriptName = 'publishBCITVideoTestChannelBlinks.m';
% dataDir = 'D:\Research\BlinkerLeftovers\VideoHTML';
% blinkDir = 'D:\Research\BlinkerLeftovers\VideoHTML';
% blinkFile = 'ARL_BCIT_T1_M051_S1026PREPICABlinks.mat';
% blinkStatsFile = 'ARL_BCIT_T1_M051_S1026PREPICAStatsOut.mat';
% outputDir = 'D:\Research\BlinkerLeftovers\VideoHTML';
% channelLabel = 'Fpz';
% EOGLabel = 'EXG3';
% blinkBatchSize = 250;

% %% LSIE tests
% blinkTypes = {'Channel', 'IC'};
% collectionType = 'FILES';
% experiment = 'LSIE_UM';
% blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
% scriptName = 'publishLSIEPlotBlinks.m';
% outputDir = 'E:\CTAData\LSIE_UM_BlinkOutput';

%% Setup the files
blinkFile = [experiment suffix blinkTypes{1} '.mat'];
blinkPropertiesFile = [experiment suffix 'Properties' blinkTypes{1} '.mat'];
blinkSummaryFile = [experiment suffix 'Summary' blinkTypes{1} '.mat'];

%% Create the script file
fid = fopen([scriptDir filesep scriptName], 'w');

%% Load the data blinks
blinkFiles = cell(length(blinkTypes), 1);
blinkFileNames = cell(length(blinkTypes), 1);
for t = 1:length(blinkTypes)
    blinkFileNames{t} = [blinkDir filesep experiment suffix blinkTypes{t} '.mat'];
    load(blinkFileNames{t});
    blinkFiles{t} = blinks;
end
blinkPropertiesFileName = ...
    [blinkDir filesep experiment suffix 'Properties' blinkTypes{1} '.mat'];

%% Make sure base output directory exists
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

%% Generate the publish script
blinksMain = blinkFiles{1};
for n = 1:length(blinksMain)
    dBlinks = blinkFiles{1}(n);
    if isnan(dBlinks.usedComponent)
        continue;
    end
    blinkIndices = dBlinks.componentIndices;
    used = find(blinkIndices == dBlinks.usedComponent, 1, 'first');
    blinkPositions = dBlinks.blinkPositions{used};
    numberBlinks = size(blinkPositions, 2);
    numberBatches = max(1, floor(numberBlinks/blinkBatchSize));
    adjustedBatchSize = ceil(numberBlinks/numberBatches);
    startBatch = 1;
    for j = 1:numberBatches
        endBatch = min(numberBlinks, startBatch + adjustedBatchSize - 1);
        traceLength = size(dBlinks.blinkComponents, 2);
        
        fprintf(fid, '\n\n%%%% Code for dataset %g\n', n);
        fprintf(fid, 'pause on;\n');
        fprintf(fid, 'n = %d;\n', n);
        fprintf(fid, 'blinkDir = ''%s'';\n', blinkDir');
        fprintf(fid, 'experiment = ''%s'';\n', experiment);
        fprintf(fid, 'blinkFiles = cell(%d, 1);\n', length(blinkTypes));
        fprintf(fid, 'blinkTypes = cell(%d, 1);\n', length(blinkTypes));
        fprintf(fid,  'blinkTraces = zeros(%d, %d);\n', ...
            length(blinkTypes), traceLength);
        for t = 1:length(blinkTypes)
            fprintf(fid, 'load(''%s'');\n', blinkFileNames{t});
            fprintf(fid, 'blinkFiles{%d} = blinks;\n', t);
            fprintf(fid, 'blinkTypes{%d} = ''%s'';\n', t, blinkTypes{t});
            fprintf(fid, 'componentIndices = blinkFiles{%d}(%d).componentIndices;\n', t, n);
            fprintf(fid, 'used = blinkFiles{%d}(%d).usedComponent;\n', t, n);
            fprintf(fid, 'used = find(componentIndices == used, 1, ''first'');\n');
            fprintf(fid, 'components = blinkFiles{%d}(%d).blinkComponents;\n', t, n);
            fprintf(fid, 'blinkTraces(%d, :) = components(used, :);\n', t);
        end
        fprintf(fid, 'dBlinks = blinkFiles{1}(%d);\n', n);
        fprintf(fid, 'load(''%s'');\n', blinkPropertiesFileName);
        fprintf(fid, 'bFits = blinkFits{%d};\n', n);
        fprintf(fid, 'bProperties = blinkProperties{%d};\n', n);
        fprintf(fid, 'dataName = blinkFiles{1}(%d).fileName;\n', n);
        fprintf(fid, '[~, dataName] = fileparts(dataName);\n');
        fprintf(fid, 'thisOutputDir = ''%s%s%sDataset%d'';\n', ...
            outputDir, filesep, experiment, n);
        fprintf(fid, 'if ~exist(thisOutputDir, ''dir'')\n');
        fprintf(fid, '   mkdir(thisOutputDir);\n');
        fprintf(fid, 'end\n');
        fprintf(fid, 'startBatch = %d;\n', startBatch);
        fprintf(fid, 'endBatch = %d;\n', endBatch);
        
        fprintf(fid, '\n');
        fprintf(fid, 'n = %g; %%#ok<NASGU>\n', n);
        fprintf(fid, 'scriptName = ''plotBlinkScript'';\n');
   
        fprintf(fid, 'publish_options.outputDir = [thisOutputDir filesep scriptName ''Batch%d''];\n', j);
        fprintf(fid, 'publish_options.format = ''html'';\n');
        fprintf(fid, 'if exist(publish_options.outputDir, ''dir'') == 0\n');
        fprintf(fid, '   mkdir(publish_options.outputDir);\n');
        fprintf(fid, 'end;\n');
        if publishOn
            fprintf(fid, 'publish([scriptName ''.m''], publish_options);\n');
            fprintf(fid, 'close all;\n');
            fprintf(fid, 'clear all;\n');
            fprintf(fid, 'fclose all;\n');
            fprintf(fid, 'pause\n');
        else
            fprintf(fid, 'plotBlinkScript;\n');
            fprintf(fid, 'pause\n');
        end
        
        startBatch = startBatch + adjustedBatchSize;
    end
end
fclose(fid);

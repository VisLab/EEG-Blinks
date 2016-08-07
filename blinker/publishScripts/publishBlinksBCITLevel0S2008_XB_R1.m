

%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2828288);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2008_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M023_S2008_XB_CB_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 111;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(1, 1);
blinkFits = cell(1, 1);
blinkProperties = cell(1, 1);
blinkTraces = zeros(1, 2828288);
load('O:\ARL_Data\BCITBlinkOutputNew\data\BCITLevel0DatasetBlinksEOGUnrefNewBothS2008_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnrefNewBoth';
signalIndices = blinkFiles{1}(1).signalIndices;
used = blinkFiles{1}(1).usedSignal;
used = find(signalIndices == abs(used), 1, 'first');
signals = blinkFiles{1}(1).candidateSignals;
blinkTraces(1, :) = signals(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutputNew\output\BCITLevel0DatasetARL_BCIT_T2_M023_S2008_XB_CB_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 112;
endBatch = 222;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;

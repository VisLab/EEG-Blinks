

%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(2, 1);
blinkFits = cell(2, 1);
blinkProperties = cell(2, 1);
blinkTraces = zeros(2, 1014784);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2023_XC_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2023_XC_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'ChannelUnref';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1};
dProperties = blinkProperties{1};
dFits = blinkFits{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M067_S2023_XC_C0_R1_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 189;

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

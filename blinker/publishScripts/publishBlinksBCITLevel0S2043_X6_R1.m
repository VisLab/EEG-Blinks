

%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(2, 1);
blinkFits = cell(2, 1);
blinkProperties = cell(2, 1);
blinkTraces = zeros(2, 2868224);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2043_X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2043_X6_R1.mat');
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M128_S2043_X6_CB_R2_EEG_1';
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
blinkFiles = cell(2, 1);
blinkFits = cell(2, 1);
blinkProperties = cell(2, 1);
blinkTraces = zeros(2, 2868224);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2043_X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2043_X6_R1.mat');
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M128_S2043_X6_CB_R2_EEG_1';
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


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(2, 1);
blinkFits = cell(2, 1);
blinkProperties = cell(2, 1);
blinkTraces = zeros(2, 2868224);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2043_X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2043_X6_R1.mat');
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M128_S2043_X6_CB_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 223;
endBatch = 333;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
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
blinkFiles = cell(2, 1);
blinkFits = cell(2, 1);
blinkProperties = cell(2, 1);
blinkTraces = zeros(2, 2868224);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2043_X6_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'EOGUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2043_X6_R1.mat');
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M128_S2043_X6_CB_R2_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 334;
endBatch = 444;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;

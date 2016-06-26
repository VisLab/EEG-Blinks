

%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(2, 1);
blinkFits = cell(2, 1);
blinkProperties = cell(2, 1);
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 104;

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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 105;
endBatch = 208;

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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 209;
endBatch = 312;

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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 313;
endBatch = 416;

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


%% Code for dataset 1
pause on;
n = 1;
blinkFiles = cell(2, 1);
blinkFits = cell(2, 1);
blinkProperties = cell(2, 1);
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 417;
endBatch = 520;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 521;
endBatch = 624;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 625;
endBatch = 728;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 729;
endBatch = 832;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 833;
endBatch = 936;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch9'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 937;
endBatch = 1040;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch10'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1041;
endBatch = 1144;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch11'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1145;
endBatch = 1248;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch12'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1249;
endBatch = 1352;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch13'];
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
blinkTraces = zeros(2, 2828288);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksChannelUnrefS2027_XB_R1.mat');
blinkFiles{1} = dBlinks;
blinkFits{1} = dFits{1};
blinkProperties{1} = dProperties{1};
blinkTypes{1} = 'ChannelUnref';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinkOutput\data\BCITLevel0DatasetBlinksEOGUnrefS2027_XB_R1.mat');
blinkFiles{2} = dBlinks;
blinkFits{2} = dFits{1};
blinkProperties{2} = dProperties{1};
blinkTypes{2} = 'EOGUnref';
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
thisOutputDir = 'O:\ARL_Data\BCITBlinkOutput\output\BCITLevel0DatasetARL_BCIT_T2_M081_S2027_XB_CA_R3_EEG_1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1353;
endBatch = 1449;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch14'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;

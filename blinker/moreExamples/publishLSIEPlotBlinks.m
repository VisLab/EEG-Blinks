

%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 152;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 153;
endBatch = 304;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 305;
endBatch = 456;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 457;
endBatch = 608;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 609;
endBatch = 760;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 761;
endBatch = 912;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 913;
endBatch = 1064;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1065;
endBatch = 1216;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1217;
endBatch = 1368;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1369;
endBatch = 1520;

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
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 2375168);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1521;
endBatch = 1662;

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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 154;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 155;
endBatch = 308;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 309;
endBatch = 462;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 463;
endBatch = 616;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 617;
endBatch = 770;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 771;
endBatch = 924;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 925;
endBatch = 1078;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1079;
endBatch = 1232;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1233;
endBatch = 1386;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1387;
endBatch = 1540;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1541;
endBatch = 1694;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1854976);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1695;
endBatch = 1839;

n = 2; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 155;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 156;
endBatch = 310;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 311;
endBatch = 465;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 466;
endBatch = 620;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 621;
endBatch = 775;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 776;
endBatch = 930;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 931;
endBatch = 1085;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1086;
endBatch = 1240;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1241;
endBatch = 1395;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1396;
endBatch = 1550;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1551;
endBatch = 1705;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1706;
endBatch = 1860;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1861;
endBatch = 2015;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 2016;
endBatch = 2170;

n = 3; %#ok<NASGU>
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
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 2171;
endBatch = 2325;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch15'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 2326;
endBatch = 2480;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch16'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 2481;
endBatch = 2635;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch17'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 2636;
endBatch = 2790;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch18'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1859072);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 2791;
endBatch = 2932;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch19'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
publish([scriptName '.m'], publish_options);
close all;
clear all;
fclose all;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 158;

n = 4; %#ok<NASGU>
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
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 159;
endBatch = 316;

n = 4; %#ok<NASGU>
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
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 317;
endBatch = 474;

n = 4; %#ok<NASGU>
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
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 475;
endBatch = 632;

n = 4; %#ok<NASGU>
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
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 633;
endBatch = 790;

n = 4; %#ok<NASGU>
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
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 791;
endBatch = 948;

n = 4; %#ok<NASGU>
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
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 949;
endBatch = 1106;

n = 4; %#ok<NASGU>
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
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'E:\CTAData\LSIE_UM_Blinks';
experiment = 'LSIE_UM';
blinkFiles = cell(2, 1);
blinkTypes = cell(2, 1);
blinkTraces = zeros(2, 1537024);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewChannel.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'Channel';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewIC.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'IC';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('E:\CTAData\LSIE_UM_Blinks\LSIE_UMBlinksNewPropertiesChannel.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'E:\CTAData\LSIE_UM_BlinkOutput\LSIE_UMDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1107;
endBatch = 1262;

n = 4; %#ok<NASGU>
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
pause



%% Code for dataset 1
n = 1;
blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
experiment = 'vep';
blinkFiles = cell(5, 1);
blinkTypes = cell(5, 1);
blinkTraces = zeros(5, 313856);
load('O:\ARL_Data\VEP\VEPBlinks\vepBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\VEP\VEPBlinks\vepBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\VEP\VEPBlinks\vepBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
load('O:\ARL_Data\VEP\VEPBlinks\vepBlinksNewChannelUnref.mat');
blinkFiles{4} = blinks;
blinkTypes{4} = 'ChannelUnref';
componentIndices = blinkFiles{4}(1).componentIndices;
used = blinkFiles{4}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{4}(1).blinkComponents;
blinkTraces(4, :) = components(used, :);
load('O:\ARL_Data\VEP\VEPBlinks\vepBlinksNewEOGUnref.mat');
blinkFiles{5} = blinks;
blinkTypes{5} = 'EOGUnref';
componentIndices = blinkFiles{5}(1).componentIndices;
used = blinkFiles{5}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{5}(1).blinkComponents;
blinkTraces(5, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\VEP\VEPBlinks\vepBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\VEP\BlinkOutput\vepDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 115;

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

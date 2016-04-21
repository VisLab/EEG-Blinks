

%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 164;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 165;
endBatch = 328;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 329;
endBatch = 492;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 493;
endBatch = 656;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 657;
endBatch = 820;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 821;
endBatch = 984;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 985;
endBatch = 1148;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1149;
endBatch = 1312;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1313;
endBatch = 1476;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch9'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1477;
endBatch = 1640;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch10'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 1
pause on;
n = 1;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 749824);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(1).componentIndices;
used = blinkFiles{1}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(1).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(1).componentIndices;
used = blinkFiles{2}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(1).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(1).componentIndices;
used = blinkFiles{3}(1).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(1).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(1);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{1};
bProperties = blinkProperties{1};
dataName = blinkFiles{1}(1).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset1';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1641;
endBatch = 1794;

n = 1; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch11'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(2).componentIndices;
used = blinkFiles{3}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(2).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 189;

n = 2; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(2).componentIndices;
used = blinkFiles{3}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(2).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 190;
endBatch = 378;

n = 2; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 2
pause on;
n = 2;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(2).componentIndices;
used = blinkFiles{1}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(2).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(2).componentIndices;
used = blinkFiles{2}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(2).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(2).componentIndices;
used = blinkFiles{3}(2).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(2).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(2);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{2};
bProperties = blinkProperties{2};
dataName = blinkFiles{1}(2).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset2';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 379;
endBatch = 565;

n = 2; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706560);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(3).componentIndices;
used = blinkFiles{3}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(3).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 190;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706560);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(3).componentIndices;
used = blinkFiles{3}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(3).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 191;
endBatch = 380;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 3
pause on;
n = 3;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706560);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(3).componentIndices;
used = blinkFiles{1}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(3).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(3).componentIndices;
used = blinkFiles{2}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(3).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(3).componentIndices;
used = blinkFiles{3}(3).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(3).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(3);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{3};
bProperties = blinkProperties{3};
dataName = blinkFiles{1}(3).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset3';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 381;
endBatch = 569;

n = 3; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 164;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 165;
endBatch = 328;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 329;
endBatch = 492;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 493;
endBatch = 656;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 657;
endBatch = 820;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 821;
endBatch = 984;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 985;
endBatch = 1148;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1149;
endBatch = 1312;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 4
pause on;
n = 4;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(4).componentIndices;
used = blinkFiles{1}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(4).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(4).componentIndices;
used = blinkFiles{2}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(4).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(4).componentIndices;
used = blinkFiles{3}(4).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(4).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(4);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{4};
bProperties = blinkProperties{4};
dataName = blinkFiles{1}(4).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset4';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1313;
endBatch = 1476;

n = 4; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch9'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 5
pause on;
n = 5;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 733184);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(5).componentIndices;
used = blinkFiles{1}(5).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(5).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(5).componentIndices;
used = blinkFiles{2}(5).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(5).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(5).componentIndices;
used = blinkFiles{3}(5).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(5).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(5);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{5};
bProperties = blinkProperties{5};
dataName = blinkFiles{1}(5).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset5';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 181;

n = 5; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 5
pause on;
n = 5;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 733184);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(5).componentIndices;
used = blinkFiles{1}(5).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(5).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(5).componentIndices;
used = blinkFiles{2}(5).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(5).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(5).componentIndices;
used = blinkFiles{3}(5).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(5).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(5);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{5};
bProperties = blinkProperties{5};
dataName = blinkFiles{1}(5).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset5';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 182;
endBatch = 362;

n = 5; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 6
pause on;
n = 6;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 703232);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(6).componentIndices;
used = blinkFiles{1}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(6).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(6).componentIndices;
used = blinkFiles{2}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(6).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(6).componentIndices;
used = blinkFiles{3}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(6).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(6);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{6};
bProperties = blinkProperties{6};
dataName = blinkFiles{1}(6).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset6';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 178;

n = 6; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 6
pause on;
n = 6;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 703232);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(6).componentIndices;
used = blinkFiles{1}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(6).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(6).componentIndices;
used = blinkFiles{2}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(6).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(6).componentIndices;
used = blinkFiles{3}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(6).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(6);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{6};
bProperties = blinkProperties{6};
dataName = blinkFiles{1}(6).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset6';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 179;
endBatch = 356;

n = 6; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 6
pause on;
n = 6;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 703232);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(6).componentIndices;
used = blinkFiles{1}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(6).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(6).componentIndices;
used = blinkFiles{2}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(6).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(6).componentIndices;
used = blinkFiles{3}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(6).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(6);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{6};
bProperties = blinkProperties{6};
dataName = blinkFiles{1}(6).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset6';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 357;
endBatch = 534;

n = 6; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 6
pause on;
n = 6;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 703232);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(6).componentIndices;
used = blinkFiles{1}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(6).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(6).componentIndices;
used = blinkFiles{2}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(6).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(6).componentIndices;
used = blinkFiles{3}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(6).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(6);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{6};
bProperties = blinkProperties{6};
dataName = blinkFiles{1}(6).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset6';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 535;
endBatch = 712;

n = 6; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 6
pause on;
n = 6;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 703232);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(6).componentIndices;
used = blinkFiles{1}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(6).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(6).componentIndices;
used = blinkFiles{2}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(6).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(6).componentIndices;
used = blinkFiles{3}(6).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(6).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(6);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{6};
bProperties = blinkProperties{6};
dataName = blinkFiles{1}(6).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset6';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 713;
endBatch = 890;

n = 6; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 7
pause on;
n = 7;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 651008);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(7).componentIndices;
used = blinkFiles{1}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(7).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(7).componentIndices;
used = blinkFiles{2}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(7).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(7).componentIndices;
used = blinkFiles{3}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(7).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(7);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{7};
bProperties = blinkProperties{7};
dataName = blinkFiles{1}(7).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset7';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 152;

n = 7; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 7
pause on;
n = 7;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 651008);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(7).componentIndices;
used = blinkFiles{1}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(7).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(7).componentIndices;
used = blinkFiles{2}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(7).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(7).componentIndices;
used = blinkFiles{3}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(7).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(7);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{7};
bProperties = blinkProperties{7};
dataName = blinkFiles{1}(7).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset7';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 153;
endBatch = 304;

n = 7; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 7
pause on;
n = 7;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 651008);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(7).componentIndices;
used = blinkFiles{1}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(7).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(7).componentIndices;
used = blinkFiles{2}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(7).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(7).componentIndices;
used = blinkFiles{3}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(7).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(7);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{7};
bProperties = blinkProperties{7};
dataName = blinkFiles{1}(7).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset7';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 305;
endBatch = 456;

n = 7; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 7
pause on;
n = 7;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 651008);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(7).componentIndices;
used = blinkFiles{1}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(7).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(7).componentIndices;
used = blinkFiles{2}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(7).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(7).componentIndices;
used = blinkFiles{3}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(7).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(7);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{7};
bProperties = blinkProperties{7};
dataName = blinkFiles{1}(7).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset7';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 457;
endBatch = 608;

n = 7; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 7
pause on;
n = 7;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 651008);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(7).componentIndices;
used = blinkFiles{1}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(7).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(7).componentIndices;
used = blinkFiles{2}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(7).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(7).componentIndices;
used = blinkFiles{3}(7).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(7).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(7);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{7};
bProperties = blinkProperties{7};
dataName = blinkFiles{1}(7).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset7';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 609;
endBatch = 759;

n = 7; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 8
pause on;
n = 8;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706048);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(8).componentIndices;
used = blinkFiles{1}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(8).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(8).componentIndices;
used = blinkFiles{2}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(8).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(8).componentIndices;
used = blinkFiles{3}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(8).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(8);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{8};
bProperties = blinkProperties{8};
dataName = blinkFiles{1}(8).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset8';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 187;

n = 8; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 8
pause on;
n = 8;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706048);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(8).componentIndices;
used = blinkFiles{1}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(8).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(8).componentIndices;
used = blinkFiles{2}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(8).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(8).componentIndices;
used = blinkFiles{3}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(8).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(8);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{8};
bProperties = blinkProperties{8};
dataName = blinkFiles{1}(8).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset8';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 188;
endBatch = 374;

n = 8; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 8
pause on;
n = 8;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706048);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(8).componentIndices;
used = blinkFiles{1}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(8).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(8).componentIndices;
used = blinkFiles{2}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(8).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(8).componentIndices;
used = blinkFiles{3}(8).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(8).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(8);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{8};
bProperties = blinkProperties{8};
dataName = blinkFiles{1}(8).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset8';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 375;
endBatch = 560;

n = 8; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 9
pause on;
n = 9;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(9).componentIndices;
used = blinkFiles{1}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(9).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(9).componentIndices;
used = blinkFiles{2}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(9).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(9).componentIndices;
used = blinkFiles{3}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(9).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(9);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{9};
bProperties = blinkProperties{9};
dataName = blinkFiles{1}(9).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset9';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 161;

n = 9; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 9
pause on;
n = 9;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(9).componentIndices;
used = blinkFiles{1}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(9).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(9).componentIndices;
used = blinkFiles{2}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(9).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(9).componentIndices;
used = blinkFiles{3}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(9).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(9);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{9};
bProperties = blinkProperties{9};
dataName = blinkFiles{1}(9).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset9';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 162;
endBatch = 322;

n = 9; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 9
pause on;
n = 9;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(9).componentIndices;
used = blinkFiles{1}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(9).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(9).componentIndices;
used = blinkFiles{2}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(9).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(9).componentIndices;
used = blinkFiles{3}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(9).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(9);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{9};
bProperties = blinkProperties{9};
dataName = blinkFiles{1}(9).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset9';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 323;
endBatch = 483;

n = 9; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 9
pause on;
n = 9;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(9).componentIndices;
used = blinkFiles{1}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(9).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(9).componentIndices;
used = blinkFiles{2}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(9).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(9).componentIndices;
used = blinkFiles{3}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(9).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(9);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{9};
bProperties = blinkProperties{9};
dataName = blinkFiles{1}(9).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset9';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 484;
endBatch = 644;

n = 9; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 9
pause on;
n = 9;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(9).componentIndices;
used = blinkFiles{1}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(9).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(9).componentIndices;
used = blinkFiles{2}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(9).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(9).componentIndices;
used = blinkFiles{3}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(9).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(9);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{9};
bProperties = blinkProperties{9};
dataName = blinkFiles{1}(9).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset9';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 645;
endBatch = 805;

n = 9; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 9
pause on;
n = 9;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(9).componentIndices;
used = blinkFiles{1}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(9).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(9).componentIndices;
used = blinkFiles{2}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(9).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(9).componentIndices;
used = blinkFiles{3}(9).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(9).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(9);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{9};
bProperties = blinkProperties{9};
dataName = blinkFiles{1}(9).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset9';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 806;
endBatch = 961;

n = 9; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 158;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 159;
endBatch = 316;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 317;
endBatch = 474;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 475;
endBatch = 632;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 633;
endBatch = 790;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 791;
endBatch = 948;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 949;
endBatch = 1106;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1107;
endBatch = 1264;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 10
pause on;
n = 10;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 707840);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(10).componentIndices;
used = blinkFiles{1}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(10).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(10).componentIndices;
used = blinkFiles{2}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(10).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(10).componentIndices;
used = blinkFiles{3}(10).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(10).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(10);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{10};
bProperties = blinkProperties{10};
dataName = blinkFiles{1}(10).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset10';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1265;
endBatch = 1421;

n = 10; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch9'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 11
pause on;
n = 11;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(11).componentIndices;
used = blinkFiles{1}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(11).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(11).componentIndices;
used = blinkFiles{2}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(11).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(11).componentIndices;
used = blinkFiles{3}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(11).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(11);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{11};
bProperties = blinkProperties{11};
dataName = blinkFiles{1}(11).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset11';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 165;

n = 11; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 11
pause on;
n = 11;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(11).componentIndices;
used = blinkFiles{1}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(11).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(11).componentIndices;
used = blinkFiles{2}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(11).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(11).componentIndices;
used = blinkFiles{3}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(11).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(11);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{11};
bProperties = blinkProperties{11};
dataName = blinkFiles{1}(11).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset11';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 166;
endBatch = 330;

n = 11; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 11
pause on;
n = 11;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(11).componentIndices;
used = blinkFiles{1}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(11).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(11).componentIndices;
used = blinkFiles{2}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(11).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(11).componentIndices;
used = blinkFiles{3}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(11).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(11);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{11};
bProperties = blinkProperties{11};
dataName = blinkFiles{1}(11).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset11';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 331;
endBatch = 495;

n = 11; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 11
pause on;
n = 11;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(11).componentIndices;
used = blinkFiles{1}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(11).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(11).componentIndices;
used = blinkFiles{2}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(11).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(11).componentIndices;
used = blinkFiles{3}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(11).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(11);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{11};
bProperties = blinkProperties{11};
dataName = blinkFiles{1}(11).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset11';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 496;
endBatch = 660;

n = 11; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 11
pause on;
n = 11;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(11).componentIndices;
used = blinkFiles{1}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(11).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(11).componentIndices;
used = blinkFiles{2}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(11).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(11).componentIndices;
used = blinkFiles{3}(11).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(11).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(11);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{11};
bProperties = blinkProperties{11};
dataName = blinkFiles{1}(11).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset11';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 661;
endBatch = 822;

n = 11; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 12
pause on;
n = 12;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(12).componentIndices;
used = blinkFiles{1}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(12).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(12).componentIndices;
used = blinkFiles{2}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(12).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(12).componentIndices;
used = blinkFiles{3}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(12).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(12);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{12};
bProperties = blinkProperties{12};
dataName = blinkFiles{1}(12).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset12';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 187;

n = 12; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 12
pause on;
n = 12;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(12).componentIndices;
used = blinkFiles{1}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(12).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(12).componentIndices;
used = blinkFiles{2}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(12).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(12).componentIndices;
used = blinkFiles{3}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(12).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(12);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{12};
bProperties = blinkProperties{12};
dataName = blinkFiles{1}(12).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset12';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 188;
endBatch = 374;

n = 12; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 12
pause on;
n = 12;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(12).componentIndices;
used = blinkFiles{1}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(12).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(12).componentIndices;
used = blinkFiles{2}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(12).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(12).componentIndices;
used = blinkFiles{3}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(12).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(12);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{12};
bProperties = blinkProperties{12};
dataName = blinkFiles{1}(12).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset12';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 375;
endBatch = 561;

n = 12; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 12
pause on;
n = 12;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(12).componentIndices;
used = blinkFiles{1}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(12).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(12).componentIndices;
used = blinkFiles{2}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(12).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(12).componentIndices;
used = blinkFiles{3}(12).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(12).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(12);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{12};
bProperties = blinkProperties{12};
dataName = blinkFiles{1}(12).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset12';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 562;
endBatch = 746;

n = 12; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 13
pause on;
n = 13;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706048);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(13).componentIndices;
used = blinkFiles{1}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(13).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(13).componentIndices;
used = blinkFiles{2}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(13).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(13).componentIndices;
used = blinkFiles{3}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(13).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(13);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{13};
bProperties = blinkProperties{13};
dataName = blinkFiles{1}(13).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset13';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 165;

n = 13; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 13
pause on;
n = 13;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706048);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(13).componentIndices;
used = blinkFiles{1}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(13).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(13).componentIndices;
used = blinkFiles{2}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(13).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(13).componentIndices;
used = blinkFiles{3}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(13).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(13);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{13};
bProperties = blinkProperties{13};
dataName = blinkFiles{1}(13).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset13';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 166;
endBatch = 330;

n = 13; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 13
pause on;
n = 13;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706048);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(13).componentIndices;
used = blinkFiles{1}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(13).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(13).componentIndices;
used = blinkFiles{2}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(13).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(13).componentIndices;
used = blinkFiles{3}(13).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(13).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(13);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{13};
bProperties = blinkProperties{13};
dataName = blinkFiles{1}(13).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset13';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 331;
endBatch = 493;

n = 13; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 14
pause on;
n = 14;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 715520);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(14).componentIndices;
used = blinkFiles{1}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(14).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(14).componentIndices;
used = blinkFiles{2}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(14).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(14).componentIndices;
used = blinkFiles{3}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(14).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(14);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{14};
bProperties = blinkProperties{14};
dataName = blinkFiles{1}(14).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset14';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 176;

n = 14; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 14
pause on;
n = 14;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 715520);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(14).componentIndices;
used = blinkFiles{1}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(14).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(14).componentIndices;
used = blinkFiles{2}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(14).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(14).componentIndices;
used = blinkFiles{3}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(14).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(14);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{14};
bProperties = blinkProperties{14};
dataName = blinkFiles{1}(14).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset14';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 177;
endBatch = 352;

n = 14; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 14
pause on;
n = 14;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 715520);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(14).componentIndices;
used = blinkFiles{1}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(14).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(14).componentIndices;
used = blinkFiles{2}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(14).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(14).componentIndices;
used = blinkFiles{3}(14).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(14).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(14);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{14};
bProperties = blinkProperties{14};
dataName = blinkFiles{1}(14).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset14';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 353;
endBatch = 527;

n = 14; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 15
pause on;
n = 15;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(15).componentIndices;
used = blinkFiles{1}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(15).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(15).componentIndices;
used = blinkFiles{2}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(15).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(15).componentIndices;
used = blinkFiles{3}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(15).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(15);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{15};
bProperties = blinkProperties{15};
dataName = blinkFiles{1}(15).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset15';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 164;

n = 15; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 15
pause on;
n = 15;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(15).componentIndices;
used = blinkFiles{1}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(15).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(15).componentIndices;
used = blinkFiles{2}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(15).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(15).componentIndices;
used = blinkFiles{3}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(15).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(15);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{15};
bProperties = blinkProperties{15};
dataName = blinkFiles{1}(15).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset15';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 165;
endBatch = 328;

n = 15; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 15
pause on;
n = 15;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(15).componentIndices;
used = blinkFiles{1}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(15).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(15).componentIndices;
used = blinkFiles{2}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(15).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(15).componentIndices;
used = blinkFiles{3}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(15).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(15);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{15};
bProperties = blinkProperties{15};
dataName = blinkFiles{1}(15).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset15';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 329;
endBatch = 492;

n = 15; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 15
pause on;
n = 15;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(15).componentIndices;
used = blinkFiles{1}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(15).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(15).componentIndices;
used = blinkFiles{2}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(15).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(15).componentIndices;
used = blinkFiles{3}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(15).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(15);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{15};
bProperties = blinkProperties{15};
dataName = blinkFiles{1}(15).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset15';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 493;
endBatch = 656;

n = 15; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 15
pause on;
n = 15;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(15).componentIndices;
used = blinkFiles{1}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(15).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(15).componentIndices;
used = blinkFiles{2}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(15).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(15).componentIndices;
used = blinkFiles{3}(15).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(15).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(15);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{15};
bProperties = blinkProperties{15};
dataName = blinkFiles{1}(15).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset15';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 657;
endBatch = 820;

n = 15; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 16
pause on;
n = 16;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 725760);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(16).componentIndices;
used = blinkFiles{1}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(16).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(16).componentIndices;
used = blinkFiles{2}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(16).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(16).componentIndices;
used = blinkFiles{3}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(16).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(16);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{16};
bProperties = blinkProperties{16};
dataName = blinkFiles{1}(16).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset16';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 174;

n = 16; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 16
pause on;
n = 16;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 725760);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(16).componentIndices;
used = blinkFiles{1}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(16).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(16).componentIndices;
used = blinkFiles{2}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(16).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(16).componentIndices;
used = blinkFiles{3}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(16).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(16);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{16};
bProperties = blinkProperties{16};
dataName = blinkFiles{1}(16).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset16';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 175;
endBatch = 348;

n = 16; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 16
pause on;
n = 16;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 725760);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(16).componentIndices;
used = blinkFiles{1}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(16).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(16).componentIndices;
used = blinkFiles{2}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(16).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(16).componentIndices;
used = blinkFiles{3}(16).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(16).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(16);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{16};
bProperties = blinkProperties{16};
dataName = blinkFiles{1}(16).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset16';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 349;
endBatch = 522;

n = 16; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 17
pause on;
n = 17;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(17).componentIndices;
used = blinkFiles{1}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(17).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(17).componentIndices;
used = blinkFiles{2}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(17).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(17).componentIndices;
used = blinkFiles{3}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(17).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(17);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{17};
bProperties = blinkProperties{17};
dataName = blinkFiles{1}(17).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset17';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 157;

n = 17; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 17
pause on;
n = 17;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(17).componentIndices;
used = blinkFiles{1}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(17).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(17).componentIndices;
used = blinkFiles{2}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(17).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(17).componentIndices;
used = blinkFiles{3}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(17).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(17);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{17};
bProperties = blinkProperties{17};
dataName = blinkFiles{1}(17).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset17';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 158;
endBatch = 314;

n = 17; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 17
pause on;
n = 17;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(17).componentIndices;
used = blinkFiles{1}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(17).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(17).componentIndices;
used = blinkFiles{2}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(17).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(17).componentIndices;
used = blinkFiles{3}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(17).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(17);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{17};
bProperties = blinkProperties{17};
dataName = blinkFiles{1}(17).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset17';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 315;
endBatch = 471;

n = 17; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 17
pause on;
n = 17;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(17).componentIndices;
used = blinkFiles{1}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(17).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(17).componentIndices;
used = blinkFiles{2}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(17).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(17).componentIndices;
used = blinkFiles{3}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(17).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(17);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{17};
bProperties = blinkProperties{17};
dataName = blinkFiles{1}(17).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset17';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 472;
endBatch = 628;

n = 17; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 17
pause on;
n = 17;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(17).componentIndices;
used = blinkFiles{1}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(17).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(17).componentIndices;
used = blinkFiles{2}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(17).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(17).componentIndices;
used = blinkFiles{3}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(17).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(17);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{17};
bProperties = blinkProperties{17};
dataName = blinkFiles{1}(17).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset17';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 629;
endBatch = 785;

n = 17; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 17
pause on;
n = 17;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710400);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(17).componentIndices;
used = blinkFiles{1}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(17).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(17).componentIndices;
used = blinkFiles{2}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(17).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(17).componentIndices;
used = blinkFiles{3}(17).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(17).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(17);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{17};
bProperties = blinkProperties{17};
dataName = blinkFiles{1}(17).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset17';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 786;
endBatch = 937;

n = 17; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 152;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 153;
endBatch = 304;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 305;
endBatch = 456;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 457;
endBatch = 608;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 609;
endBatch = 760;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 761;
endBatch = 912;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 913;
endBatch = 1064;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1065;
endBatch = 1216;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1217;
endBatch = 1368;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch9'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1369;
endBatch = 1520;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch10'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1521;
endBatch = 1672;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch11'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 18
pause on;
n = 18;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 706304);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(18).componentIndices;
used = blinkFiles{1}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(18).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(18).componentIndices;
used = blinkFiles{2}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(18).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(18).componentIndices;
used = blinkFiles{3}(18).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(18).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(18);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{18};
bProperties = blinkProperties{18};
dataName = blinkFiles{1}(18).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset18';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1673;
endBatch = 1813;

n = 18; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch12'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 156;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 157;
endBatch = 312;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 313;
endBatch = 468;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 469;
endBatch = 624;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 625;
endBatch = 780;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 781;
endBatch = 936;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 937;
endBatch = 1092;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1093;
endBatch = 1248;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1249;
endBatch = 1404;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch9'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1405;
endBatch = 1560;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch10'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1561;
endBatch = 1716;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch11'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 19
pause on;
n = 19;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708608);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(19).componentIndices;
used = blinkFiles{1}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(19).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(19).componentIndices;
used = blinkFiles{2}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(19).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(19).componentIndices;
used = blinkFiles{3}(19).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(19).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(19);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{19};
bProperties = blinkProperties{19};
dataName = blinkFiles{1}(19).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset19';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1717;
endBatch = 1871;

n = 19; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch12'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 20
pause on;
n = 20;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 730368);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(20).componentIndices;
used = blinkFiles{1}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(20).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(20).componentIndices;
used = blinkFiles{2}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(20).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(20).componentIndices;
used = blinkFiles{3}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(20).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(20);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{20};
bProperties = blinkProperties{20};
dataName = blinkFiles{1}(20).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset20';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 161;

n = 20; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 20
pause on;
n = 20;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 730368);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(20).componentIndices;
used = blinkFiles{1}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(20).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(20).componentIndices;
used = blinkFiles{2}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(20).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(20).componentIndices;
used = blinkFiles{3}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(20).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(20);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{20};
bProperties = blinkProperties{20};
dataName = blinkFiles{1}(20).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset20';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 162;
endBatch = 322;

n = 20; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 20
pause on;
n = 20;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 730368);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(20).componentIndices;
used = blinkFiles{1}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(20).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(20).componentIndices;
used = blinkFiles{2}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(20).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(20).componentIndices;
used = blinkFiles{3}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(20).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(20);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{20};
bProperties = blinkProperties{20};
dataName = blinkFiles{1}(20).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset20';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 323;
endBatch = 483;

n = 20; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 20
pause on;
n = 20;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 730368);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(20).componentIndices;
used = blinkFiles{1}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(20).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(20).componentIndices;
used = blinkFiles{2}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(20).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(20).componentIndices;
used = blinkFiles{3}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(20).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(20);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{20};
bProperties = blinkProperties{20};
dataName = blinkFiles{1}(20).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset20';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 484;
endBatch = 644;

n = 20; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 20
pause on;
n = 20;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 730368);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(20).componentIndices;
used = blinkFiles{1}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(20).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(20).componentIndices;
used = blinkFiles{2}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(20).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(20).componentIndices;
used = blinkFiles{3}(20).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(20).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(20);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{20};
bProperties = blinkProperties{20};
dataName = blinkFiles{1}(20).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset20';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 645;
endBatch = 802;

n = 20; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 157;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 158;
endBatch = 314;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 315;
endBatch = 471;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 472;
endBatch = 628;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 629;
endBatch = 785;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 786;
endBatch = 942;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 943;
endBatch = 1099;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 21
pause on;
n = 21;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 708864);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(21).componentIndices;
used = blinkFiles{1}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(21).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(21).componentIndices;
used = blinkFiles{2}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(21).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(21).componentIndices;
used = blinkFiles{3}(21).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(21).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(21);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{21};
bProperties = blinkProperties{21};
dataName = blinkFiles{1}(21).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset21';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1100;
endBatch = 1255;

n = 21; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 22
pause on;
n = 22;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 752896);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(22).componentIndices;
used = blinkFiles{1}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(22).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(22).componentIndices;
used = blinkFiles{2}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(22).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(22).componentIndices;
used = blinkFiles{3}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(22).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(22);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{22};
bProperties = blinkProperties{22};
dataName = blinkFiles{1}(22).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset22';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 170;

n = 22; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 22
pause on;
n = 22;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 752896);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(22).componentIndices;
used = blinkFiles{1}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(22).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(22).componentIndices;
used = blinkFiles{2}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(22).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(22).componentIndices;
used = blinkFiles{3}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(22).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(22);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{22};
bProperties = blinkProperties{22};
dataName = blinkFiles{1}(22).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset22';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 171;
endBatch = 340;

n = 22; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 22
pause on;
n = 22;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 752896);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(22).componentIndices;
used = blinkFiles{1}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(22).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(22).componentIndices;
used = blinkFiles{2}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(22).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(22).componentIndices;
used = blinkFiles{3}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(22).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(22);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{22};
bProperties = blinkProperties{22};
dataName = blinkFiles{1}(22).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset22';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 341;
endBatch = 510;

n = 22; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 22
pause on;
n = 22;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 752896);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(22).componentIndices;
used = blinkFiles{1}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(22).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(22).componentIndices;
used = blinkFiles{2}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(22).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(22).componentIndices;
used = blinkFiles{3}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(22).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(22);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{22};
bProperties = blinkProperties{22};
dataName = blinkFiles{1}(22).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset22';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 511;
endBatch = 680;

n = 22; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 22
pause on;
n = 22;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 752896);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(22).componentIndices;
used = blinkFiles{1}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(22).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(22).componentIndices;
used = blinkFiles{2}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(22).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(22).componentIndices;
used = blinkFiles{3}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(22).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(22);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{22};
bProperties = blinkProperties{22};
dataName = blinkFiles{1}(22).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset22';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 681;
endBatch = 850;

n = 22; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 22
pause on;
n = 22;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 752896);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(22).componentIndices;
used = blinkFiles{1}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(22).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(22).componentIndices;
used = blinkFiles{2}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(22).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(22).componentIndices;
used = blinkFiles{3}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(22).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(22);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{22};
bProperties = blinkProperties{22};
dataName = blinkFiles{1}(22).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset22';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 851;
endBatch = 1020;

n = 22; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 22
pause on;
n = 22;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 752896);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(22).componentIndices;
used = blinkFiles{1}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(22).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(22).componentIndices;
used = blinkFiles{2}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(22).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(22).componentIndices;
used = blinkFiles{3}(22).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(22).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(22);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{22};
bProperties = blinkProperties{22};
dataName = blinkFiles{1}(22).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset22';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1021;
endBatch = 1186;

n = 22; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 23
pause on;
n = 23;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 716544);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(23).componentIndices;
used = blinkFiles{1}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(23).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(23).componentIndices;
used = blinkFiles{2}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(23).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(23).componentIndices;
used = blinkFiles{3}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(23).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(23);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{23};
bProperties = blinkProperties{23};
dataName = blinkFiles{1}(23).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset23';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 168;

n = 23; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 23
pause on;
n = 23;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 716544);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(23).componentIndices;
used = blinkFiles{1}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(23).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(23).componentIndices;
used = blinkFiles{2}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(23).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(23).componentIndices;
used = blinkFiles{3}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(23).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(23);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{23};
bProperties = blinkProperties{23};
dataName = blinkFiles{1}(23).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset23';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 169;
endBatch = 336;

n = 23; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 23
pause on;
n = 23;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 716544);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(23).componentIndices;
used = blinkFiles{1}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(23).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(23).componentIndices;
used = blinkFiles{2}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(23).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(23).componentIndices;
used = blinkFiles{3}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(23).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(23);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{23};
bProperties = blinkProperties{23};
dataName = blinkFiles{1}(23).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset23';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 337;
endBatch = 504;

n = 23; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 23
pause on;
n = 23;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 716544);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(23).componentIndices;
used = blinkFiles{1}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(23).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(23).componentIndices;
used = blinkFiles{2}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(23).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(23).componentIndices;
used = blinkFiles{3}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(23).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(23);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{23};
bProperties = blinkProperties{23};
dataName = blinkFiles{1}(23).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset23';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 505;
endBatch = 672;

n = 23; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 23
pause on;
n = 23;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 716544);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(23).componentIndices;
used = blinkFiles{1}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(23).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(23).componentIndices;
used = blinkFiles{2}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(23).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(23).componentIndices;
used = blinkFiles{3}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(23).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(23);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{23};
bProperties = blinkProperties{23};
dataName = blinkFiles{1}(23).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset23';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 673;
endBatch = 840;

n = 23; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 23
pause on;
n = 23;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 716544);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(23).componentIndices;
used = blinkFiles{1}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(23).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(23).componentIndices;
used = blinkFiles{2}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(23).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(23).componentIndices;
used = blinkFiles{3}(23).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(23).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(23);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{23};
bProperties = blinkProperties{23};
dataName = blinkFiles{1}(23).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset23';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 841;
endBatch = 1004;

n = 23; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 154;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 155;
endBatch = 308;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 309;
endBatch = 462;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 463;
endBatch = 616;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 617;
endBatch = 770;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 771;
endBatch = 924;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 925;
endBatch = 1078;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch7'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1079;
endBatch = 1232;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch8'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 24
pause on;
n = 24;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704000);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(24).componentIndices;
used = blinkFiles{1}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(24).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(24).componentIndices;
used = blinkFiles{2}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(24).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(24).componentIndices;
used = blinkFiles{3}(24).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(24).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(24);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{24};
bProperties = blinkProperties{24};
dataName = blinkFiles{1}(24).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset24';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1233;
endBatch = 1383;

n = 24; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch9'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 25
pause on;
n = 25;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710656);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(25).componentIndices;
used = blinkFiles{1}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(25).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(25).componentIndices;
used = blinkFiles{2}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(25).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(25).componentIndices;
used = blinkFiles{3}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(25).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(25);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{25};
bProperties = blinkProperties{25};
dataName = blinkFiles{1}(25).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset25';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 170;

n = 25; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 25
pause on;
n = 25;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710656);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(25).componentIndices;
used = blinkFiles{1}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(25).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(25).componentIndices;
used = blinkFiles{2}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(25).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(25).componentIndices;
used = blinkFiles{3}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(25).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(25);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{25};
bProperties = blinkProperties{25};
dataName = blinkFiles{1}(25).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset25';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 171;
endBatch = 340;

n = 25; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 25
pause on;
n = 25;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710656);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(25).componentIndices;
used = blinkFiles{1}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(25).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(25).componentIndices;
used = blinkFiles{2}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(25).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(25).componentIndices;
used = blinkFiles{3}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(25).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(25);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{25};
bProperties = blinkProperties{25};
dataName = blinkFiles{1}(25).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset25';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 341;
endBatch = 510;

n = 25; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 25
pause on;
n = 25;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 710656);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(25).componentIndices;
used = blinkFiles{1}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(25).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(25).componentIndices;
used = blinkFiles{2}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(25).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(25).componentIndices;
used = blinkFiles{3}(25).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(25).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(25);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{25};
bProperties = blinkProperties{25};
dataName = blinkFiles{1}(25).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset25';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 511;
endBatch = 679;

n = 25; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 26
pause on;
n = 26;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 711168);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(26).componentIndices;
used = blinkFiles{1}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(26).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(26).componentIndices;
used = blinkFiles{2}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(26).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(26).componentIndices;
used = blinkFiles{3}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(26).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(26);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{26};
bProperties = blinkProperties{26};
dataName = blinkFiles{1}(26).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset26';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 162;

n = 26; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 26
pause on;
n = 26;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 711168);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(26).componentIndices;
used = blinkFiles{1}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(26).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(26).componentIndices;
used = blinkFiles{2}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(26).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(26).componentIndices;
used = blinkFiles{3}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(26).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(26);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{26};
bProperties = blinkProperties{26};
dataName = blinkFiles{1}(26).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset26';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 163;
endBatch = 324;

n = 26; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 26
pause on;
n = 26;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 711168);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(26).componentIndices;
used = blinkFiles{1}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(26).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(26).componentIndices;
used = blinkFiles{2}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(26).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(26).componentIndices;
used = blinkFiles{3}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(26).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(26);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{26};
bProperties = blinkProperties{26};
dataName = blinkFiles{1}(26).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset26';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 325;
endBatch = 486;

n = 26; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 26
pause on;
n = 26;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 711168);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(26).componentIndices;
used = blinkFiles{1}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(26).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(26).componentIndices;
used = blinkFiles{2}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(26).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(26).componentIndices;
used = blinkFiles{3}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(26).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(26);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{26};
bProperties = blinkProperties{26};
dataName = blinkFiles{1}(26).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset26';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 487;
endBatch = 648;

n = 26; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 26
pause on;
n = 26;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 711168);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(26).componentIndices;
used = blinkFiles{1}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(26).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(26).componentIndices;
used = blinkFiles{2}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(26).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(26).componentIndices;
used = blinkFiles{3}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(26).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(26);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{26};
bProperties = blinkProperties{26};
dataName = blinkFiles{1}(26).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset26';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 649;
endBatch = 810;

n = 26; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 26
pause on;
n = 26;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 711168);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(26).componentIndices;
used = blinkFiles{1}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(26).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(26).componentIndices;
used = blinkFiles{2}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(26).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(26).componentIndices;
used = blinkFiles{3}(26).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(26).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(26);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{26};
bProperties = blinkProperties{26};
dataName = blinkFiles{1}(26).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset26';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 811;
endBatch = 968;

n = 26; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 27
pause on;
n = 27;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 847872);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(27).componentIndices;
used = blinkFiles{1}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(27).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(27).componentIndices;
used = blinkFiles{2}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(27).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(27).componentIndices;
used = blinkFiles{3}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(27).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(27);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{27};
bProperties = blinkProperties{27};
dataName = blinkFiles{1}(27).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset27';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 170;

n = 27; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 27
pause on;
n = 27;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 847872);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(27).componentIndices;
used = blinkFiles{1}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(27).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(27).componentIndices;
used = blinkFiles{2}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(27).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(27).componentIndices;
used = blinkFiles{3}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(27).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(27);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{27};
bProperties = blinkProperties{27};
dataName = blinkFiles{1}(27).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset27';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 171;
endBatch = 340;

n = 27; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 27
pause on;
n = 27;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 847872);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(27).componentIndices;
used = blinkFiles{1}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(27).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(27).componentIndices;
used = blinkFiles{2}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(27).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(27).componentIndices;
used = blinkFiles{3}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(27).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(27);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{27};
bProperties = blinkProperties{27};
dataName = blinkFiles{1}(27).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset27';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 341;
endBatch = 510;

n = 27; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 27
pause on;
n = 27;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 847872);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(27).componentIndices;
used = blinkFiles{1}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(27).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(27).componentIndices;
used = blinkFiles{2}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(27).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(27).componentIndices;
used = blinkFiles{3}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(27).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(27);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{27};
bProperties = blinkProperties{27};
dataName = blinkFiles{1}(27).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset27';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 511;
endBatch = 680;

n = 27; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 27
pause on;
n = 27;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 847872);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(27).componentIndices;
used = blinkFiles{1}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(27).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(27).componentIndices;
used = blinkFiles{2}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(27).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(27).componentIndices;
used = blinkFiles{3}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(27).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(27);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{27};
bProperties = blinkProperties{27};
dataName = blinkFiles{1}(27).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset27';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 681;
endBatch = 850;

n = 27; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 27
pause on;
n = 27;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 847872);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(27).componentIndices;
used = blinkFiles{1}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(27).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(27).componentIndices;
used = blinkFiles{2}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(27).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(27).componentIndices;
used = blinkFiles{3}(27).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(27).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(27);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{27};
bProperties = blinkProperties{27};
dataName = blinkFiles{1}(27).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset27';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 851;
endBatch = 1017;

n = 27; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch6'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 28
pause on;
n = 28;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704256);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(28).componentIndices;
used = blinkFiles{1}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(28).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(28).componentIndices;
used = blinkFiles{2}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(28).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(28).componentIndices;
used = blinkFiles{3}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(28).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(28);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{28};
bProperties = blinkProperties{28};
dataName = blinkFiles{1}(28).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset28';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 169;

n = 28; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 28
pause on;
n = 28;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704256);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(28).componentIndices;
used = blinkFiles{1}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(28).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(28).componentIndices;
used = blinkFiles{2}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(28).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(28).componentIndices;
used = blinkFiles{3}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(28).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(28);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{28};
bProperties = blinkProperties{28};
dataName = blinkFiles{1}(28).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset28';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 170;
endBatch = 338;

n = 28; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 28
pause on;
n = 28;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704256);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(28).componentIndices;
used = blinkFiles{1}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(28).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(28).componentIndices;
used = blinkFiles{2}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(28).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(28).componentIndices;
used = blinkFiles{3}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(28).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(28);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{28};
bProperties = blinkProperties{28};
dataName = blinkFiles{1}(28).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset28';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 339;
endBatch = 507;

n = 28; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 28
pause on;
n = 28;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704256);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(28).componentIndices;
used = blinkFiles{1}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(28).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(28).componentIndices;
used = blinkFiles{2}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(28).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(28).componentIndices;
used = blinkFiles{3}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(28).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(28);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{28};
bProperties = blinkProperties{28};
dataName = blinkFiles{1}(28).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset28';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 508;
endBatch = 676;

n = 28; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch4'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 28
pause on;
n = 28;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 704256);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(28).componentIndices;
used = blinkFiles{1}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(28).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(28).componentIndices;
used = blinkFiles{2}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(28).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(28).componentIndices;
used = blinkFiles{3}(28).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(28).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(28);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{28};
bProperties = blinkProperties{28};
dataName = blinkFiles{1}(28).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset28';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 677;
endBatch = 842;

n = 28; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch5'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 29
pause on;
n = 29;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 550656);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(29).componentIndices;
used = blinkFiles{1}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(29).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(29).componentIndices;
used = blinkFiles{2}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(29).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(29).componentIndices;
used = blinkFiles{3}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(29).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(29);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{29};
bProperties = blinkProperties{29};
dataName = blinkFiles{1}(29).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset29';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 1;
endBatch = 180;

n = 29; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch1'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 29
pause on;
n = 29;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 550656);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(29).componentIndices;
used = blinkFiles{1}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(29).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(29).componentIndices;
used = blinkFiles{2}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(29).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(29).componentIndices;
used = blinkFiles{3}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(29).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(29);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{29};
bProperties = blinkProperties{29};
dataName = blinkFiles{1}(29).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset29';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 181;
endBatch = 360;

n = 29; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch2'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause


%% Code for dataset 29
pause on;
n = 29;
blinkDir = 'O:\ARL_Data\BCITBlinks';
experiment = 'Experiment X2 Traffic Complexity';
blinkFiles = cell(3, 1);
blinkTypes = cell(3, 1);
blinkTraces = zeros(3, 550656);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewIC.mat');
blinkFiles{1} = blinks;
blinkTypes{1} = 'IC';
componentIndices = blinkFiles{1}(29).componentIndices;
used = blinkFiles{1}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{1}(29).blinkComponents;
blinkTraces(1, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewChannel.mat');
blinkFiles{2} = blinks;
blinkTypes{2} = 'Channel';
componentIndices = blinkFiles{2}(29).componentIndices;
used = blinkFiles{2}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{2}(29).blinkComponents;
blinkTraces(2, :) = components(used, :);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewEOG.mat');
blinkFiles{3} = blinks;
blinkTypes{3} = 'EOG';
componentIndices = blinkFiles{3}(29).componentIndices;
used = blinkFiles{3}(29).usedComponent;
used = find(componentIndices == used, 1, 'first');
components = blinkFiles{3}(29).blinkComponents;
blinkTraces(3, :) = components(used, :);
dBlinks = blinkFiles{1}(29);
load('O:\ARL_Data\BCITBlinks\Experiment X2 Traffic ComplexityBlinksNewPropertiesIC.mat');
bFits = blinkFits{29};
bProperties = blinkProperties{29};
dataName = blinkFiles{1}(29).fileName;
[~, dataName] = fileparts(dataName);
thisOutputDir = 'O:\ARL_Data\BCITOutput\Experiment X2 Traffic ComplexityDataset29';
if ~exist(thisOutputDir, 'dir')
   mkdir(thisOutputDir);
end
startBatch = 361;
endBatch = 538;

n = 29; %#ok<NASGU>
scriptName = 'plotBlinkScript';
publish_options.outputDir = [thisOutputDir filesep scriptName 'Batch3'];
publish_options.format = 'html';
if exist(publish_options.outputDir, 'dir') == 0
   mkdir(publish_options.outputDir);
end;
plotBlinkScript;
pause

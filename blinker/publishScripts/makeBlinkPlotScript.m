
%% Create the script file
function [] = makeBlinkPlotScript(experiment, datasetName, blinkTypes, ...
                   blinkDir, scriptDir, outputDir, batchSize, publishOn)
               
scriptName = ['publishBlinks' experiment datasetName '.m'];
fid = fopen([scriptDir filesep scriptName], 'w');

%% Load the data blinks
blinkFiles = cell(length(blinkTypes), 1);
blinkFileNames = cell(length(blinkTypes), 1);
blinkFits = cell(length(blinkTypes), 1);
blinkProperties = cell(length(blinkTypes), 1);
for t = 1:length(blinkTypes)
    theName = [experiment 'DatasetBlinks' blinkTypes{t} datasetName '.mat'];
    blinkFileNames{t} = [blinkDir filesep theName];
    load(blinkFileNames{t});
    blinkFiles{t} = dBlinks;
    blinkFits{t} = dFits{1};
    blinkProperties{t} = dProperties{1};
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
    numberBatches = max(1, floor(numberBlinks/batchSize));
    adjustedBatchSize = ceil(numberBlinks/numberBatches);
    startBatch = 1;
    for j = 1:numberBatches
        endBatch = min(numberBlinks, startBatch + adjustedBatchSize - 1);
        traceLength = size(dBlinks.blinkComponents, 2);
        
        fprintf(fid, '\n\n%%%% Code for dataset %g\n', n);
        fprintf(fid, 'pause on;\n');
        fprintf(fid, 'n = %d;\n', n);
        %fprintf(fid, 'blinkDir = ''%s'';\n', blinkDir');
        %fprintf(fid, 'experiment = ''%s'';\n', experiment);
        fprintf(fid, 'blinkFiles = cell(%d, 1);\n', length(blinkTypes));
        fprintf(fid, 'blinkFits = cell(%d, 1);\n', length(blinkTypes));
        fprintf(fid, 'blinkProperties = cell(%d, 1);\n', length(blinkTypes));
%         fprintf(fid, 'blinkTypes = cell(%d, 1);\n', length(blinkTypes));
        fprintf(fid,  'blinkTraces = zeros(%d, %d);\n', ...
                      length(blinkTypes), traceLength);
        for t = 1:length(blinkTypes)
            fprintf(fid, 'load(''%s'');\n', blinkFileNames{t});
            fprintf(fid, 'blinkFiles{%d} = dBlinks;\n', t);
            fprintf(fid, 'blinkFits{%d} = dFits{1};\n', t);
            fprintf(fid, 'blinkProperties{%d} = dProperties{1};\n', t);
            fprintf(fid, 'blinkTypes{%d} = ''%s'';\n', t, blinkTypes{t});
            fprintf(fid, 'componentIndices = blinkFiles{%d}(%d).componentIndices;\n', t, n);
            fprintf(fid, 'used = blinkFiles{%d}(%d).usedComponent;\n', t, n);
            fprintf(fid, 'used = find(componentIndices == used, 1, ''first'');\n');
            fprintf(fid, 'components = blinkFiles{%d}(%d).blinkComponents;\n', t, n);
            fprintf(fid, 'blinkTraces(%d, :) = components(used, :);\n', t);
        end
        fprintf(fid, 'dBlinks = blinkFiles{1};\n');
        fprintf(fid, 'dProperties = blinkProperties{1};\n');
        fprintf(fid, 'dFits = blinkFits{1};\n');
        [~, dataName] = fileparts(blinkFiles{1}(n).fileName);
        fprintf(fid, 'dataName = blinkFiles{1}(%d).fileName;\n', n);
        fprintf(fid, '[~, dataName] = fileparts(dataName);\n');
        fprintf(fid, 'thisOutputDir = ''%s%s%sDataset%s_%d'';\n', ...
            outputDir, filesep, experiment, dataName, n);
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
            %fprintf(fid, 'pause\n');
        else
            fprintf(fid, 'plotBlinkScript;\n');
            fprintf(fid, 'pause\n');
        end
        
        startBatch = startBatch + adjustedBatchSize;
    end
end
fclose(fid);

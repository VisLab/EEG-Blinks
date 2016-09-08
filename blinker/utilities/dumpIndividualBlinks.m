function [] = dumpIndividualBlinks(blinks, blinkFits, blinkTraces, ...
                      traceNames, outDir, corrThreshold)
%% Plot individual blinks with overlaid traces, creating images and index.
% 
% Parameters:
%     blinks      blinks structure for the dataset
%     blinkFits   blinkFit structure for the dataset
%     blinkTraces m x n array of m signals of n frames
%     traceNames  m cell arrays with names of traces for legends
%     outDir      directory in which the images and index file are dumped
%     corrThreshold  threshold for linear fits for "prototypical" blink
%
% This function creates an HTML index file for viewing all of the images
% on a single page.
%
% Written by:  Kay Robbins, 2016, UTSA

%% Set up the counts for plotting
startBlinks = cellfun(@double, {blinkFits.leftZero});
endBlinks = cellfun(@double, {blinkFits.rightZero});
extendSeconds = 0.5;   % Maximum seconds to extend on either side of blink
extendFrames = round(extendSeconds*blinks.srate);
preLimits = max(startBlinks - extendFrames, 1);
postLimits = min(endBlinks + extendFrames, size(blinkTraces, 2));

%% Create the plot directories
if ~exist(outDir, 'dir')
    mkdir(outDir);
end
dataName = blinks.uniqueName;
dataDir = [outDir filesep dataName];
if ~exist(dataDir, 'dir')
    mkdir(dataDir);
end

%% Open the index file
fid = fopen([dataDir filesep 'index.html'], 'w');
fprintf(fid, '<h1>%s</h1>\n', blinks.fileName);
fprintf(fid, '<ol>\n');
for k = 1:length(preLimits)
    figHan = plotBlinkFit(num2str(k), dataName, blinks.srate, ...
        blinkTraces, traceNames, blinkFits(k), ...
        preLimits(k), postLimits(k), corrThreshold);
    fileName = [dataName num2str(k) '.png'];
    saveas(figHan, [dataDir filesep fileName], 'png');
    close(figHan);
    fprintf(fid, '<li><img src="%s" alt="%s"></li>\n', fileName, dataName);
end
fprintf(fid, '</ol>\n');
fclose(fid);

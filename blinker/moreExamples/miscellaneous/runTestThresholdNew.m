%% Setup
correlationThresholdTop = 0.98;
correlationThresholdBottom = 0.90; 
correlationThresholdMiddle = 0.95;
dumpWeb = true;
maxAmp = 600;
%% BCIT Examples
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinks';
type = 'EOGUnrefNew';

%% Shooter Examples
% experiment = 'Shooter';
% blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
% type = 'EOGUnref';
% type = 'ChannelUnref';

%% NCTU blinks
% blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
% experiment = 'NCTU_LK';
% type = 'Channel';

%% BCI2000 blinks
% type = 'Channel';
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';

%% DREAMS
% type = 'EOGMast';
% experiment = 'Dreams';
% blinkDir = 'E:\CTADATA\WholeNightDreams\data\blinks';

%% Read in the blink data for this collection
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkPropertiesFile = [experiment 'BlinksNewProperties' type '.mat'];
%load([blinkDir filesep blinkFile]);
% load([blinkDir filesep blinkPropertiesFile]);

%% Open the index file
indexFile = [experiment type 'maxFrameDist.html'];
if dumpWeb
    fid = fopen(indexFile, 'w'); 
else
    fid = 1; %#ok<UNRCH>
end
fprintf(fid, '<h1>Experiment %s Type %s</h1>\n', experiment, type);
fprintf(fid, '<p>Top correlation: %d   Bottom correlation: %d</p>\n', ...
        correlationThresholdTop, correlationThresholdBottom);
%% Process the data
splitCount = 0;
for k = 1:length(blinks)
    if isnan(blinks(k).usedSignal)
        fprintf(fid, '<p>%d: %s has no blinks</p>\n', k, blinks(k).fileName);
        continue;
    end
%% test the threshold
   dFits = blinkFits{k};
   maxValues = cell2mat({dFits.maxValue});
  
   goodMaskTop = getGoodBlinkMask(dFits, correlationThresholdTop);

   goodMaskBottom = getGoodBlinkMask(dFits, correlationThresholdBottom);
   leftR2 = {dFits.leftR2};
   rightR2 = {dFits.rightR2};
   indicesNaN = cellfun(@isnan, leftR2) | cellfun(@isnan, rightR2);
   leftR2 = cellfun(@double, leftR2);
   rightR2 = cellfun(@double, rightR2);
   goodMaskMiddle = ~indicesNaN & goodMaskBottom & ...
         leftR2 > correlationThresholdMiddle & ...
         rightR2 > correlationThresholdMiddle;
   bestValues = maxValues(goodMaskTop);
   worstValues = maxValues(~goodMaskBottom);
   middleGoodValues = maxValues(goodMaskMiddle);
   middleBadValues = maxValues(~goodMaskMiddle);
   if isempty(worstValues)
       fprintf(fid, '<p>%d: %s has no worst blinks</p>\n', k, blinks(k).fileName);
       continue;
   elseif isempty(bestValues)
       fprintf(fid, '<p>%d: %s has no best blinks</p>\n', k, blinks(k).fileName);
       continue;  
   end
   %% Compute the nominal cutoff
   
   bestMedian = nanmedian(bestValues);
   bestMean = nanmean(bestValues);
   bestStd = nanstd(bestValues);
   bestRobustStd = 1.4826*mad(bestValues, 1);
   worstMedian = nanmedian(worstValues);
   worstMean = nanmean(worstValues);
   worstStd = nanstd(worstValues);
   worstRobustStd = 1.4826*mad(worstValues, 1);
   overallMedian = nanmedian(maxValues);
   overallMean = nanmean(maxValues);
   overallStd = nanmean(maxValues);
   overallRobustStd = 1.4826*mad(maxValues, 1);
   cutoff = (bestMedian*worstRobustStd + worstMedian*bestRobustStd)/...
            (bestRobustStd + worstRobustStd);
        
   isnanMask = isnan(maxValues);
   bestValues = maxValues(goodMaskTop & ~isnanMask);
   worstValues = maxValues(~goodMaskBottom & ~isnanMask);
   maxValues = maxValues(~isnanMask);
   leftOvers = [];
   if (worstMedian + worstRobustStd) <= cutoff && ...
      (bestMedian - bestRobustStd) >= cutoff
      labelColor = [1, 0, 0];
      splitCount = splitCount + 1;
      fprintf('%d: %s split\n', k, blinks(k).fileName);
   elseif worstMedian > bestMedian
      labelColor = [1, 0, 1];
   else
      labelColor = [0, 0, 0];
   end
   propMaskA =  ~indicesNaN & goodMaskBottom & ...
                maxValues >= bestMedian - 2*bestRobustStd & ...
                maxValues <= bestMedian + 2*bestRobustStd;
   propMaskB = propMaskA & ...
            leftR2 > correlationThresholdMiddle & ...
            rightR2 > correlationThresholdMiddle;
%% Now compute the histograms
   nbins = max(20, sqrt(length(maxValues)));
   xmin = min(maxValues);
   xmax = prctile(maxValues, 98);
   %xmax = min(maxAmp, xmax);
   if min(worstValues) >= max(bestValues)
       fprintf(fid, ['<p>%d, %s has bad blinks above good blinks: ' ...
           ' xmin: %g xmax: %g</p>\n'], k, blinks(k).fileName, ...
           min(worstValues), max(bestValues));
       fprintf(fid, '<p>Overall:[%g, %g], Best:[%g, %g], Worst: [%g, %g], Cutoff:%g</p>\n', ...
           overallMean, overallStd, bestMean, bestStd, worstMean, worstStd, cutoff);
       continue;
   end
   
   xhist = linspace(xmin, xmax, nbins);
   [n1, x1] = hist(bestValues, xhist);
   [n2, x2] = hist(worstValues, xhist);
   [n3, x3] = hist(maxValues, xhist);
   [n4, x4] = hist(middleGoodValues, xhist);
   [n5, x5] = hist(middleBadValues, xhist);
   [n6, x6] = hist(maxValues(propMaskA), xhist);
   [n7, x7] = hist(maxValues(propMaskB), xhist);
   theTitle = {[num2str(k) ': ' blinks(k).uniqueName ' ' blinks(k).type ...
       ' Cutoff = ' num2str(cutoff)]; ...
       ['Overall (' num2str(length(maxValues)) ' blinks): [(' ...
             num2str(overallMean) ', ' num2str(overallStd) ')' ...
         '(' num2str(overallMedian) ', ' num2str(overallRobustStd) ')]']; ...
       ['Best (' num2str(length(bestValues)) ' blinks): [(' ...
             num2str(bestMean) ', ' num2str(bestStd) ')' ...
         '(' num2str(bestMedian) ', ' num2str(bestRobustStd) ')]']; ...
        ['Worst (' num2str(length(worstValues)) ' blinks): [(' ...
           num2str(worstMean) ', ' num2str(worstStd) ')' ...
        '(' num2str(worstMedian) ', ' num2str(worstRobustStd) ')]']};             
   h = figure('Color', [1, 1, 1], 'Name', theTitle{1});
   hold on
 
   plot(x5, n5, 'Color', [0.85, 0.85, 0.85], 'LineWidth', 2)
   plot(x6, n6, 'Color', [0.3, 0.3, 0.85], 'LineWidth', 2, 'LineStyle', '--')
   plot(x7, n7, 'Color', [0.3, 0.85, 0.3], 'LineWidth', 2, 'LineStyle', '--')
   plot(x4, n4, 'Color', [0.7, 0.7, 0.7], 'LineStyle', '--')
   plot(x1, n1, 'k-')
   plot(x2, n2, 'r-')
   plot(x3, n3, 'g-')
   legend( '<0.95', 'PropA', 'PropB', '>0.95','>0.98', '<0.9', 'All');
   
   xlabel('Blink max amplitude')
   ylabel('Count')
   yLimits = get(gca, 'YLim');
   line([cutoff, cutoff], [0, yLimits(2)], 'LineStyle', ...
         '-', 'Color', [0.8, 0.8, 0.8]);
   line([bestMedian, bestMedian], ...
       [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
   line([bestMedian + 2*bestRobustStd, bestMedian + 2*bestRobustStd], ...
       [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
   line([bestMedian - 2*bestRobustStd, bestMedian - 2*bestRobustStd], ...
       [0, yLimits(2)], 'LineStyle', '--', 'Color', [0.6, 0.6, 0.85]);
   hold off
   title(theTitle, 'Interpreter', 'None', 'Color', labelColor);
   box on
   [thePath, theName, theExt] = fileparts(blinks(k).fileName);
   
   if dumpWeb
      fileName = [theName '.png'];
      saveas(gcf, fileName, 'png');
      fprintf(fid, '<p><img src=''%s''  alt=''%s''/></p>\n', fileName, theName);
   else
      fileName = [theName '.fig'];
      saveas(gcf, fileName, 'fig');
   end
   
   close(gcf);
end  
fclose(fid);
fprintf('Number of split files %d\n', splitCount);
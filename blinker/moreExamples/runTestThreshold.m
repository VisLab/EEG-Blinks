blinkDir = 'O:\ARL_Data\BCITBlinkOutput\data';
blinkFile = 'BCITLevel0DatasetBlinksEOGUnrefS2019_T2X2_R1';
load([blinkDir filesep blinkFile]);

%% test the threshold
maxValues = cell2mat({dFits{1}.maxValue});
correlationThresholdTop = 0.98;
goodMaskTop = getGoodBlinkMask(dFits{1}, correlationThresholdTop);
correlationThresholdBottom = 0.90;
goodMaskBottom = getGoodBlinkMask(dFits{1}, correlationThresholdBottom);
bestValues = maxValues(goodMaskTop);
worstValues = maxValues(~goodMaskBottom);

%%
nbins = 20;
xmin = min(worstValues);
xmax = max(bestValues);
xhist = linspace(xmin, xmax, nbins);
[n1, x1] = hist(bestValues, xhist);
[n2, x2] = hist(worstValues, xhist);
[n3, x3] = hist(maxValues, xhist);
figure
hold on
plot(x1, n1, 'k-')
plot(x2, n2, 'r-')
plot(x3, n3, 'g-')
legend('Best blinks', 'Worst blinks', 'All blinks')
xlabel('Blink max amplitude')
ylabel('Count')
hold off
title('EOGUnrefS2019_T2X2');
%%
meanBest = mean(bestValues);
stdBest = std(bestValues);
meanWorst = mean(worstValues);
stdWorst = std(worstValues);
%%
cutoff = (meanBest*stdWorst + meanWorst*stdBest)./(stdBest + stdWorst);

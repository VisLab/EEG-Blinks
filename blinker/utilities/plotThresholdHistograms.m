function [] = plotThresholdHistograms(signal, srate, thresholds, titleBase)

correlationThresholdBottom = 0.90;
%% test the threshold
numberThresholds = length(thresholds);
values = cell(numberThresholds, 1);
maxHist = -inf;
minHist = inf;
maxNumber = -inf;
for k = 1:numberThresholds
    blinkPositions = getBlinkPositions(signal, srate, thresholds(k));
    maxNumber = max(maxNumber, size(blinkPositions, 2));
    [~, dFits] = extractBlinkProperties(signal, blinkPositions, srate);
    maxValues = {dFits.maxValue};
    indicesNaN = cellfun(@isnan, maxValues);
    goodMask = getGoodBlinkMask(dFits, correlationThresholdBottom);
    goodValues = maxValues(~indicesNaN & goodMask);
    allValues = maxValues(~indicesNaN);
    values{k}.all = cellfun(@double, allValues);
    values{k}.good = cellfun(@double, goodValues);
    maxHist = max(maxHist, max(values{k}.all));
    maxHist = max(maxHist, max(values{k}.good));
    minHist = min(minHist, min(values{k}.all));
    minHist = min(minHist, min(values{k}.good));
end

%% Now compute the histograms
theColors = jet(2*numberThresholds);
nbins = max(20, sqrt(maxNumber));
xhist = linspace(minHist, prctile(maxHist, 98), nbins);
figure('Color', [1, 1, 1], 'Name', titleBase);
theLegends = cell(1, 2*numberThresholds);
hold on
for k = 1:numberThresholds
    [n1, x1] = hist(values{k}.all, xhist);
    [n2, x2] = hist(values{k}.good, xhist);
    
    plot(x1, n1, 'Color', theColors(2*k-1, :), 'LineWidth', 1)
    plot(x2, n2, 'Color', theColors(2*k, :), 'LineWidth', 2, 'LineStyle', '--')
    
    theLegends{2*k - 1} = [num2str(thresholds(k)) ' all'];
    theLegends{2*k} = [num2str(thresholds(k)) ' good'];
end
xlabel('Blink max amplitude')
ylabel('Count')

hold off
title(titleBase, 'Interpreter', 'None');
box on
legend(theLegends);

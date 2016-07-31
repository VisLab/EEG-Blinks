%% 
pop_editoptions('option_single', false, 'option_savetwofiles', false);

%% Set up the files
organizationType = 'BCIT';
collectionType = 'FILES';
experiment = 'BCITLevel0';
type = 'ChannelUnrefNew';
blinkDir = 'O:\ARL_Data\BCITBlinks';
%% Set up files
blinkFile = [experiment 'BlinksNew' type '.mat'];
blinkCutoffFile = [experiment 'BlinksNew' type 'BlinkCutoffs.mat'];
load([blinkDir filesep blinkFile]);
load([blinkDir filesep blinkCutoffFile]);
%% Set channels and figure colors
channelList64 = lower({'Fpz', 'Fp1', 'Fp2', 'AF7', ...
                       'AF3', 'AFz', 'AF4', 'AF8'});
channelList256 = lower({'E12', 'E13', 'E14', 'E11', ...
                        'E10', 'E9', 'E28', 'E27', 'E26'});
colorList = jet(18);

%% 
testColumns = {'ChMaxRatio', 'MaxRatio', 'ChMaxGood', 'MaxGood', 'ChMaxStd', 'MaxStd'};
testLabels = cell(length(blinks), 3);
testBlinks = nan(length(blinks), 8);
figure
hold on
for k = 1:length(blinkCutoffs)
    if isempty(blinkCutoffs{k})
        fprintf('%d: %s has no blinks\n', k, blinks(k).fileName);
        continue;
    end
    blinkLabels = blinkCutoffs{k}.channelLabels;
    cValues = blinkCutoffs{k}.cutoffValues;
    totalBlinkRatios = cValues(:, 2)./max(cValues(:, 2));
    goodBlinkRatios = cValues(:, 11);
    [testBlinks(k, 6), goodRatioIndex] = max(goodBlinkRatios);
    [testBlinks(k, 4), goodBlinkIndex] = max(cValues(:, 3));
    [~, totalBlinkIndex] = max(totalBlinkRatios);
    [testBlinks(k, 2), maxGoodIndex] = max(cValues(:, 9));
    testBlinks(k, 1) = cValues(maxGoodIndex, 1);
    testBlinks(k, 3) = cValues(goodBlinkIndex, 1);
    testBlinks(k, 5) = cValues(goodRatioIndex, 1);
    testLabels{k, 1} = blinkLabels{maxGoodIndex};
    testLabels{k, 3} = blinkLabels{goodBlinkIndex};
    testLabels{k, 5} = blinkLabels{goodRatioIndex};
    for n = 1:length(blinkLabels)
        c64 = find(strcmpi(channelList64, blinkLabels{n}), 1, 'first');
        c256 = find(strcmpi(channelList256, blinkLabels{n}), 1, 'first');
        if ~isempty(c64)
            theColor = colorList(2*c64 - 1, :);
            theShape = 'o';
        elseif ~isempty(c256)
            theColor = colorList(2*c256, :);
            theShape = 's';
        else
            theColor = [0, 0, 0];
            theShape = 'x';
        end
        plot(totalBlinkRatios, goodBlinkRatios, 'Color', theColor, ...
            'Marker', theShape, 'MarkerSize', 8, 'LineStyle', 'None');
    end
    plot(totalBlinkRatios(totalBlinkIndex), goodBlinkRatios(totalBlinkIndex), ...
        'Color', [0.7, 0.7, 0.7], 'Marker', '>', 'MarkerSize', 12, ...
        'LineWidth', 2, 'LineStyle', 'None');
    plot(totalBlinkRatios(goodRatioIndex), goodBlinkRatios(goodRatioIndex), ...
        'Color', [0.7, 0.7, 0.7], 'Marker', 'v', 'MarkerSize', 12, ...
        'LineWidth', 2, 'LineStyle', 'None');              
    plot(totalBlinkRatios(goodBlinkIndex), goodBlinkRatios(goodBlinkIndex), ...
        'Color', [0.7, 0.7, 0.7], 'Marker', '^', 'MarkerSize', 12, ...
        'LineWidth', 2, 'LineStyle', 'None');         
end
xlabel('Total blink ratio')
ylabel('Good blink ratio')
hold off
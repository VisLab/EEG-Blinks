function [] = dumpDatasetLeftZeros(fileOut, blinkFits, srate)
%% Save the extracted blink datasets
leftZeros = cellfun(@double, {blinkFits.leftZero});
maxValues = cellfun(@double, {blinkFits.maxValue});
isnanMask = isnan(leftZeros) | isnan(maxValues);
leftZeros(isnanMask) = [];
maxValues(isnanMask) = [];
leftZeroSeconds = (leftZeros - 1)./srate;
fprintf('Help dump\n');
fid = fopen(fileOut, 'w');
fprintf(fid,'Blink   Frame     Seconds  Value\n');
for n = 1:length(leftZeros)
    fprintf(fid, '%d\t\t%d\t%10.3f\t%10.3f\n', n, ...
        leftZeros(n), leftZeroSeconds(n), maxValues(n));
end
fclose(fid);

    
%% This extracts blink information for an individual file
%          

%% BCIT Examples
% datasetNames = {'T2_M053_S2018_XB', 'T2_M067_S2023_XC', 'T2_M037_S2013_XC', ...
% 'T2_M056_S2019_X2', 'T2_M061_S2021_XC' 'T2_M082_S2028_XC', ...
% 'T2_M100_S2034_X6', 'T2_M023_S2008_XB', 'T2_M021_S2007_X2'};
datasetNames = {'T1_M051_S2026_XC'};
%% BCIT other examples
experiment = 'BCITLevel0';
inDir = 'O:\ARL_Data\BCITBlinkOutputNew\data';
outDir = 'O:\ARL_Data\BCITBlinkOutputNew\textData';

%% Read in the blink data for this collection
thisList = dir(inDir);
fileList= {thisList(:).name};
fileTypes = [thisList(:).isdir];
fileList = fileList(~fileTypes);
%% Save the extracted blink datasets
for k = 1:length(fileList)
    [thePath, theName, theExt] = fileparts(fileList{k});
    if ~strcmpi(theExt, '.mat')
        continue;
    end
    load([inDir filesep fileList{k}]);
    dFits = dFits{1};
    leftZeros = cellfun(@double, {dFits.leftZero});
    isnanMask = isnan(leftZeros);
    leftZeros(isnanMask) = [];
    leftZeroSeconds = (leftZeros - 1)./dBlinks.srate;
    fileOut = [outDir filesep theName '.txt'];
    fid = fopen(fileOut, 'w');
    fprintf(fid,'Blink   Frame     Seconds\n');
    for n = 1:length(leftZeros)
        fprintf(fid, '%d\t\t%d\t%10.3f\n', n, leftZeros(n), leftZeroSeconds(n));
    end
    fclose(fid);
end
    
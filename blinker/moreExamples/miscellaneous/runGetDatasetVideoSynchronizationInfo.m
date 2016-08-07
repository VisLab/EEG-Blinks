%% This outputs simple video synchronization information for manual 
% comparison of EEG and blinker output.  It assumes that the individual
% dataset blink information has been extracted.

%% BCIT Examples
dataSync(9) = struct('fileName', [], 'shortName', [], ...
                     'videoLengthString', [], 'videoLengthSeconds', [], ...
                     'videoStartString', [], 'videoSeconds', [], ...
                     'EEGStartString', [], 'EEGLengthSeconds', [], ...
                     'EEGStartMinusVideoStartSeconds', []);
dataSync(1).shortName = 'T2_M053_S2018_XB';
dataSync(1).videoLengthString = '45;57;15';
dataSync(1).videoStartString = '04-Sep-2013 15:29:57';

dataSync(2).shortName = 'T2_M067_S2023_XC';
dataSync(2).videoLengthString = '16;58;14';
dataSync(2).videoStartString = '12-Sep-2013 14:02:45';  %Ambiguous time

dataSync(3).shortName =  'T2_M037_S2013_XC';
dataSync(3).videoLengthString = '17;35;08';
dataSync(3).videoStartString = '20-Aug-2013 14:14:03'; % Could be 30 seconds

dataSync(4).shortName =  'T2_M056_S2019_X2';
dataSync(4).videoLengthString = '47;14;05';
dataSync(4).videoStartString = '06-Sep-2013 15:08:34';  %Ambiguous time

dataSync(5).shortName = 'T2_M061_S2021_XC';
dataSync(5).videoLengthString = '19:38:09';
dataSync(5).videoStartString = '10-Sep-2013 14:07:41'; %Ambiguous time
 
dataSync(6).shortName = 'T2_M082_S2028_XC';
dataSync(6).videoLengthString = '16;16;16';
dataSync(6).videoStartString = '24-Sep-2013 14:06:31';  %Ambiguous time

dataSync(7).shortName = 'T2_M100_S2034_X6';
dataSync(7).videoLengthString = '44;59;06';
dataSync(7).videoStartString = '29-Jul-2014 14:59:20';

dataSync(8).shortName = 'T2_M023_S2008_XB';
dataSync(8).videoLengthString = '46;18;25';
dataSync(8).videoStartString = '07-Aug-2013 15:10:52';

dataSync(9).shortName = 'T2_M021_S2007_X2';
dataSync(9).videoLengthString = '46;11;12';
dataSync(9).videoStartString = '02-Aug-1013 15:41:57';

shortNames = {dataSync.shortName};
%% BCIT other examples
experiment = 'BCITLevel0';
inDir = 'O:\ARL_Data\BCITBlinkOutputNew\data';
outDir = 'O:\ARL_Data\BCITBlinkOutputNew\textData';
formatIn = 'yymmdd';
conversionFactor = 24*60*60;
% pivotYear = 2000;
% datenum(startTime, formatIn, pivotYear);
% 'dd-mmm-yyyy HH:MM:SS'
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
    fileName = dBlinks.fileName;
    [thePath, theName, theExt] = fileparts(fileName);
    pieces = strsplit(theName, '_');
    shortName = [pieces{3} '_' pieces{4} '_' pieces{5} '_' pieces{6}];
    pos = strcmpi(shortNames, shortName);
    if isempty(pos)
        warning('%d: %s no match of information\n', k, theName);
        continue;
    end
    fprintf('%s %s %s\n', shortName, datestr(dBlinks.startTime), ...
            dataSync(pos).videoStartString);
    
end
    
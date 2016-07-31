%% NCTU - get the files and subjects
collectionType = 'ESSLEVEL2';
blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks_New';
experiment = 'NCTU_LK';
%type = 'IC';
%type = 'Channel';
type = 'ChannelMastNewBoth';

%% Load the blinks data
blinkFile = [experiment 'BlinksNew' type '.mat'];
load([blinkDir filesep blinkFile]);

%% Replicate handling
replicateMap = containers.Map('KeyType', 'char', 'ValueType', 'any');

numberFiles = length(blinks);
%% Create the new structure
conversionFactor = 24*60*60;
pivotYear = 2000;
formatIn = 'yymmdd';
for k = 1:numberFiles
    [thePath, theName, theExt] = fileparts(blinks(k).fileName);
    pieces = strsplit(theName, '_');
    blinks(k).task = pieces{11}; %#ok<*SAGROW>
    blinks(k).subjectID = pieces{12};
    blinks(k).experiment = experiment;
  
    startTime = pieces{13};
    if strcmpi(startTime(end), 'm') || strcmpi(startTime(end), 'n')
        taskCode = startTime(end);
        startTime = pieces{14}(1:end-1);    
    elseif strcmpi(pieces{11}, 'motion')
        taskCode = 'm';
    else
        taskCode = 'n';
    end
    blinks(k).uniqueName = [pieces{12} '_'  taskCode];  
    if isKey(replicateMap, blinks(k).uniqueName)
        theValue = replicateMap(blinks(k).uniqueName);
        theValue(end + 1) = k; 
    else
        theValue = k;
    end
    replicateMap(blinks(k).uniqueName) = theValue;    
    blinks(k).startTime = datenum(startTime, formatIn, pivotYear);
end

%% Now add the replicate markers to the unique tags
repKeys = keys(replicateMap);
for k = 1:length(repKeys)
    theValues = replicateMap(repKeys{k});
    startTimes = cell2mat({blinks(theValues).startTime});
    [theTimes, theIndices] = sort(startTimes);
    replicates = zeros(length(startTimes), 1);
    for n = 1:length(replicates)
        replicates(theIndices(n)) = n;
    end
    uniqueNames = {blinks(theValues).uniqueName};
    for n = 1:length(replicates)
        blinks(theValues(n)).uniqueName = [uniqueNames{n} '_R' num2str(replicates(n))];
    end
end

%% Save the blinks and blink map
save ([blinkDir filesep blinkFile], 'blinks', '-v7.3');
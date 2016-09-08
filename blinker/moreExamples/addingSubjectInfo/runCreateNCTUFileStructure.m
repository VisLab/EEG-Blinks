%% Create a blinker structure of subject information and file names for NCTU
experiment = 'NCTU_LK';
collectionType = 'ESSLEVEL1';
baseDir = 'E:\CTADATA\NCTU\Level0\01. NCTU lane-keeping task';
pathName = [baseDir filesep 'study_description.xml'];
blinkDir = 'O:\ARL_Data\NCTU\NCTUBlinksNewRefactored';
typeBlinks = 'AllMastNewBoth';

%% Create the list of files to be processed
fileList  = getFileList(collectionType, pathName);
numFiles = length(fileList);
blinkFiles(numFiles) = createBlinkFileStructure();

%% Create the file name of the output
blinkFileListName = [blinkDir filesep experiment typeBlinks 'FileList.mat'];

%% Replicate handling
replicateMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
numberFiles = length(blinkFiles);

%% Create the new structure
conversionFactor = 24*60*60;
pivotYear = 2000;
formatIn = 'yymmdd';
sessions = cell(numberFiles, 1);
startTimes = zeros(numFiles, 1);
for k = 1:numberFiles
    blinkFiles(k).fileName = fileList{k};
    [thePath, theName, theExt] = fileparts(blinkFiles(k).fileName);
    pieces = strsplit(theName, '_');
    task = pieces{10}; %#ok<*SAGROW>
    subjectID = pieces{11};
    sessions{k} = pieces{6};
    
  
    startTime = pieces{12};
    if strcmpi(startTime(end), 'm') || strcmpi(startTime(end), 'n')
        startTime = startTime(1:end-1);    
    end
    uniqueName = [subjectID '_' task];  
    if isKey(replicateMap, uniqueName)
        theValue = replicateMap(uniqueName);
        theValue(end + 1) = k; 
    else
        theValue = k;
    end
    replicateMap(uniqueName) = theValue;    
    thisDate = datenum(startTime, formatIn, pivotYear);
    startTimes(k) = thisDate;
    blinkFiles(k).startDate = datestr(thisDate);
    blinkFiles(k).startTime = '';
    blinkFiles(k).task = task;
    blinkFiles(k).subjectID = subjectID;
    blinkFiles(k).experiment = experiment;
    blinkFiles(k).uniqueName = uniqueName;
end

%% Now add the replicate markers to the unique tags
repKeys = keys(replicateMap);
for k = 1:length(repKeys)
    theValues = replicateMap(repKeys{k});
    theseTimes = startTimes(theValues);
    [theTimes, theIndices] = sort(theseTimes);
    replicates = zeros(length(theseTimes), 1);
    for n = 1:length(replicates)
        replicates(theIndices(n)) = n;
    end
    uniqueNames = {blinkFiles(theValues).uniqueName};
    for n = 1:length(replicates)
        blinkFiles(theValues(n)).uniqueName = [uniqueNames{n} '_R' ...
            num2str(replicates(n)) '_Session_' sessions{theValues(n)}];
    end
end

%% Put all of the files in same directory
for k = 1:numberFiles
    blinkFiles(k).blinkFileName = ...
        [blinkFiles(k).experiment '_' blinkFiles(k).uniqueName];
end
%% Save the blinks and blink map
save (blinkFileListName, 'blinkFiles', '-v7.3');
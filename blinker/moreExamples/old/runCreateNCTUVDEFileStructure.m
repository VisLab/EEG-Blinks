%% Create a blinker structure of subject information and file names for NCTU
experiment = 'NCTU_RWN_VDE';
baseDir = 'D:\Research\Blinks\BlinkDetectionCurrent\NCTU_Subject';
pathName = [baseDir filesep 'study_description.xml'];
pathNameDerived = [baseDir filesep 'studyLevelDerived_description.xml'];
blinkFileListName = [baseDir filesep experiment '_BlinkFileList.mat'];
%% Create the ESS level1 study object
obj = level1Study(pathName);

[filename, dataRecordingUuid, taskLabel, sessionNumber, ...
    dataRecordingNumber, subjectInfo, sessionTaskNumber] = getFilename(obj);

%% Create the ESS level derived study object (for other indicators)
objDerived = levelDerivedStudy('levelDerivedXmlFilePath', pathNameDerived);
[~, ~, ~, sessionNumbersDerived] =  getFilename(objDerived);

% %% Replicate handling
replicateMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
sessionMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
sessionInfo = obj.sessionTaskInfo;
numberFiles = length(sessionInfo);

%% Create the new structure modified for this purpose
tempStruct = createBlinkFileStructure();
tempStruct.session = nan;
tempStruct.level2_256HzName = nan;
blinkFiles(numberFiles) = tempStruct;

%%
pivotYear = 2000;
formatIn = 'yyyy-mm-dd';
sessions = cell(numberFiles, 1);
startTimes = zeros(numberFiles, 1);
for k = 1:numberFiles
    blinkFiles(k) = blinkFiles(numberFiles);
    thisRecording = sessionInfo(k).dataRecording;
    task = sessionInfo(k).taskLabel;
    subjectID = sessionInfo(k).subject.labId;
    session = sessionInfo(k).sessionNumber;
    startTime = sessionInfo(k).dataRecording.startDateTime;
    fatigueLevel = strrep(subjectInfo(k).group, ' ', '');
    uniqueName = [subjectID '_' task '_' fatigueLevel];  
    if isKey(replicateMap, uniqueName)
        theValue = replicateMap(uniqueName);
        theValue(end + 1) = k;  %#ok<SAGROW>
    else
        theValue = k;
    end
    replicateMap(uniqueName) = theValue;   
    
    if isKey(sessionMap, session)
        theValue = replicateMap(session);
        theValue(end + 1) = k;  %#ok<SAGROW>
    else
        theValue = k;
    end
    sessionMap(session) = theValue; 
    
    thisDate = datenum(startTime, formatIn, pivotYear);
    startTimes(k) = thisDate;
    blinkFiles(k).startTime = '00:00:00';
    blinkFiles(k).startDate = datestr(thisDate);
    blinkFiles(k).task = task;
    blinkFiles(k).subjectID = subjectID;
    blinkFiles(k).experiment = experiment;
    blinkFiles(k).uniqueName = uniqueName;
    blinkFiles(k).session = session;
    blinkFiles(k).fileName = obj.sessionTaskInfo(k).dataRecording.filename;
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
            num2str(replicates(n)) '_Session_' ...
            blinkFiles(theValues(n)).session];
    end
end

%% Now use the session numbers to map level2_256Hz file names
derivedFiles = objDerived.studyLevelDerivedFiles.studyLevelDerivedFile;
for k = 1:length(derivedFiles)
    derivedName = derivedFiles(k).studyLevelDerivedFileName;
    session = sessionNumbersDerived{k};
    if ~isKey(sessionMap, session)
        warning('%d: did not have a corresponding session\n', k);
        continue;
    end
    thePosition = sessionMap(session);
    if length(thePosition) ~= 1
        warning('%d:  had more than one set file in a session\n', k)
        continue;
    end
    blinkFiles(thePosition).level2_256HzName = derivedName;
    if ~strcmpi(blinkFiles(thePosition).session, session)
        warning('%d: has derived sessions that do not align with original\n', k);
        continue;
    end
    
end

%% Put all of the files in same directory
for k = 1:numberFiles
    blinkFiles(k).blinkFileName = ...
        [blinkFiles(k).experiment '_' blinkFiles(k).uniqueName];
end
%% Save the blinks and blink map
save (blinkFileListName, 'blinkFiles', '-v7.3');
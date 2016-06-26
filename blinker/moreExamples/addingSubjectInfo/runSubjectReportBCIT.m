%% Get a list of the subjects and the BCIT datasets for them
dataDir = 'E:\CTAData\ARL_BCIT\level_0';
type = 'FILES';
nameMapDir = 'O:\ARL_Data\BCITNames';
%% Get a list of the files for the BCIT
fileNames = getFileList(type, dataDir);

%% Initialize the subject map
subjectMap = containers.Map('KeyType', 'char', 'ValueType', 'any');

%% Create the subjects map
for k = 1:length(fileNames)
    [myPath, myName, myExt] = fileparts(fileNames{k});
    pieces = strsplit(myName, '_');
    subject = pieces{5};
    if strcmpi(subject, 'S2089')
        fprintf('%s\n', fileNames{k});
    end
    if isKey(subjectMap, subject)
        sofar = subjectMap(subject);
    else
        sofar = {};
    end
    sofar{end + 1} = fileNames{k}; %#ok<SAGROW>
    subjectMap(subject) = sofar;
end

%% Create the subject lists
theKeys = keys(subjectMap);
numberSubjects = length(theKeys);
maps(numberSubjects) = struct('subject', [], 'files', [], ...
                              'startTimes', [], 'endTimes', []);
for k = 1:numberSubjects
    theNames = subjectMap(theKeys{k});
    
    maps(k).subject = theKeys{k};
    maps(k).files = theNames;
    fprintf('Subject %s: %d datasets [ ', theKeys{k}, length(theNames));
    for n = 1:length(theNames)
        [myPath, myName, myExt] = fileparts(theNames{n});
        pieces = strsplit(myName, '_');
        fprintf('%s ', pieces{6});
    end
    fprintf(']\n');
end 
subjectLists = maps;

%% Now go through the files to read the times
conversionFactor = 24*60*60;
pivotYear = 2000;
formatIn = 'dd.mm.yy HH.MM.SS';
for s = 1:numberSubjects
    theFiles = subjectLists(s).files;
    startTimes = zeros(length(theFiles), 1);
    endTimes = zeros(length(theFiles), 1);
    for k = 1:length(theFiles)
        load(theFiles{k}, '-mat');
        theDate = [EEG.etc.date ' ' EEG.etc.time];
        startTimes(k) = datenum(theDate, formatIn, pivotYear);
        endTimes(k) = startTimes(k) + (size(EEG.data, 2) - 1)/(EEG.srate * conversionFactor);
    end
    subjectLists(s).startTimes = startTimes; 
    subjectLists(s).endTimes = endTimes; 
end

%%
save([nameMapDir filesep 'subjectMap'], 'subjectMap', 'subjectLists', '-v7.3');


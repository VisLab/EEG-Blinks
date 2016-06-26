%% Get a list of the subjects and the BCIT datasets for them
pathName = 'E:\CTAData\01. NCTU lane-keeping task\study_description.xml';
type = 'ESSLEVEL1';
nameMapDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
%% Get a list of the files
fileNames = getFileList(type, pathName);

%%
subjectMap = containers.Map('KeyType', 'char', 'ValueType', 'any');

%% Create the subjects map
for k = 1:length(fileNames)
    [myPath, myName, myExt] = fileparts(fileNames{k});
    pieces = strsplit(myName, '_');
    subject = pieces{11};
    fprintf('%s: subject %s\n', myName, subject);    
    if isKey(subjectMap, subject)
        sofar = subjectMap(subject);
    else
        sofar = {};
    end
    sofar{end + 1} = fileNames{k}; %#ok<SAGROW>
    subjectMap(subject) = sofar;
end

%% Output a report
theKeys = keys(subjectMap);
numberSubjects = length(theKeys);
maps(numberSubjects) = struct('subject', [], 'files', []);
for k = 1:length(theKeys)
    theNames = subjectMap(theKeys{k});
    
    maps(k).subject = theKeys{k};
    maps(k).files = theNames;
    fprintf('Subject %s: %d datasets [ ', theKeys{k}, length(theNames));
    for n = 1:length(theNames)
        [myPath, myName, myExt] = fileparts(theNames{n});
        pieces = strsplit(myName, '_');
        fprintf('session_%s_%s_%s ', pieces{6}, pieces{11}, pieces{12});
    end
    fprintf(']\n');
end 
subjectLists = maps;
%%
save([nameMapDir filesep 'NCTU_LK_subjectMap'], 'subjectMap', 'subjectLists', '-v7.3');
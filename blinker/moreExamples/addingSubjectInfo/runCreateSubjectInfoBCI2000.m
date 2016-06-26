% BCI2000 generating subject information and date from separate metafiles
dataRoot = 'E:\CTA_DATA\BCI2000';
dataDir = 'E:\CTA_DATA\BCI2000\BCI2000Raw\EEG Screening Data Set\BCI2000 DAT files';
subjectFile = [dataRoot filesep 'BCI2000SubjectsEdited.txt'];
subjectPropertyFile = [dataRoot filesep 'BCI2000CharacteristicsEdited.txt'];

%% Create a subject map
subjectMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
aliasMap = containers.Map('KeyType', 'char', 'ValueType', 'any');

fid = fopen(subjectFile);
tline = fgetl(fid); %#ok<NASGU>
tline = fgetl(fid);
while ischar(tline)
    pieces = strsplit(tline, '\t');
    subjectMap(upper(pieces{1})) = upper(pieces{2});
    aliasMap(upper(pieces{2})) = upper(pieces{1});
    tline = fgetl(fid);
end
fclose(fid);

%% 
subjects(109) = struct('subject', [], 'alias', [], 'age', [], 'gender', [], 'handed', []);
fid = fopen(subjectPropertyFile);
tline = fgetl(fid); %#ok<NASGU>
tline = fgetl(fid);
while ischar(tline)
    pieces = strsplit(tline, '\t');
    alias = upper(pieces{1});
    if ~isKey(aliasMap, alias)
        warning('%s is not a key', alias);
    else
        thisSubject = aliasMap(alias);
        subjectPos = str2double(thisSubject(2:end));
        subjects(subjectPos).subject = thisSubject;
        subjects(subjectPos).alias = alias;
        subjects(subjectPos).age = str2double(pieces{2});
        subjects(subjectPos).gender = pieces{3};
        subjects(subjectPos).handed = pieces{4};
    end
    tline = fgetl(fid);
end
fclose(fid);


%% Get a list of the top level Raw dates and times
%% Get the directories at the top level
timeMap = containers.Map('KeyType', 'char', 'ValueType', 'double');
tempMap = containers.Map('KeyType', 'char', 'ValueType', 'any');
inList = dir(dataDir);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
dirNames = dirNames(dirTypes);
dirNames(strcmpi(dirNames, '.')| strcmpi(dirNames, '..')) = [];
for k = 1:length(dirNames)
    thisDir = [dataDir filesep dirNames{k}];
    fprintf('Directory: %s\n', thisDir);
    thisList = dir(thisDir);
    theseTypes = [thisList(:).isdir];
    thisList = thisList(~theseTypes);
    for j = 1:length(thisList)
        [thePath, theName, theExt] = fileparts(thisList(j).name);
        if ~strcmpi(theExt, '.dat')
            continue;
        end
        task = theName(end - 2:end);
        alias = upper(theName(1:end - 7));
        if ~isKey(aliasMap, alias)
            warning('%s is not an alias', alias);
            continue;
        end  
        realName = [aliasMap(alias) task];
        tempMap(alias) = realName;
        timeMap(realName) = thisList(j).datenum;
    end
end

%% Save the information for future processing
save([dataRoot filesep 'BCI2000Metadata.mat'], 'timeMap', 'subjects', '-v7.3');
%% Directories
baseDir = 'E:\CTADATA\Michigan\EEG_data_for_blink_detection3';
outDir = 'E:\CTADATA\Michigan\EEG_data_for_blink_detection3_out';


%% Get the directories
inList = dir(baseDir);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
theseNames = dirNames(~dirTypes);

for k = 1:length(theseNames)
    [thePath, theName, theExt] = fileparts(theseNames{k});
    fileName = [baseDir filesep theseNames{k}];
    if strcmpi(theExt, '.set')
        EEG = pop_loadset(fileName);
    elseif strcmpi(theExt, '.bdf')
       EEG = pop_biosig(fileName);
    else
        continue;
    end
    outName = [outDir filesep theName '.set'];
    pop_saveset(EEG, 'filename', outName, ...
               'savemode', 'onefile', 'version', '7.3')
end
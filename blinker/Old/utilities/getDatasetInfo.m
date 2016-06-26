function [subjectID, experiment, uniqueName, task, startTime] = ...
                                 getDatasetInfo(EEG, type)
                                                      
switch  type
    case 'BCIT'
        [subjectID, experiment, uniqueName, task, startTime] = ...
                                                          getBCITInfo(EEG);
    otherwise
        subjectID = NaN;
        experiment = NaN;
        uniqueName = NaN;
        task = NaN;
        startTime = NaN;
end
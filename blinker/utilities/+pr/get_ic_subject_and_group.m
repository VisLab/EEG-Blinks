function icSubjectAndGroup = get_ic_subject_and_group(STUDY, icId)

if nargin < 2
    icId = 1:size(STUDY.cluster(1).sets,2);
end;

icDatasetId = STUDY.cluster(1).sets(1,icId);
icDatasetIdAllConditions = STUDY.cluster(1).sets(:,icId);

% find subject names and groups
icSubjectName = {};
icGroupName = {};
for i=1:length(icDatasetId)
    icSubjectName{i} = STUDY.datasetinfo(icDatasetId(i)).subject;
    icGroupName{i} = STUDY.datasetinfo(icDatasetId(i)).group;
end;

uniqueSubjectName = unique(icSubjectName);
icSubjectNumber = zeros(1, length(icSubjectName));
for i=1:length(icSubjectName)
    icSubjectNumber(i) = find(strcmp(uniqueSubjectName, icSubjectName{i}));
end;


% group names should be strings, if they are numerical they are converted
% here to strings
for i=1:length(icGroupName)
    if isnumeric(icGroupName{i})
        icGroupName{i} = num2str(icGroupName{i});
    end;
end;

uniqueSubjectGroup = unique(icGroupName);
icGroupNumber = zeros(1, length(icGroupName));
for i=1:length(icGroupName)
    icGroupNumber(i) = find(strcmp(uniqueSubjectGroup, icGroupName{i}));
end;

icSubjectAndGroup.icDatasetId = icDatasetId;
icSubjectAndGroup.icDatasetIdAllConditions = icDatasetIdAllConditions;
icSubjectAndGroup.icSubjectName = icSubjectName;
icSubjectAndGroup.icGroupName = icGroupName;
icSubjectAndGroup.icGroupNumber = icGroupNumber;
icSubjectAndGroup.icSubjectNumber = icSubjectNumber;

icSubjectAndGroup.uniqueSubjectName = uniqueSubjectName;
icSubjectAndGroup.uniqueSubjectGroup = uniqueSubjectGroup;
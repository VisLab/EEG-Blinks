function [taskIndex, uniqueTasks, uniqueSubjects] = getSubjectTaskIndex(blinks)

   uniqueTasks = unique({blinks.task});
   uniqueSubjects = unique({blinks.subjectID});
   taskIndex = zeros(length(uniqueSubjects), length(uniqueTasks));
   taskMap = containers.Map('KeyType', 'char', 'ValueType', 'double');
   subjectMap = containers.Map('KeyType', 'char', 'ValueType', 'double');
   for k = 1:length(uniqueTasks)
       taskMap(uniqueTasks{k}) = k;
   end
   for k = 1:length(uniqueSubjects)
       subjectMap(uniqueSubjects{k}) = k;
   end
   
   for k = 1:length(blinks)
       subject = subjectMap(blinks(k).subjectID);
       task = taskMap(blinks(k).task);
       taskIndex(subject, task) = k;
   end
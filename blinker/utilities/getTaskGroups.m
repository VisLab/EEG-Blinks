function taskGroups = getTaskGroups(taskList, taskTypes)
% Group tasks into specified groups by type  (needed for ANOVA)
%
%  Parameters:
%     taskList     n x 1 cell array of task names
%     taskTypes    cell array - each row corresponds to one group
%                  the elements of the row are the tasks in the group
%     taskGroups   (output) n x 1 vector of group numbers corresponding
%                  to the task list
%
%
taskGroups = zeros(size(taskList));
numGroups = length(taskTypes);
for n = 1:length(taskList)
   for k = 1:numGroups
       if sum(strcmpi(taskTypes{k}, taskList{n}))> 0
           taskGroups(n) = k;
           break;
       end
   end
end
 


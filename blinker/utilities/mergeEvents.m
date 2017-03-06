function [events, positions1, positions2] = mergeEvents(events1, events2)
%% Merges two event structures, sorting on the latency field
%
%  Parameters:
%     events1     structure with at least a latency field
%     events2     structure with at least a latency field
%     events      (output) merged structure sorted by latency field
%     positions1  (output) positions of events1 in events
%     positions2  (output) positions of events2 in events
%
%  Note: This function orders fields primarily by those in events1
%
%  Written by:  Kay Robbins, 2017, UTSA
%
%% Handle various cases of empty events
events = [];
positions1 = [];
positions2 = [];
if isempty(events1) && isempty(events2) 
    return;
elseif isempty(events1) 
    events = events2;
    positions2 = 1:length(events2);
    return;
elseif isempty(events2)
    events = events1;
    positions1 = 1:length(events1);
    return;
end

if ~isfield(events1, 'latency') || ~isfield(events2, 'latency')
    error('mergeEvents:NoLatency', 'Events must have latency field');
end

%% Make sure that the fields match for the two event structures
fields1 = fieldnames(events1);
fields2 = fieldnames(events2);
for n = 1:length(fields2)
    if ~isfield(events1, fields2{n})
        for k = 1:length(events1)
           events1(k).(fields2{n}) = NaN;
        end
    end
end

for n = 1:length(fields1)
    if ~isfield(events2, fields1{n})
        for k = 1:length(events2)
           events2(k).(fields1{n}) = NaN;
        end
    end
end

%% Fix the order to be that of events1
fieldOrder = fieldnames(events1);
events2 = orderfields(events2, fieldOrder);
events = [events1, events2];
latencies = cellfun(@double, {events.latency});
[~, eIndex] = sort(latencies);
positions = 1:length(eIndex);
for k = 1:length(positions)
    positions(eIndex(k)) = k;
end
events = events(eIndex);
positions1 = positions(1:length(events1));
positions2 = positions(length(events1) + 1:end);
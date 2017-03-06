EEG = pop_loadset('D:\Research\eeglab13_6_5b\sample_data\eeglab_data.set');
urevents2(5) = struct('type', 'blink', 'latency', 1, 'usertags', '/a/b/c');
for k = 1:4
    urevents2(k) = urevents2(5);
end

urevents2(2).latency = 140;
urevents2(3).latency = 180;
urevents2(4).latency = 280;
urevents2(5).latency = 30504;

events2 = urevents2;
for k = 1:5
    events2(k).urevent = k;
end

EEG1 = EEG;
events1 = EEG.event(1:4);
urevents1 = EEG.urevent(1:4);
events1(3) = [];
[urevents, upositions1, upositions2] = mergeEventsNew(urevents1, urevents2);

urPos1 = cellfun(@double, {events1.urevent});
urPos2 = cellfun(@double, {events2.urevent});
events1n = rmfield(events1, 'urevent');
events2n = rmfield(events2, 'urevent');
[events, positions1, positions2] = mergeEventsNew(events1n, events2n);

events(1).urevent = NaN;
for k = 1:length(positions1)
   events(positions1(k)).urevent = upositions1(urPos1(k));
end
for k = 1:length(positions2)
   events(positions2(k)).urevent = upositions2(urPos2(k));
end
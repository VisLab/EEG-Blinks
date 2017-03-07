function EEG = addBlinkEvents(EEG, blinkFits, blinkProperties)
%% Add blink events to EEG structure from BLINKER
%
%  Parameters:
%      EEG               EEGLAB EEG structure
%      blinkFits         structure from BLINKER
%      blinkProperties   structure from BLINKER
%
%  Written by Kay Robbins, UTSA, 2017
%
%% First make sure that there are blink events to add
      blinkEvents = getBlinkEvents(blinkFits, blinkProperties); 
      if isempty(blinkEvents)
          warning('addBlinkEvents:NoEvents', 'No blink events detected');
          return;
      end
      blinkUREvents = blinkEvents;
      blinkEvents = addUREventField(blinkEvents);

    %% If the EEG structure has no events at all, just add blink events
      if ~isfield(EEG, 'event') || isempty(EEG.event)
          EEG.urevent = blinkEvents;
          EEG.event = blinkUREvents;
          return;
      end

    %% If the EEG structure doesn't have urevent field, add it
      if ~isfield(EEG.event, 'urevent')
          EEG.urevent = EEG.event;
          EEG.event = addUREventField(EEG.event);
      end

    %% Now extract the UR positions
    urPosEEG = cellfun(@double, {EEG.event.urevent});
    urPosBlinks = cellfun(@double, {blinkEvents.urevent});  

    %% Merge events
    [urEvents, uPositionsEEG, uPositionsBlinks] = ...
                   mergeEvents(EEG.urevent, blinkUREvents);
    eventsEEGn = rmfield(EEG.event, 'urevent');
    [events, positionsEEG, positionsBlinks] = ...
                    mergeEvents(eventsEEGn, blinkUREvents);

    events(1).urevent = NaN;
    for k = 1:length(positionsEEG)
       events(positionsEEG(k)).urevent = uPositionsEEG(urPosEEG(k));
    end
    for k = 1:length(positionsBlinks)
       events(positionsBlinks(k)).urevent = uPositionsBlinks(urPosBlinks(k));
    end
    
    %% Now update the EEG
    EEG.event = events;
    EEG.urevent = urEvents;
end 

function events = addUREventField(events)
%% Adds urevent field to events structure if not there
    if isfield(events, 'urevent')
        return;
    end
    events(1).urevent = 1;
    for k = 2:length(events)
        events(k).urevent = k;
    end
end
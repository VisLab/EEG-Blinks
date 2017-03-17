function [EEG, blinkSignal] = addBlinkEvents(EEG, blinks, blinkFits, ...
                                             blinkProperties, fieldList)
%% Add blink events to EEG structure from BLINKER
%
%  Parameters:
%      EEG               EEGLAB EEG structure
%      blinks            structure from BLINKER
%      blinkFits         structure from BLINKER
%      blinkProperties   structure from BLINKER
%      fieldList         (optional) cell array with names of features to
%                        add events for (default maxFrame);
%  Output:
%      EEG               (output) EEGLAB structure with the blink events added
%      blinkSignal       (output) Selected channel signal with portion
%                                 outside blinks zeroed out.
%
%  Written by Kay Robbins, UTSA, 2017
%
%% Check arguments
if nargin < 4
    error('addBlinkEvents:NotEnoughParameters', 'Need at least 3 arguments');
elseif nargin == 4
    fieldList = {'maxFrame'};
end

%% First make sure that there are blink events to add
      [blinkEvents, blinkSignal] = ...
          getBlinkEvents(blinks, blinkFits, blinkProperties, fieldList); 
      if isempty(blinkEvents)
          blinkSignal = zeros(1, size(EEG.data, 2));
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
    EEG.event = cleanupNans(events);
    EEG.urevent = cleanupNans(urEvents);
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

function events = cleanupNans(events)
%% Replace NaNs for duration, usertags, and hedtags with 0, '', and ''
    for k = 1:length(events)
        if isnan(events(k).duration)
            events(k).duration = 0;
        end
        if isnan(events(k).usertags)
            events(k).usertags = '';
        end
        if isnan(events(k).hedtags)
            events(k).hedtags = '';
        end
    end
end
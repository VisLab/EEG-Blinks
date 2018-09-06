function [events, blinkSignal] = ...
           getBlinkEvents(blinks, blinkFits, blinkProperties, fieldList)
%% Create an events structure with a standard set of blink events
%
%  Parameters:
%      blinks            structure produced
%      blinkFits         structure produced by the BLINKER software
%      blinkProperties   structure produced by the BLINKER software
%      fieldList         cell array with blinkFit field names of events
%      events            (output) structure with type, latency, duration, 
%                        usertags, and hedtags fields
%      blinkSignal       (output) signals
%
%  Written by:  Kay Robbins, UTSA, 2017
%
%% Initialize the 
    blinkSignal = [];
    if isempty(blinkFits)
        events = struct();
        warning('insertBlinkEvents:NoBlinks', 'Dataset has no blinks');
        return;
    end
   
%% Valid fields to use for events
    validEvents = getValidEvents();
    validFields = {validEvents.fieldName};
    [usedFields, vMask] = intersect(validFields, fieldList);
    if isempty(usedFields)
        warning('insertBlinkEvents:NoValidFields', 'Field values are not invalid');
        return;
    end
    usedEventTypes = validEvents(vMask);
    badFields = setdiff(fieldList, validFields);
    if ~isempty(badFields)
       badFieldString = badFields{1};
       for k = 2:length(badFields)
           badFieldString = [badFieldString ',' badFields{k}]; 
       end
       warning('insertBlinkEvents:SkippingFields', 'Invalid fields %s', badFieldString);
    end

%% Get preliminary number of blinks and create an events structure
    numBlinks = length(blinkFits);
    numEvents = length(usedEventTypes)*numBlinks;
    events(numEvents) = struct('type', NaN, 'latency', NaN, ...
        'duration', NaN, 'usertags', NaN,  'hedtags', NaN);

%% Set up the usertags for the used fields  
    userTags = cell(length(usedEventTypes), 1);
    for n = 1:length(usedEventTypes)
        userTags{n} = ['Event/Category/Incidental,' ...
            'Event/Label/' usedEventTypes(n).label ',' ...
            'Event/Long name/' usedEventTypes(n).longName ',' ...
            'Event/Description/' usedEventTypes(n).description ',' ...
            usedEventTypes(n).userTags];
    end
    pos = 0;
    for k = 1:numBlinks
        hedTags = '';
        durationHZ = blinkProperties(k).durationHalfZero;
        if ~isnan(durationHZ)
            hedTags = ['Attribute/Blink/Duration/' num2str(durationHZ) ' s,'];
        end
        PAVR = blinkProperties(k).posAmpVelRatioBase;
        if ~isnan(PAVR)
            hedTags = [hedTags 'Attribute/Blink/PAVR/' num2str(PAVR) ' cs,']; %#ok<*AGROW>
        end
        NAVR = blinkProperties(k).negAmpVelRatioBase;
        if ~isnan(NAVR)
            hedTags = [hedTags 'Attribute/Blink/NAVR/' num2str(NAVR) ' cs,'];
        end
        if strcmpi(hedTags, ',')
            hedTags = hedTags(1:(end-1));
        end
        for n = 1:length(usedEventTypes)
            theLatency = blinkFits(k).(usedFields{n});
            if isnan(theLatency)
                warning('getBlinkEvents:SkipNan', ...
                    'Warning, skipping blink %d for field %s', k, usedFields{n});
                continue;
            end
            pos = pos + 1;
            events(pos) = events(numEvents);
            events(pos).type = usedEventTypes(n).fieldName;
            events(pos).latency = theLatency;
            events(pos).duration = 0;
            events(pos).usertags = userTags{n};
            events(pos).hedtags = hedTags;
        end
    end
    events = events(1:pos);
    
    %% Now construct the zeroed signal
    if isempty(blinks) || ~isfield(blinks, 'signalData') || isempty(blinks.signalData)
        warning('getBlinkEvents:NoBlinkSignal', 'blinks did not have signal data');
        return;
    end
    signal = blinks.signalData.signal;
    blinkSignal = zeros(size(signal));
    startZeros = cellfun(@double, {blinkFits.leftZero});
    endZeros = cellfun(@double, {blinkFits.rightZero});
    for k = 1:numBlinks
        if isnan(startZeros(k)) || isnan(endZeros(k))
            warning('getBlinkEvents:SkipBlink', ...
                'Skipping blink %d because end point not defined', k);
            continue;
        end
        blinkSignal(startZeros(k):endZeros(k)) = signal(startZeros(k):endZeros(k));
    end
    blinkSignal(blinkSignal < 0) = 0;
    %% Construct the valid events
    function validEvents = getValidEvents()
        validEvents(7) = struct('fieldName', NaN, 'label', NaN, ...
                         'longName', NaN, 'description', NaN, 'userTags', NaN);

        validEvents(1).fieldName = 'maxFrame';
        validEvents(1).label = 'BlinkMax';
        validEvents(1).longName = 'Time of maximum blink amplitude';
        validEvents(1).description = 'Time blink signal first reaches maximum';
        validEvents(1).userTags = 'Action/Eye blink/Max';
        validEvents(2).fieldName = 'leftZero';
        validEvents(2).label = 'BlinkLeftZero';
        validEvents(2).longName = 'Blink first crosses zero on close';
        validEvents(2).description = 'Time blink signal first crosses zero on close';
        validEvents(2).userTags = 'Action/Eye blink/Left zero';
        validEvents(3).fieldName = 'rightZero';
        validEvents(3).label = 'BlinkRightZero';
        validEvents(3).longName = 'Time blink signal first crosses zero on open';
        validEvents(3).description =  'Time blink signal first crosses zero on open';
        validEvents(3).userTags = 'Action/Eye blink/Right zero';
        validEvents(4).fieldName = 'leftBase';
        validEvents(4).label = 'BlinkLeftBase';
        validEvents(4).longName = 'Time blink signal local minimum on close';
        validEvents(4).description =  'Time of blink signal last local minimum on close';
        validEvents(4).userTags = 'Action/Eye blink/Left base';
        validEvents(5).fieldName = 'rightBase';
        validEvents(5).label = 'BlinkRightBase';
        validEvents(5).longName = 'Time blink signal crosses low on open';
        validEvents(5).description =  'Time of blink signal first local minimum on open';
        validEvents(5).userTags = 'Action/Eye blink/Right base';
        validEvents(6).fieldName = 'leftZeroHalfHeight';
        validEvents(6).label = 'BlinkLeftHalfHeight';
        validEvents(6).longName = 'Time blink signal reaches zero half height on close';
        validEvents(6).description =  'Time blink signal last reaches zero half height on close';
        validEvents(6).userTags = 'Action/Eye blink/Left half height';
        validEvents(7).fieldName = 'rightZeroHalfHeight';
        validEvents(7).label = 'BlinkRightHalfHeight';
        validEvents(7).longName = 'Time blink signal reaches zero half height on open';
        validEvents(7).description =  'Time blink signal first reaches zero half height on open';
        validEvents(7).userTags = 'Action/Eye blink/Right half height';
    end
end
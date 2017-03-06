function events = getBlinkEvents(blinkFits, blinkProperties)
%% Create an events structure with a standard set of blink events
%
%  Parameters:
%      blinkFits         structure produced by the BLINKER software
%      blinkProperties   structure produced by the BLINKER software
%      events            (output) structure with type, latency, duration, 
%                        usertags, and hedtags fields
%
%  Written by:  Kay Robbins, UTSA, 2017
%
   if isempty(blinkFits) || ~isfield(blinkFits, 'maxFrame')
       warning('insertBlinkEvents:NoBlinks', 'Dataset has no blinks');
       events = struct();
       return;
   end
   theLatencies = cellfun(@double, {blinkFits.maxFrame});
   numEvents = length(theLatencies);
   if numEvents == 0;
       return;
   end
   
%% Create the events
   events(numEvents) = struct('type', NaN, 'latency', NaN, ...
                              'duration', NaN, 'usertags', NaN, ...
                              'hedtags', NaN);
   userTags = ['/Event/Category/Incidental,' ...
          '/Event/Label/BlinkMax,' ...
          '/Event/Long name/Time of maximum blink amplitude,' ...
          '/Event/Description/Time of blink signal first reaches maximum,' ...
          '/Action/EyeBlink/Max'];
   for k = 1:numEvents
       events(k) = events(numEvents);
       events(k).type = 'blinkMax';
       events(k).latency = blinkFits(k).maxFrame;
       events(k).duration = 0;
       events(k).usertags = userTags;
       events(k).hedtags = ...
           ['/Attribute/Blink/Duration/' ...
             num2str(blinkProperties(k).durationHalfZero) ' s,' ...
            '/Attribute/Blink/PAVR/' ...
             num2str(blinkProperties(k).posAmpVelRatioBase) ' cs,' ...
            '/Attribute/Blink/NAVR/' ...
             num2str(blinkProperties(k).negAmpVelRatioBase) ' cs'];      
   end 
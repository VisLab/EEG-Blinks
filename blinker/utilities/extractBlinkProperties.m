function [blinkProps, blinkFits] = ...
                          extractBlinkProperties(blink, blinkPositions, srate)
% Return a structure with blink properties for individual blinks
%
% Parameters:
%    dBlinks 
%      'number', [], ...
%     'tentDuration', [],  'blinkZeroDuration', [], ...
%      'baseHalfDuration', [], 'zeroHalfDuration', [],...
%     'interBlinkTimeMaxAmp', [], 'interBlinkTimeMaxVel',[], ...
%     'timeShutVel', [], 'timeShutAmp', [], ...
%     'negAmpVelRatioZero', [], 'posAmpVelRatioZero', [], ...
%     'negAmpVelRatioTent', [], 'posAmpVelRatioTent', [], ...
%     'negAmpVelRatioBase', [], 'posAmpVelRatioBase', [], ...
%     'closingTime', [], 'reopeningTime', [], ...
%     'leftR2', [], 'rightR2', [], ...
%     'tentPeakTime', [],  'blinkPeakTime', [],  'tentPeak', [], ...
%     'blinkPeak', [], 'leftPeakBelow', [], 'rightPeakBelow', []);
%% Initial parameters
shutAmpFraction = 0.9;
baseLevel = 0;
numberBlinks = size(blinkPositions, 2);

%% Initialize the blinkProps structure
blinkProps(numberBlinks) = createPropertiesStructure();
for k = 1:numberBlinks
    blinkProps(k) = createPropertiesStructure();
end

%% Compute the fits
blinkFits = fitBlinks(blink, blinkPositions, baseLevel);
if isempty(blinkFits)
    return;
end
blinkVelocity = diff(blink);
peaks = cell2mat({blinkFits.maxFrame});
peaks = [peaks length(blink)];
peaksPosVelZero = ones(size(peaks));
peaksPosVelZero(end) = length(blink);
peaksPosVelBase = ones(size(peaks));
peaksPosVelBase(end) = length(blink);
for k = 1:numberBlinks
    try
        blinkProps(k).number = k;
        %% Blink durations
        blinkProps(k).durationBase = (blinkFits(k).rightBase - blinkFits(k).leftBase)./srate;
        blinkProps(k).durationTent = ...
            (blinkFits(k).rightXIntercept - blinkFits(k).leftXIntercept)./srate;
        blinkProps(k).durationZero = (blinkFits(k).rightZero - blinkFits(k).leftZero)./srate;
        blinkProps(k).durationHalfBase = ...
            (blinkFits(k).rightBaseHalfHeight - blinkFits(k).leftBaseHalfHeight + 1)./srate;
        blinkProps(k).durationHalfZero = ...
            (blinkFits(k).rightZeroHalfHeight - blinkFits(k).leftZeroHalfHeight + 1)./srate;
        
        %% Blink amplitude-velocity ratio from zero to max
        upStroke = blinkFits(k).leftZero:blinkFits(k).maxFrame;
        [~, velFrame] = max(blinkVelocity(upStroke));
        velFrame = velFrame(1) + upStroke(1) - 1;
        peaksPosVelZero(k) = velFrame;
        blinkProps(k).posAmpVelRatioZero = ...
            100*abs(blink(blinkFits(k).maxFrame)./blinkVelocity(velFrame))/srate;
        
        downStroke = blinkFits(k).maxFrame:blinkFits(k).rightZero;
        [~, velFrame] = min(blinkVelocity(downStroke));
        velFrame = velFrame(1) + downStroke(1) - 1;
        blinkProps(k).negAmpVelRatioZero = ...
            100*abs(blink(blinkFits(k).maxFrame)./blinkVelocity(velFrame))/srate;
        
      %% Blink amplitude-velocity ratio from base to max        
        upStroke = blinkFits(k).leftBase:blinkFits(k).maxFrame;
        [~, velFrame] = max(blinkVelocity(upStroke));
        velFrame = velFrame(1) + upStroke(1) - 1;
        peaksPosVelBase(k) = velFrame;
        blinkProps(k).posAmpVelRatioBase = ...
            100*abs(blink(blinkFits(k).maxFrame)./blinkVelocity(velFrame))/srate;
        
        downStroke = blinkFits(k).maxFrame:blinkFits(k).rightBase;
        [~, velFrame] = min(blinkVelocity(downStroke));
        velFrame = velFrame(1) + downStroke(1) - 1;
        blinkProps(k).negAmpVelRatioBase = ...
            100*abs(blink(blinkFits(k).maxFrame)./blinkVelocity(velFrame))/srate;
 
       %% Blink amplitude-velocity ratio estimated from tent slope    
        averNegVel = blinkFits(k).rightPCoef(1)./blinkFits(k).rightMuCoef(2);
        blinkProps(k).negAmpVelRatioTent = ...
            100*abs(blink(blinkFits(k).maxFrame)./averNegVel)/srate;
        averPosVel = blinkFits(k).leftPCoef(1)./blinkFits(k).leftMuCoef(2);
        blinkProps(k).posAmpVelRatioTent = ...
            100*abs(blink(blinkFits(k).maxFrame)./averPosVel)/srate; 

  
        %% Time zero shut
        blinkProps(k).closingTimeZero = (blinkFits(k).maxFrame - blinkFits(k).leftZero)./srate;
        blinkProps(k).reopeningTimeZero = (blinkFits(k).rightZero - blinkFits(k).maxFrame)./srate;
        thisBlinkAmp = blink(blinkFits(k).leftZero:blinkFits(k).rightZero);
        ampThreshhold = shutAmpFraction*blinkFits(k).maxValue;
        startShut = find(thisBlinkAmp >= ampThreshhold, 1, 'first');
        endShut = find(thisBlinkAmp(startShut+1:end) < ampThreshhold, 1, 'first');
        if isempty(endShut)
            blinkProps(k).timeShutZero = 0;
        else
            blinkProps(k).timeShutZero = endShut./srate;
        end
        
        %% Time base shut
        thisBlinkAmp = blink(blinkFits(k).leftBase:blinkFits(k).rightBase);
        ampThreshhold = shutAmpFraction*blinkFits(k).maxValue;
        startShut = find(thisBlinkAmp >= ampThreshhold, 1, 'first');
        endShut = find(thisBlinkAmp(startShut+1:end) < ampThreshhold, 1, 'first');
        if isempty(endShut)
            blinkProps(k).timeShutBase = 0;
        else
            blinkProps(k).timeShutBase = endShut./srate;
        end
        %% Time shut tent
        blinkProps(k).closingTimeTent = (blinkFits(k).xIntersect - ...
                             blinkFits(k).leftXIntercept)./srate;
        blinkProps(k).reopeningTimeTent = (blinkFits(k).rightXIntercept - ...
                             blinkFits(k).xIntersect)./srate;
        thisBlinkAmp = blink(round(blinkFits(k).leftXIntercept): ...
                             round(blinkFits(k).rightXIntercept));
        ampThreshhold = shutAmpFraction*blinkFits(k).maxValue;
        startShut = find(thisBlinkAmp >= ampThreshhold, 1, 'first');
        endShut = find(thisBlinkAmp(startShut+1:end) < ampThreshhold, 1, 'first');
        if isempty(endShut)
            blinkProps(k).timeShutTent = 0;
        else
            blinkProps(k).timeShutTent = endShut./srate;
        end
        
        %% Other times
        blinkProps(k).peakMaxBlink = blinkFits(k).maxValue;
        blinkProps(k).peakMaxTent = blinkFits(k).yIntersect;
        blinkProps(k).peakTimeTent = blinkFits(k).xIntersect./srate;
        blinkProps(k).peakTimeBlink = blinkFits(k).maxFrame./srate;
  
        blinkProps(k).interBlinkMaxAmp = (peaks(k+1) - peaks(k))./srate;
        blinkProps(k).interBlinkMaxVelBase = (peaksPosVelBase(k+1) - peaksPosVelBase(k))./srate;
        blinkProps(k).interBlinkMaxVelZero = (peaksPosVelZero(k+1) - peaksPosVelZero(k))./srate;
    catch Mex
        fprintf('Failed on blink %d: %s\n', k, Mex.message);
    end
end
blinkProps(end).interBlinkMaxAmp = NaN;
blinkProps(end).interBlinkMaxVelBase = NaN;
blinkProps(end).interBlinkMaxVelZero = NaN;

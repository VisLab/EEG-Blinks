function s = createFitStructure()

s = struct( ...
    'number', nan, ...
    'maxFrame', nan, ... % Frame number of the maximum
    'maxValue', nan, ... % value of the blink maximum
    'leftOuter', nan, ... % 
    'rightOuter', nan, ... % 
    'leftZero', nan, ... % first baseLevel crossing or minimum between blinks on left 
    'rightZero', nan, ... % first baseLevel crossing or minimum between blinks on
    'leftBase', nan, ... % 
    'rightBase', nan, ... %  
    'leftBaseHalfHeight', nan, ... % 
    'rightBaseHalfHeight', nan, ... % 
    'leftZeroHalfHeight', nan, ... % 
    'rightZeroHalfHeight', nan, ... % 
    'leftRange', nan, ... %
    'rightRange', nan, ... %
    'leftSlope', nan, ... % 
    'rightSlope', nan, ... % 
    'leftPCoef', nan, ... % 
    'leftSCoef', nan, ... % 
    'leftMuCoef', nan, ... % 
    'leftR2', nan, ... % 
    'rightPCoef', nan, ... % 
    'rightSCoef', nan, ... % 
    'rightMuCoef', nan, ... % 
    'rightR2', nan, ... % 
    'xIntersect', nan, ... % 
    'yIntersect', nan, ... % 
    'leftXIntercept', nan, ... % 
    'rightXIntercept', nan);

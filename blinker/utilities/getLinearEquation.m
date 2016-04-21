function [m, b, R2] = getLinearEquation(x, y)
% Return the linear fit of x versus y after discounting NaN's
%
% Parameters:
%    x       independent variable for linear fit
%    y       dependent variable for linear fit
%    m       (output) slope of the linear fit
%    b       (output) intercept of lienar fit
%    R2      (output) correlation of y and its prediction
%
% Note: We use the centered version of polyfit and then translate back
% for return values
%    
     NaNPositions = isnan(x) | isnan(y);
     x = x(~NaNPositions);
     y = y(~NaNPositions);
     [p, S, mu] = polyfit(x, y, 1);
     yPred = polyval(p, x, S, mu);
     R2 = corr(yPred(:), y(:));
     m = p(1)/mu(2);
     b = p(2) - mu(1)*p(1)/mu(2);
end


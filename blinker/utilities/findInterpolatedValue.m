function yInterpolated = findInterpolatedValue(xValues, yValues, x)
% Find interpolated value of y given x in function (xValues, yValues)
%
% Parameters:
%    xValues         vector of x values of ordered pairs
%    yValues         vector of y values of ordered pairs
%    x               value at which to evaluate the function
%    yInterpolated   interpolated function value

yInterpolated = NaN;
xValues = xValues(:);
yValues = yValues(:);
if isempty(xValues) || isempty(yValues) || length(xValues) ~= length(yValues)
    return;
end

if x <= xValues(1)
    yInterpolated = yValues(1);
    return;
elseif x >= xValues(end)
    yInterpolated = yValues(end);
    return;
end

highIndex = find(x <= xValues, 1, 'first');
if xValues(highIndex) == x
    yInterpolated = yValues(highIndex);
else
    slope = (yValues(highIndex) - yValues(highIndex - 1))./...
            (xValues(highIndex) - xValues(highIndex - 1));
    yInterpolated = yValues(highIndex) + slope*(x - xValues(highIndex));
end



    
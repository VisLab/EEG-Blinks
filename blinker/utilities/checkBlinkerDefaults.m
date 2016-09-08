function [structOut, errors] = checkBlinkerDefaults(structIn, defaults)
% Check structIn input parameters against defaults put in structOut
errors = cell(0);
fNames = fieldnames(defaults);
structOut = struct();
for k = 1:length(fNames)
    try
       nextValue = getStructureParameters(structIn, fNames{k}, ...
                                          defaults.(fNames{k}).value);
       validateattributes(nextValue, defaults.(fNames{k}).classes, ...
                         defaults.(fNames{k}).attributes);
       structOut.(fNames{k}) = nextValue;
    catch mex
        errors{end+1} = [fNames{k} ' invalid: ' mex.message]; %#ok<AGROW>
    end
end

function p = getStructureParameters(mystruct, myfield, value)
% Sets p to mystruct.myfield if it exists, other assigns it to value
if  ~exist('value', 'var') && ~isfield(mystruct, myfield)
    error('Either value of mystruct.myfield must exist');
elseif exist('value', 'var') && ~isfield(mystruct, myfield) 
    p = value;
else
    p = mystruct.(myfield);
end
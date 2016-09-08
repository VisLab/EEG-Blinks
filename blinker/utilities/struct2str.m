% Converts a structure into a string command used to recreate it.
%
% Usage:
%
%   >>  str = struct2str(struct);
% Input:
%
%       Required:
%
%       struct
%                   A scalar structure.
%
% Output:
%
%       str
%                   A string command that recreates the structure passed
%                   in.
%
% Copyright (C) 2015 Jeremy Cockfield jeremy.cockfield@gmail.com and
% Kay Robbins, UTSA, kay.robbins@utsa.edu
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA

function str = struct2str(structure)
str = '';
fNames = fieldnames(structure);
if ~isempty(fNames)
    str = ['struct(' field2str(structure, fNames, 1)];
    for indx = 2:length(fNames)
        str = [str ', ' field2str(structure, fNames, indx)]; %#ok<AGROW>
    end
    str = [str ');'];
end

    function str = field2str(structure, fNames, indx)
        % Checks the structure field and correctly handles it
        if iscellstr(structure.(fNames{indx}))
            str = cell2str(structure, fNames, indx);
        elseif ischar(structure.(fNames{indx}))
            str = str2str(structure, fNames, indx);
        elseif islogical(structure.(fNames{indx}))
            str = logical2str(structure, fNames, indx);
        else
            str = numerical2str(structure, fNames, indx);
        end
    end % field2str

    function str = logical2str(structure, fNames, indx)
        % Converts a logical structure field to a string
        if structure.(fNames{indx})
            str = ['''' fNames{indx} ''', true'];
        else
            str = ['''' fNames{indx} ''', false'];
        end
    end  % logical2str

    function str = numerical2str(structure, fNames, indx)
        % Converts a numerical structure field to a string
        if isscalar(structure.(fNames{indx}))
            str = ['''' fNames{indx} ''', ' ...
                num2str(structure.(fNames{indx})) ];
        else
            str = ['''' fNames{indx} ''', ' ...
                mat2str(structure.(fNames{indx}))];
        end
    end % numerical2str

    function str = str2str(structure, fNames, indx)
        % Converts a str structure field to a string
        str = ['''' fNames{indx} ''', ' ...
            '''' structure.(fNames{indx}) ''''];
    end % str2str

    function str = cell2str(structure, fNames, indx)
        % Converts a cellstr structure field to a string
        numElements = length(structure.(fNames{indx}));
        str = ['''' fNames{indx} ''', ' ... 
            '{{''' structure.(fNames{indx}){1} ''''];
        for b = 2:numElements
            str = [str ', ''' ...
                structure.(fNames{indx}){b} '''']; %#ok<AGROW>
        end
        str = [str '}}'];
    end % cell2str

end % struct2str
% eegplugin_blinker() - a wrapper to blinker pipeline
% 
% Usage:
%   >> vers = eegplugin_blinker(fig, try_strings, catch_strings);
%
%   see also: pop_blinker, runBlinkerPipeline

% Author: Kay Robbins and Kelly Kliefgas, 2016

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
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

function vers = eegplugin_blinker(fig, trystrs, catchstrs) 
%% Adds blinker as a plugin under the tools menu on EEGLAB

%% Set the version number
vers = 'blinker1.0.0';

%% Add subfolders
tmp = which('getBlinkerDefaults');
if isempty(tmp)
    myPath = fileparts(which('pop_blinker'));
    addpath(genpath(myPath));
end;

%% Create menu
comprep = [trystrs.no_check '[EEG LASTCOM] = pop_blinker(EEG);' ...
           catchstrs.new_and_hist];
menu = findobj(fig, 'tag', 'tools');
uimenu( menu, 'Label', 'Run Blinker', 'callback', comprep, ...
    'separator', 'on');


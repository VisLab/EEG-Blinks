% eegplugin_blinker() - a wrapper to blinker pipeline
% 
% Usage:
%   >> eegplugin_blinker(fig, try_strings, catch_strings);
%
%   see also: pop_blinker, runBlinkerPipeline

% Author: Kay Robbins and Kelly Kliegfas

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

%function eegplugin_clean_rawdata(fig,try_strings,catch_strings)

% create menu
% toolsmenu = findobj(fig, 'tag', 'tools');
% uimenu( toolsmenu, 'label', 'Clean continuous data using ASR', 'separator','on',...
%    'callback', 'EEG = pop_clean_rawdata(EEG); [ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG); eeglab redraw');

% eegplugin_prepPipeline() - the PREP pipeline plugin
function eegplugin_blinker(fig, trystrs, catchstrs) 
 
% create menu
comprep = [trystrs.no_check '[EEG LASTCOM] = pop_blinker(EEG);' catchstrs.new_and_hist];
menu = findobj(fig, 'tag', 'tools');
uimenu( menu, 'Label', 'Run Blinker', 'callback', comprep, ...
    'separator', 'on');


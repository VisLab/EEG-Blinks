function [] = dumpBlinkGroups(outDir, dataName, blinkGroups, ...
                signalData, srate, usedSignal, blinkFits, blinkProperties)
%% Plot overlaid traces for individual blink groups and marked if available
% 
% Parameters:
%     outDir      directory in which the images and index file are dumped
%     blinkGroups n x (m+1) array with blink groups and approximate position
%     signalData  signalData structure array for m group members
%     srate       sampling rate for the signalData
%     usedSignal  signal corresponding to blinkFits
%     blinkFits   blinkFit structure for signal to mark as "real"
%     blinkProperties   blinkProperties structure for signal to mark "real"
%
% This function creates an HTML index file for viewing all of the images
% on a single page of the blink groups 
%
%
% BLINKER extracts blinks and ocular indices from time series. 
% Copyright (C) 2016  Kay A. Robbins, Kelly Kleifgas, UTSA
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% Set up the parameters
if nargin < 7
    error('dumpBlinkGroups:NotEnoughParameters', 'Must have 7 arguments');
end

%% Create the plot directories
if ~exist(outDir, 'dir')
    mkdir(outDir);
end
dataDir = [outDir filesep dataName];
if ~exist(dataDir, 'dir')
    mkdir(dataDir);
end

%% Used group
signalNumbers = cellfun(@double, {signalData.signalNumber});
pos = find(signalNumbers == usedSignal, 1, 'first');
if isempty(pos)
    error('dumpBlinkGroups:NoUsedSignal', ...
          'Must have used signal in signalData');
end
%% Open the index file
fid = fopen([dataDir filesep 'index.html'], 'w');
fprintf(fid, '<h1>%s</h1>\n', dataName);
fprintf(fid, '<ol>\n');

%% Set up a map of positions to actual blinks for the used signal
blinkMap = containers.Map('KeyType', 'double', 'ValueType', 'double');
for k = 1:length(blinkFits)
    blinkMap(blinkFits(k).number) = k;
end

%% Plot each blink group
extendSeconds = 0.5;   % Maximum seconds to extend on either side of blink
numberGroups = size(blinkGroups, 1);
for k = 1:numberGroups
    thisGroup = blinkGroups(k, :);
    if isKey(blinkMap, thisGroup(pos))
        actualNumber = blinkMap(thisGroup(pos));
        theseProps = blinkProperties(actualNumber);
    else
        actualNumber = 0;
        theseProps = [];
    end
    figHan = plotBlinkGroup(num2str(k), dataName, srate, extendSeconds, ...
        thisGroup, signalData, usedSignal, actualNumber, theseProps);
    fileName = [dataName num2str(k) '.png'];
    saveas(figHan, [dataDir filesep fileName], 'png');
    close(figHan);
    fprintf(fid, '<li><img src="%s" alt="%s"></li>\n', fileName, dataName);
end
fprintf(fid, '</ol>\n');
fclose(fid);

%% Script to combine multiple datasets from the same subject and sitting
% into a single dataset for calculating distributions of maximum blinks.
% This script is used for situations where a larger dataset has been
% split to put each task into a separate dataset and the resulting pieces
% are too short to give good blink statistics. The script
% uses the combined distribution of the blink maxima to determine which
% channel should be selected as the "usedSignal".  The other parameters
% are determined by the calculations on the individual datasets.

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
%
%% Set the baseline parameters for the maximum blink amplitude distribution
correlationTop = 0.98;
correlationBottom = 0.90;
cutoffRatioThreshold = 0.7;  

%% Shooter
experiment = 'shooter';
blinkDir = 'O:\ARL_Data\Shooter\BlinkOutput';
typeBlinks = 'AllMastRef';
excludedTasks = {'EC', 'EO'};
blinkFileList = [blinkDir filesep experiment '_blinkFileInfo.mat'];
blinkIndir = [blinkDir filesep typeBlinks];


%% BCI2000
% experiment = 'BCI2000';
% blinkDir = 'O:\ARL_Data\BCI2000\BCI2000BlinksNewRefactored';
% excludedTasks = {'EyesOpen', 'EyesClosed'};
% typeBlinks = 'AllMastNewBoth';
% fileListName = 'BCI2000FileList.mat';

%% Read in the files and make the directories
typeBlinksCombined = [typeBlinks 'Combined'];
blinkOutdir = [blinkDir filesep typeBlinksCombined];
if ~exist(blinkOutdir, 'dir')
    mkdir(blinkOutdir);
end;

%% Load the file list
load(blinkFileList);

%% Calculate the remap
[blinkRemap, signalMap] = getRemapBySubject(blinkIndir, blinkFiles, typeBlinks, ...
    excludedTasks, correlationTop, correlationBottom, cutoffRatioThreshold);

%% Now remap
combinedFile = [experiment 'BlinksNew' typeBlinks 'CombinedMaps.mat'];
save ([blinkDir filesep combinedFile], 'blinkRemap', 'signalMap', '-v7.3');

%% Now remap
remapBySubject(blinkIndir, blinkOutdir, blinkRemap);
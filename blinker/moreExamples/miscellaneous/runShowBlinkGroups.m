%% Display individual images of blink groups with blink numbers
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
% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2007_T2X2_R1_T2_M021_AllUnrefNewBothBlinks';
% dataName = 'BCITLevel0_S2007_T2X2_R1_T2_M021';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2008_XB_R1_T2_M023_AllUnrefNewBothBlinks';
% dataName = 'BCITLevel0_S2008_XB_R1_T2_M023';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2018_XB_R1_T2_M053_AllUnrefNewBothBlinks';
% dataName = 'BCITLevel0_S2018_XB_R1_T2_M053';

% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% groupDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBothGroups';
% blinkFile = 'BCITLevel0_S2019_T2X2_R1_T2_M056_AllUnrefNewBothBlinks';
% dataName = 'BCITLevel0_S2019_T2X2_R1_T2_M056';

%% VEP example -- assumes a blink info file has been created
experiment = 'vep';
blinkDir = 'O:\ARL_Data\VEP\BlinkOutput\AllUnRefA';
blinkFile = 'vep_01_oddball_AllUnRefA';
groupDir = 'O:\ARL_Data\VEP\BlinkOutput\AllUnRefAGroups';
dataName = 'vep_01_oddball_AllUnRefA_Grouped';

%% Set the output directory
outDir = [groupDir filesep dataName];
%% Load the blinks file
load([groupDir filesep blinkFile 'Grouped.mat'])
load([blinkDir filesep blinkFile]);

%% Display the individual blink groups
dumpBlinkGroups(outDir, dataName, blinkGroups, signalData, srate, ...
                blinks.usedSignal, blinkFits, blinkProperties)

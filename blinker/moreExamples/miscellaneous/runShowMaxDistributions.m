% Test script to show maximum distributions
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
%% Set up the directory
params = struct();
params.correlationThresholdTop = 98;
params.correlationThresholdBottom = 90;
% blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
% blinkFile = 'BCITLevel0_S2018_XB_R1_T2_M053_AllUnrefNewBothBlinks';

blinkDir = 'O:\ARL_Data\BCITBlinksNewRefactored\BCITLevel0AllUnrefNewBoth';
blinkFile = 'BCITLevel0_S2019_T2X2_R1_T2_M056_AllUnrefNewBothBlinks';

%% Load the directory
load([blinkDir filesep blinkFile]);

%% Show the
fighan = showMaxDistribution(blinks, blinkFits, params);
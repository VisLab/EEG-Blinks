function [] = remapBySubjectAndDay(blinkIndir, blinkOutdir, blinkRemap)
%% Given a remap by subject and day, reselect a channel for each file in blinkIndir
%
% Parameters:
%   blinkIndir    directory with blinker files for individual data
%   blinkOutdir   directory (not blinkIndir) to write new blinker files
%                 with the channel reselected by combination
%   blinkRemap    the remap structure computed from getRemapBySubject
%
% Notes: The blinker files for the individual data files contain 4 
% structures -- blinks, blinkFits, blinkProperties, and params.  These
% should have been run with the keepSignals option to true so that
% the remap function can work with all of the signals that pass the
% blink amplitute ratio test.
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

%% Find the list of input files
inList = dir(blinkIndir);
dirNames = {inList(:).name};
dirTypes = [inList(:).isdir];
fileNames = dirNames(~dirTypes);

%% Now create the new blinks file
subjects = {blinkRemap.subjectID};
startDays = {blinkRemap.startDate};
for k = 1:length(fileNames)
    blinks = []; blinkFits = []; blinkProperties = []; params = []; %#ok<*NASGU>
    fprintf('Processing %d: %s\n', k, fileNames{k});
    [thePath, theName, theExt] = fileparts(fileNames{k});
    inName = [blinkIndir filesep theName theExt];
    outName = [blinkOutdir filesep theName 'Combined.mat'];
    try
       blinks = []; blinkFits = []; blinkProperties = []; 
       blinkStatistics = [];params = [];
       lTemp = load(inName);
       blinks = lTemp.blinks;
       blinkFits = lTemp.blinkFits;
       blinkProperties = lTemp.blinkProperties;
       blinkStatistics = lTemp.blinkStatistics;
       params = lTemp.params;
 
    catch mex
        warning('----%s does not exist (%s)....', inName, mex.message);
        continue;
    end
    if ~exist('blinks', 'var')
        warning('----%s has no blinks structure', inName);
        continue;
    end
    theSubject = blinks.subjectID;
    theDay = datestr(floor(blinks.startTime), 'dd-mmm-yyyy');
    pos = find(strcmpi(subjects, theSubject) & strcmpi(startDays, theDay), ...
               1, 'first');
    rmap = blinkRemap(pos);
    used = rmap.usedSignal;
    if ~ischar(used) || isnan(blinks.usedSignal)
        blinks.usedSignal = NaN; %#ok<*SAGROW>
        blinkProperties = [];
        blinkFits = [];
        blinks.status = ['Recombined failed old[' blinks.status ']'];
        saveFiles(outName);
        warning('---%s: %s', outName, blinks.status);
        continue;
    end
    rmapPos = find(strcmpi(rmap.signalLabels, used), 1, 'first');
    sData = blinks.signalData;
    myLabels = {sData.signalLabel};
    pos = find(strcmpi(myLabels, used), 1, 'first');
    if ~isempty(pos)
        sData = sData(pos);
        sData.signalType = 'RemappedBySubject';
        sData.bestMedian = rmap.bestMedians(rmapPos);
        sData.bestRobustStd = rmap.bestRobustStds(rmapPos);
        sData.goodRatio = rmap.goodRatios(rmapPos);
        sData.cutoff = rmap.cutoffs(rmapPos);

        if sData.signalNumber ~= abs(blinks.usedSignal)
            sData.blinkAmplitudeRatio = NaN;
            [blinkProperties, blinkFits] = ...
                extractBlinkProperties(sData, params); %#ok<*ASGLU>
            blinkStatistics = extractBlinkStatistics(blinks, blinkFits, ...
                                                  blinkProperties, params); 
            fprintf('---%s: changed from %d to %d\n', ...
                inName, blinks.usedSignal, sData.signalNumber);
        end
        blinks.signalData = sData;
        blinks.usedSignal = rmap.usedSign*sData.signalNumber;
    else
        blinks.usedSignal = NaN; %#ok<*SAGROW>
        blinkProperties = [];
        blinkFits = [];
        blinkStatistics = [];
        blinks.status = ['Recombined failed old[' blinks.status ']'];
        warning('---%s: %s', inName, blinks.status);
    end
    saveFiles(outName);
end

   function [] = saveFiles(fileName)
       save(fileName, 'blinks', 'blinkFits',  'blinkProperties', ...
           'blinkStatistics', 'params', '-v7.3');
   end
end
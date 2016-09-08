% params = struct();
% defaults = getBlinkerDefaults(EEG);  
% [params, errors] = checkBlinkerDefaults(params, defaults);
fName = 'D:\Research\Blinks\BlinkDetectionCurrentWorkingRefactored\eeglab13_6_5b\sample_data\';
fName = [fName filesep 'eeglab_data_wchans_ica.mat'];
load(fName); 
params = checkBlinkerDefaults(struct(), getBlinkerDefaults(EEG));
params.signalTypeIndicator = 'UseICs';
[EEG, blinks, blinkFits, blinkProperties, params, com] = pop_blinks(EEG, params);

% %%
% signalNumbers = cellfun(@double, {blinks.signalData.signalNumber});
% signalIndex = find(signalNumbers == abs(blinks.usedSignal), 1, 'first');
% traceName = blinks.signalData(signalIndex).signalType;
% blinkTrace = blinks.signalData(signalIndex).signal;
% dumpIndividualBlinks(blinks, blinkFits, blinkTrace, ...
%     traceName, params.blinkerDumpDir)
% 
% %%
% fileOut = [params.blinkerDumpDir filesep blinks.uniqueName 'leftZeros.txt'];
% dumpDatasetLeftZeros(fileOut, blinkFits, blinks.srate)
 
%%
fighan = showMaxDistribution(blinks, blinkFits);


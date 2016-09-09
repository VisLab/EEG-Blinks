function outputBlinkStatistics(blinkStatistics, fid)
%% Output the blink information for an EEG dataset to the file fid
%
%  Parameters:
%     blinkStatistics   structure containing
%     fid               (optional) open file descriptor (use 1 for 
%                       command window

%% Check the arguments
if nargin == 1
    fid = 1;
end
%% Now output the values
fprintf(fid, '------------------BLINKER OUTPUT -----------------------\n');
fprintf(fid, 'File: %s\n', blinkStatistics.fileName);
fprintf(fid, 'Status: %s\n', blinkStatistics.status);
if strcmpi(blinkStatistics.status, 'failed')
    return;
end
fprintf(fid, 'SubjectID: %s, task: %s, unique name:%s\n', ...
    blinkStatistics.subjectID', blinkStatistics.task, ...
    blinkStatistics.uniqueName);
fprintf(fid, 'Sampling rate: %d, start time: %s, length: %g seconds\n', ...
    blinkStatistics.srate, datestr(blinkStatistics.startTime), ...
    blinkStatistics.seconds);
fprintf(fid, 'Channel number: %d, channel label: %s\n', ...
    blinkStatistics.usedNumber, blinkStatistics.usedLabel);
fprintf(fid, 'Total blinks: %d,  good blinks: %d, good ratio: %g\n', ...
    blinkStatistics.numberBlinks, blinkStatistics.numberGoodBlinks, ...
    blinkStatistics.goodRatio);
fprintf(fid, 'Blinks/min: %g,  good blinks/min: %g\n', ...
    blinkStatistics.blinksPerMin(1), blinkStatistics.blinksPerMin(5));
fprintf(fid, '                       mean     median     std     mad\n');
fprintf(fid, 'pAVRZ (all):        %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.pAVRZ(1:4));
fprintf(fid, 'pAVRZ (good):       %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.pAVRZ(5:8));
fprintf(fid, 'nAVRZ (all):        %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.nAVRZ(1:4));
fprintf(fid, 'nAVRZ (good):       %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.nAVRZ(5:8));
fprintf(fid, 'durationZ (all):    %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationZ(1:4));
fprintf(fid, 'durationZ (good):   %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationZ(5:8));
fprintf(fid, 'durationB (all):    %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationB(1:4));
fprintf(fid, 'durationB (good):   %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationB(5:8));
fprintf(fid, 'durationT (all):    %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationT(1:4));
fprintf(fid, 'durationT (good):   %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationT(5:8));
fprintf(fid, 'durationHZ (all):   %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationHZ(1:4));
fprintf(fid, 'durationHZ (good):  %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationHZ(5:8));
fprintf(fid, 'durationHB (all):   %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationHB(1:4));
fprintf(fid, 'durationHB (good):  %8.3f %8.3f %8.3f %8.3f\n', ...
        blinkStatistics.durationHB(5:8));
         

end
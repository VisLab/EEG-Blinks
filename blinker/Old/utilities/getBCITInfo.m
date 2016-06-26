function [subjectID, experiment, uniqueName, task, startTime] = ...
                                                          getBCITInfo(EEG)
       
%% Process the time
   pivotYear = 2000;
   formatIn = 'dd.mm.yy HH.MM.SS';
   theDate = [EEG.etc.date ' ' EEG.etc.time];
   startTime = datenum(theDate, formatIn, pivotYear);

%% Process the trial information
   theTrial = EEG.etc.TrialData;
   subjectID = ['S' theTrial.subject];
   experiment = ['X' theTrial.experiment];
   uniqueName = [theTrial.org '_' theTrial.program '_T' theTrial.task ...
            '_M' theTrial.mission '_S' theTrial.subject ...
            '_X' theTrial.experiment '_C' theTrial.condition ...
            '_R' theTrial.run '_EEG'];
   task = [experiment '_C' theTrial.condition];       
end
%% Run the blink detector on the VEP dataset
addpath('../');
basename = '';
pop_editoptions('option_single', false, 'option_savetwofiles', false);
indir = 'Z:\\Data 2\KellyNew\NCTU_Robust_0p5HzHP_ICA_Infomax\session\67';
blinkFile = 'NCTU_67_blinks.mat';



%% Set the experimental conditions
subjects = {'67'};
numberSubjects = length(subjects);
fileNames = cell(numberSubjects, 1);
params = struct('detrendCutoff', 1, 'detrendChannels', []);

%% Gather the filenames
clear blinks;

blinks(numberSubjects) = createBlinkStructure();
for k = 1:numberSubjects
    thisName = sprintf('eeg_studyLevelDerived_hpICA__NCTU_Lane-Keeping_Task_session_67_subject_1_task_motionless_s54_081209n_recording_1.set');
    fileNames{k} = [indir filesep thisName];
    try
       EEG = pop_loadset(fileNames{k});
       blinks(k) = extractEEGBlinks(EEG);
       blinks(k).fileName = thisName;
    catch mex
        warning('%s failed with error %s', thisName, mex.message);     
    end
end

%% Save the blinks
save (blinkFile, 'blinks', '-v7.3');

%% Display the blink components
for k = 1:numberSubjects
    bComponent = blinks(k).blinkComponent;
    if isempty(bComponent)
        continue;
    end
    figure
    t = 1:length(bComponent);
    t = (t - 1)/blinks(k).srate;
    plot(t, blinks(k).blinkComponent);
    xlabel('Seconds');
    ylabel('Activation');
    title([blinks(k).fileName ': blink component'], 'Interpreter', 'none');
end 
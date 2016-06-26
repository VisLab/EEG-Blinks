%% Run the blink detector on the VEP dataset


basename = 'vep';
pop_editoptions('option_single', false, 'option_savetwofiles', false);
indir = 'Z:\\Data 2\KellyNew\VEP_Robust_1Hz_ICA';
blinkFile = 'e:\\KK_compare_fit\vepBlinksNew.mat';



%% Set the experimental conditions
subjects = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', ...
            '11', '12', '13', '14', '15', '16', '17', '18'};
numberSubjects = length(subjects);
fileNames = cell(numberSubjects, 1);
params = struct('detrendCutoff', 1, 'detrendChannels', []);

%% Gather the filenames
clear blinks;

blinks(numberSubjects) = createBlinkStructure();
for k = 1:18
    thisName = sprintf('%s_%02d.set', basename, k);
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
% for k = 1:numberSubjects
%     bComponent = blinks(k).blinkComponent;
%     if isempty(bComponent)
%         continue;
%     end
%     figure
%     t = 1:length(bComponent);
%     t = (t - 1)/blinks(k).srate;
%     plot(t, blinks(k).blinkComponent);
%     xlabel('Seconds');
%     ylabel('Activation');
%     title([blinks(k).fileName ': blink component'], 'Interpreter', 'none');
% end 
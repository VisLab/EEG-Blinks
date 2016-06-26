%% Run the blink detector on the Shooter dataset  
addpath('..\');
basename = 'shooter';
pop_editoptions('option_single', false, 'option_savetwofiles', false);
blinkFile = 'Z:\Data 2\KellyNew\Run_Shooter_Test\shooterBlinks_ICA.mat';
dataDir = 'Z:\Data 3\SHOOTER\Shooter_Robust_1Hz_PrepInfomax';

%% Get the list of files
thisList = dir(dataDir);
theseNames = {thisList(:).name};
theseTypes = [thisList(:).isdir];
theseNames = theseNames(~theseTypes);

%% Iterate through the files
count = 0;
blinks(length(theseNames)) = createBlinkStructure();
for k = 1:length(theseNames)
    ext = theseNames{k}((end-3):end);
    if ~strcmpi(ext, '.set')
        continue;
    end
    thisName = [dataDir filesep theseNames{k}];
    count = count + 1;
    fprintf('%d [%d]: %s\n', count, k, thisName);
    try
        EEG = pop_loadset(thisName);      
        blinks(k) = extractEEGBlinks(EEG);
        blinks(k).fileName = thisName;
    catch mex
        warning('%s failed with error %s', thisName, mex.message);
    end
end

%% Save the blinks
save (blinkFile, 'blinks', '-v7.3');

%% Display the blink components
for k = 1:length(blinks)
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
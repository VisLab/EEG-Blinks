%% VEP setup
% experiment = 'vep';
% blinkDir = 'O:\ARL_Data\VEP\VEPBlinks';
jitter = 0.3;
%% Consolidate BCIT statistics
blinkDir = 'O:\ARL_Data\BCITBlinks';
%experiment = 'Experiment X2 Traffic Complexity';
% experiment = 'Experiment X6 Speed Control';
% experiment = 'X3 Baseline Guard Duty';
% experiment = 'X4 Advanced Guard Duty';
% experiment = 'X1 Baseline RSVP';
experiment = 'Experiment XC Calibration Driving';
% experiment = 'Experiment XB Baseline Driving';
% experiment = 'X2 RSVP Expertise';

%% Set up the files for the collection
matchesFile = [experiment 'MatchICUnrefICEOG.mat'];
blinkFileSuffixes = {'BlinksNewICUnref', 'BlinksNewIC', 'BlinksNewEOG'};
numberCompares = length(blinkFileSuffixes);
blinkStructures = cell(numberCompares, 1);
for k = 1:numberCompares
    blinkFile = [blinkDir filesep experiment blinkFileSuffixes{k}, '.mat'];
    load(blinkFile);
    blinkStructures{k} = blinks;
end

%% Calculate the comparisons
numberFiles = length(blinks);
blinkMatches(numberFiles) = createMatchStructure();
for j = 1:numberFiles
    blinkCompares = cell(numberCompares, 1);
    for k = 1:numberCompares
       blinkCompares{k} = blinkStructures{k}(j);
    end
    blinkMatches(j) = compareBlinks(blinkCompares, jitter);
end

%%
save([blinkDir filesep matchesFile], 'blinkMatches', '-v7.3');
    
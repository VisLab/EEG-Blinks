%% Show normplots and histograms of the different occular indices
numExp = 4;
experiments(numExp) = struct('experiment', [], 'blinkDir', [], ...
                             'type', [], 'excludeTasks', [], ...
                             'occular', [], 'subjects', [], ...
                             'tasks', [], 'positions', [], ...
                             'blinksPerMin', [], 'durationHB', [], ...
                             'pAVRZ', [], 'nAVRZ', []);

experiments(1).experiment = 'BCITLevel0';
experiments(1).blinkDir = 'O:\ARL_Data\BCITBlinks';
experiments(1).type = 'ChannelUnref';
experiments(1).excludeTasks = {};
experiments(2).experiment = 'BCI2000';
experiments(2).blinkDir = 'O:\ARL_Data\BCI2000\BCI2000Blinks';
experiments(2).type = 'Channel';
experiments(2).excludeTasks = {'EyesOpen', 'EyesClosed'};
experiments(3).experiment = 'NCTU_LK';
experiments(3).blinkDir = 'O:\ARL_Data\NCTU\NCTU_Blinks';
experiments(3).type = 'Channel';
experiments(3).excludeTasks = {};
experiments(4).experiment = 'Shooter';
experiments(4).blinkDir = 'O:\ARL_Data\Shooter\ShooterBlinks';
experiments(4).type = 'ChannelUnref';
experiments(4).excludeTasks = {'EC', 'EO'};

%% Read in the occular indices for these collections
expOIndices = cell(numExp, 1);
for k = 1:numExp
   blinkIndicesFile = [experiments(k).experiment 'BlinksNewOccular' ...
                       experiments(k).type '.mat'];
   load([experiments(k).blinkDir filesep blinkIndicesFile]);
   experiments(k).occular = occularIndices;
end

%% Get the masks
for k = 1:numExp
    occular = experiments(k).occular;
    subjects = occular.subjects;
    tasks = occular.tasks;
    positions = 1:length(subjects);
    durationHB = occular.durationHB;
    blinksPerMin = occular.blinksPerMin;
    pAVRZ = occular.pAVRZ;
    nAVRZ = occular.nAVRZ;
    excludeTasks = experiments(k).excludeTasks;
    taskMask = zeros(size(tasks));
    for t = 1:length(excludeTasks)
        taskMask = taskMask | strcmpi(tasks, excludeTasks{t});
    end
    nanMask = isnan(durationHB(:, 1)) | isnan(blinksPerMin(:, 1));
    useMask = ~taskMask(:) & ~nanMask(:);
    experiments(k).subjects = subjects(useMask);
    experiments(k).tasks = tasks(useMask);
    experiments(k).positions = positions(useMask);
    experiments(k).blinksPerMin = blinksPerMin(useMask, :);
    experiments(k).durationHB = durationHB(useMask, :);
    experiments(k).pAVRZ = pAVRZ(useMask, :);
    experiments(k).nAVRZ = nAVRZ(useMask, :);
end 

%%
% figure
% plot(usePerMin, useDuration, 'ko')
% 

% %%
% uniqueSubjects = unique(useSubjects);
% figure
% hold on
% for k = 1:length(uniqueSubjects)
%     thisSubject = strcmpi(useSubjects, uniqueSubjects{k});
%     theseDurations = useDuration(thisSubject);
%     thesePerMins = usePerMin(thisSubject);
%     [sortPerMins, sortInd] = sort(thesePerMins);
%     sortDurations = theseDurations(sortInd);
%     plot(sortPerMins, sortDurations, 'ok-', 'MarkerSize', 8, 'LineWidth', 2);
%     plot(sortPerMins(end), sortDurations(end), 'or', 'MarkerSize', 12, 'LineWidth', 2);
%     plot(sortPerMins(1), sortDurations(1), 'og', 'MarkerSize', 12, 'LineWidth', 2);
%     
% end
% hold off
%%
theColors = [0.7, 0.7, 0.7; 0.5, 0.5, 0.5; 0, 1, 0; 0, 0, 1];

%%
theHandlesB = cell(numExp, 1);
legendHandlesB = zeros(1, numExp);
legendEntriesB = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   blinksPerMin = experiments(k).blinksPerMin(:, 1);
   theHandlesB{k} = normplot(blinksPerMin);
   set(theHandlesB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesB{k}(2), 'LineWidth', 1);
   set(theHandlesB{k}(3), 'LineWidth', 1);
   legendHandlesB(k) = theHandlesB{k}(1);
   legendEntriesB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blinks/min')
legend(legendHandlesB, legendEntriesB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')

%% Good blinks/min
theHandlesGB = cell(numExp, 1);
legendHandlesGB = zeros(1, numExp);
legendEntriesGB = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   blinksPerMin = experiments(k).blinksPerMin(:, 3);
   theHandlesGB{k} = normplot(blinksPerMin);
   set(theHandlesGB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGB{k}(2), 'LineWidth', 1);
   set(theHandlesGB{k}(3), 'LineWidth', 1);
   legendHandlesGB(k) = theHandlesGB{k}(1);
   legendEntriesGB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Good blinks/min')
legend(legendHandlesGB, legendEntriesGB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%% Blink duration
theHandlesGHB = cell(numExp, 1);
legendHandlesGHB = zeros(1, numExp);
legendEntriesGHB = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   durationGHB = experiments(k).durationHB(:, 3);
   theHandlesGHB{k} = normplot(durationGHB);
   set(theHandlesGHB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGHB{k}(2), 'LineWidth', 2);
   set(theHandlesGHB{k}(3), 'LineWidth', 2);
   legendHandlesGHB(k) = theHandlesGHB{k}(1);
   legendEntriesGHB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Good blink duration (s)')
legend(legendHandlesGHB, legendEntriesGHB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
set(gca, 'XLim', [0.05, 0.35])
%% Blink duration
theHandlesHB = cell(numExp, 1);
legendHandlesHB = zeros(1, numExp);
legendEntriesHB = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   durationHB = experiments(k).durationHB(:, 1);
   theHandlesHB{k} = normplot(durationHB);
   set(theHandlesHB{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesHB{k}(2), 'LineWidth', 2);
   set(theHandlesHB{k}(3), 'LineWidth', 2);
   legendHandlesHB(k) = theHandlesHB{k}(1);
   legendEntriesHB{k} = experiments(k).experiment;
end
hold off
box on
xlabel('Blink duration (s)')
legend(legendHandlesHB, legendEntriesHB, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
set(gca, 'XLim', [0.05, 0.35])
%% Blink aPVZ
theHandlesP = cell(numExp, 1);
legendHandlesP = zeros(1, numExp);
legendEntriesP = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   pAVRZ = experiments(k).pAVRZ(:, 1);
   theHandlesP{k} = normplot(pAVRZ);
   set(theHandlesP{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesP{k}(2), 'LineWidth', 2);
   set(theHandlesP{k}(3), 'LineWidth', 2);
   legendHandlesP(k) = theHandlesP{k}(1);
   legendEntriesP{k} = experiments(k).experiment;
end
hold off
box on
xlabel('pAVRZ')
legend(legendHandlesP, legendEntriesP, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
%% Blink aPVZ
theHandlesGP = cell(numExp, 1);
legendHandlesGP = zeros(1, numExp);
legendEntriesGP = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   pAVRZ = experiments(k).pAVRZ(:, 3);
   theHandlesGP{k} = normplot(pAVRZ);
   set(theHandlesGP{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGP{k}(2), 'LineWidth', 2);
   set(theHandlesGP{k}(3), 'LineWidth', 2);
   legendHandlesGP(k) = theHandlesGP{k}(1);
   legendEntriesGP{k} = experiments(k).experiment;
end
hold off
box on
xlabel('pAVRZ for good blinks')
legend(legendHandlesGP, legendEntriesGP, 'Location', 'SouthEast', ...
      'Interpreter', 'None')

%% Blink nPVZ
theHandlesN = cell(numExp, 1);
legendHandlesN = zeros(1, numExp);
legendEntriesN = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   nAVRZ = experiments(k).nAVRZ(:, 1);
   theHandlesN{k} = normplot(nAVRZ);
   set(theHandlesN{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesN{k}(2), 'LineWidth', 2);
   set(theHandlesN{k}(3), 'LineWidth', 2);
   legendHandlesN(k) = theHandlesN{k}(1);
   legendEntriesN{k} = experiments(k).experiment;
end
hold off
box on
xlabel('nAVRZ')
legend(legendHandlesN, legendEntriesN, 'Location', 'SouthEast', ...
      'Interpreter', 'None')
  
%% Good blink nPVZ
theHandlesGN = cell(numExp, 1);
legendHandlesGN = zeros(1, numExp);
legendEntriesGN = cell(1, numExp);
figure ('Color', [1, 1, 1])
hold on
for k = 1:numExp
   nAVRZ = experiments(k).nAVRZ(:, 3);
   theHandlesGN{k} = normplot(nAVRZ);
   set(theHandlesGN{k}(1), 'MarkerSize', 8, ...
       'MarkerEdgeColor', theColors(k, :), 'LineWidth', 1.5);
   set(theHandlesGN{k}(2), 'LineWidth', 2);
   set(theHandlesGN{k}(3), 'LineWidth', 2);
   legendHandlesGN(k) = theHandlesGN{k}(1);
   legendEntriesGN{k} = experiments(k).experiment;
end
hold off
box on
xlabel('nAVRZ for good blinks')
legend(legendHandlesGN, legendEntriesGN, 'Location', 'SouthEast', ...
      'Interpreter', 'None')


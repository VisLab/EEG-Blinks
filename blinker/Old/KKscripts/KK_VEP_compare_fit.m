%%
load('e:\\KK_compare_fit\vepBlinksNew');
EEG = pop_loadset('z:\\Data 2\KellyNew\VEP_Robust_1Hz_ICA\vep_01.set');

%%

EOG = EEG.data(65,:);
EOG_n = EOG./std(EOG);

blink = blinks(1).blinkComponent;
blink_n = blink./std(blink);
oldStarts = blinks(1).rawBlinks(1,:);
oldEnds = blinks(1).rawBlinks(2,:);
extendFrames = floor(0.5*blinks(1).srate);
baseLevel = 0;
%%
[newStarts, newEnds, diffStarts, diffEnds, badStartMask, badEndMask] = ...
           extendBlinks(blink, oldStarts, oldEnds, extendFrames, baseLevel);
       
       
for i=1:length(oldStarts)
    
    x = newStarts(i):newEnds(i);
    
    h = figure;
    hold on;
    plot(x, blink_n(x));
    plot(x, EOG_n(x));
    hold off;
    pause
    close(h);
    
    
end
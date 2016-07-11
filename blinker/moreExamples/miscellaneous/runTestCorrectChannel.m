%% 
experiment = 'BCITLevel0';
blinkDir = 'O:\ARL_Data\BCITBlinks';
type = 'EOGUnrefNew';
typeOld = 'EOGUnrefNewReplaced';
blinkFile = [experiment 'BlinksNew' type '.mat'];
%%
load([blinkDir filesep blinkFile]);
%%

for k = 1:length(blinks)
    if blinks(k).usedSignal == 67 || blinks(k).usedSignal == 259 || ...
        isnan(blinks(k).usedSignal)
        continue;
    end
    
    fprintf('%d %d: %s\n', k, blinks(k).usedSignal, blinks(k).fileName);
end

%% 
criteria = -ones(length(blinks(k)), 3);
for k = 1:length(blinks)
    
    if isnan(blinks(k).usedSignal)
        continue;
    end
    theSignals = blinks(k).signalIndices;
    [~, thisIndex] = max(blinks(k).blinkAmpRatio);
    criteria(k, 1) = theSignals(thisIndex);
    [~, thisIndex] = max(blinks(k).numberBlinks);
    criteria(k, 2) = theSignals(thisIndex);
    [~, thisIndex] = max(blinks(k).goodBlinks);
    criteria(k, 3) = theSignals(thisIndex);
    [~, thisIndex] = max(blinks(k).goodBlinks./blinks(k).numberBlinks);
    criteria(k, 4) = theSignals(thisIndex);    
end

%%
x = sum(criteria == 67 | criteria == 259, 2);

%%
y1 = sum(x == 3 | x == 4);
y2 = sum(x == 2)
y3 = sum(x == 1)
y0 = sum(x == 0)

%%
indices = 1:length(blinks);
i2 = indices(x==2);
z2 = criteria(x==2, :);
z1 = criteria(x==1, :);
z0 = criteria(x==0, :);

for k = 1:length(z2)
    fprintf('%d: %d [%d, %d, %d, %d]\n', k, i2(k), ...
            z2(k, 1), z2(k, 2), z2(k, 3), z2(k, 4));
end

%%
i1 = indices(x==1);
z1 = criteria(x==1, :);
for k = 1:length(z1)
    fprintf('%d: %d [%d, %d, %d, %d]\n', k, i1(k), ...
            z1(k, 1), z1(k, 2), z1(k, 3), z1(k, 4));
end

%%
used = {blinks.usedSignal};
used = cellfun(@double, used);
goodOnes = ((x==3) | (x==4))&((used==67)|(used==259))';
good = sum(goodOnes);
good4 = (criteria(:, 3) == 67 |criteria(:, 3) == 259 ) & ((used==67)|(used==259))';
sum(good4)

%% force the blinks to be good. 
blinksOld = blinks;
%%
mask = zeros(length(blinks), 1);
for k = 1:length(blinks)
    used = blinks(k).usedSignal;
    if isnan(used) || used == 67 || used == 259
        continue;
    end
    indices = blinks(k).signalIndices;
    pos = find(indices == 67 | indices == 259, 1, 'first');
    if ~isempty(pos)
        mask(k) = 1;
        blinks(k).usedSignal = indices(pos);
        fprintf('%d: %s was %d now %d\n', k, blinks(k).fileName, used, indices(pos));
    else
        mask(k) = 2;
        fprintf('----%d: %s is %d----\n', k, blinks(k).fileName, used)
    end
end
 
%%
save ([blinkDir filesep blinkFile], 'blinks', '-v7.3');
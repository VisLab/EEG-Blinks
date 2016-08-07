% the scalpmap object contains scalpmaps for each IC:  IC x chans x chans
% however, the dimensions aren't perfect... 61x67x67 instead of 61x64x64
% also, if there is no value, it is NaN, not zero.

% this is a way to find the average of the weights in the first component,
% is there a way to use Matlab to do this instead of iterating over the
% elements?

function [isUpright, eyeFOM] = checkPolarity(scalpmapObj, component, noseDir)
    
    map = squeeze(scalpmapObj.originalChannelWeight(component,:,:));
    [rows, cols] = size(map);
    
    halfRows = int32(rows/2);
  
    switch noseDir       
        case '+X'
            frontHemisphereAve = nanmean(nanmean((map(halfRows:rows,:))));
            rearHemisphereAve = nanmean(nanmean((map(1:halfRows,:))));                           
        case '-X'
            frontHemisphereAve = nanmean(nanmean(map(1:halfRows,:)));
            rearHemisphereAve = nanmean(nanmean(map(halfRows:rows,:)));
        case '+Y'
        otherwise
            
    end

    if (frontHemisphereAve >= 0)
        isUpright = 1;
    else
        isUpright = -1;
    end    
    eyeFOM = isUpright * (frontHemisphereAve - rearHemisphereAve);
end
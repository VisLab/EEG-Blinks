classdef scalpmap
        % holds scalpmap data and handles plotting, polarity normalization...
    properties
        originalChannelWeight  = []; % a 3D array (comps, scalp x, scalp y) that holds the topomaps (ICA mixing weights for channels) before polarity normalization
        normalizedChannelWeight  = []; % a 3D (comps, scalp x, scalp y) array that holds the topomaps (ICA mixing weights for channels)
        gridX, gridY = []; % the 2D grid on which scalp maps are plotted.
        normalizationPolarity = []; % a vector (containing 1 and -1) that hold polarities for normalizaing scalp maps.
        subjectName % a cell array containing subject names associates with dipoles.
        numberInDataset   % an array containing the number of dipole IC in the associated EEG dataset. for example, if the dipole is from component number 5 in the dataset, this number will be 5. This array  is optional.
        isNormalized = false % is scalpmaps are currently normalized
    end;
    
    properties (Dependent = true)
        numberOfScalpmaps
    end;
    
    methods
        
        function numberOfScalpmaps = get.numberOfScalpmaps(obj)
            numberOfScalpmaps = size(obj.originalChannelWeight,1);
        end;
        
        function obj = normalizePolarity(obj, normalizationMethod) % normalize polarities
            if nargin < 2
                normalizationMethod = 'convex';
            end;
            
            obj.normalizationPolarity = normalize_ic_polarity(obj.originalChannelWeight(:,:), normalizationMethod);
            obj.normalizedChannelWeight = obj.originalChannelWeight .* repmat(obj.normalizationPolarity', [1, size(obj.originalChannelWeight, 2), size(obj.originalChannelWeight, 3)]);
        end;
        
        function newObj = createSubsetForId(obj, subsetId, renormalizeScalpmapPolarity)
            if nargin < 3
                renormalizeScalpmapPolarity = true;
            end;
            
            newObj = obj;
            
            if isempty(obj.originalChannelWeight)
                fprintf('Measure Projection Warning: scalp-map is empty but a subset is requested.\n');
            else
                newObj.originalChannelWeight = obj.originalChannelWeight(subsetId,:,:);
            end;
            
            if ~isempty(obj.normalizedChannelWeight)
                newObj.normalizedChannelWeight = obj.normalizedChannelWeight(subsetId,:,:);
            end;
            
            if ~isempty(obj.normalizationPolarity)
                newObj.normalizationPolarity = obj.normalizationPolarity(subsetId);
            end;
            
            if ~isempty(newObj.subjectName)
                newObj.subjectName = newObj.subjectName(subsetId);
            end;
            
            if ~isempty(newObj.subjectName)
                newObj.numberInDataset = newObj.numberInDataset(subsetId);
            end;
            
            if renormalizeScalpmapPolarity
                newObj = newObj.normalizePolarity;
            end;
        end;
        
        function plot(obj, subsetId, visualizationPolarity, createNewFigure, varargin)
            % plot(obj, subsetId, visualizationPolarity, createNewFigure)
            
            if nargin<2 || isempty(subsetId)
                subsetId = 1:size(obj.normalizedChannelWeight, 1);
                
                if length(subsetId) > 100
                    fprintf('There are more than 100 scalp-maps, by default only the first 100 are displayed.\n');
                    subsetId = 1:100;
                end;
            elseif islogical(subsetId)
                subsetId = find(subsetId); % turn from a logical array to indices.
            end;
            
            if nargin<3
                visualizationPolarity = 1;
            end;
            
            if nargin<4
                createNewFigure = true;
            end;
            
            numberOfRows = ceil((length(subsetId) * 3/4) .^ 0.5);
            numberOfColumns = ceil(numberOfRows * 4/3);
            
            if createNewFigure
                figure;
            end;
            
            for i=1:length(subsetId)
                sbplot(numberOfRows, numberOfColumns, i);
                
                toporeplot(visualizationPolarity * squeeze(obj.normalizedChannelWeight(subsetId(i),:,:)),'plotrad',0.5,  'intrad' , 0.5);
                
                % put information in the axis.
                userData.id = subsetId(i);
                userData.numberInFigure = i;
                set(gca, 'userdata', userData);
                
                set(get(gca, 'children'), 'ButtonDownFcn', @scalpmapCallback, 'hittest', 'on', 'userdata', userData)
                set(gca, 'ButtonDownFcn', @scalpmapCallback, 'hittest', 'on')
                
                try
                    if any(~cellfun(@isempty, obj.subjectName)) && ~isempty(obj.numberInDataset)
                        titleText = [obj.subjectName{subsetId(i)} ' / IC' num2str(obj.numberInDataset(subsetId(i)))];
                        title(titleText);
                    elseif ~isempty(obj.numberInDataset)
                        titleText = ['IC' num2str(obj.numberInDataset(subsetId(i)))];
                        title(titleText);
                    else
                        title(['ID ' num2str(subsetId(i))]);
                    end;
                catch
                end;
            end;
            colormap jet;
        end;
        
        function newObj = horzcat(varargin)
            newObj = varargin{1};
                        
            for i=2:length(varargin)
                newObj.originalChannelWeight = cat(1, newObj.originalChannelWeight, varargin{i}.originalChannelWeight);
                
                % attention: not normnalized yet, woudl need additional normalization
                newObj.normalizedChannelWeight = cat(1, newObj.normalizedChannelWeight, varargin{i}.normalizedChannelWeight);                
                newObj.normalizationPolarity = cat(2, newObj.normalizationPolarity, varargin{i}.normalizationPolarity);                
                newObj.subjectName = cat(1, newObj.subjectName, varargin{i}.subjectName);
                newObj.numberInDataset = cat(1, newObj.numberInDataset, varargin{i}.numberInDataset);                
            end;
            
            % if new scalpmaps are added, a new normalization is required
            if size(newObj.originalChannelWeight,1) > size(varargin{1}.originalChannelWeight,1)
                newObj.isNormalized = false;
            end;            
        end;
        
        function [id similarity] = detectEye(obj, threshold, varargin)
            % [id similarity] = detectEye(obj, threshold, varargin)
            %            
            % detect eye channels (whose equiv. dipole has fallen inside brain volume)
            % by comparing them to a set of hand-picked eye scalpmaps and finding
            % the ones that are more similar than a threshold to one of these predefined eye
            % scalpmaps.
            %
            % id            conatins the indices of detected eye components.
            % similarity    contains the similarity of each scalpmap to the 
            %               closest eye component in the eye dataset.
            
            if nargin < 2
                threshold = 0.944;
            end;
           
            eyeDetector = pr.eyeCatch;
            [id similarity] = eyeDetector.detectFromScalpmapObj(obj, threshold);
        end;
        
        function plotEye(obj, threshold, varargin)
             if nargin < 2
                threshold = 0.944;
            end;
            
            id = detectEye(obj, threshold);
            plot(obj, id);
        end;
        
        function obj = addFromChannels(obj, channelWeight, chanlocs, numberInDataset, subjectName, varargin)
            % channelWeight is channels x number of scalpmaps
            
            
            if nargin < 5
                subjectName = repmat({''}, size(channelWeight,1), 1);
            end;
            
            if nargin < 4
                numberInDataset = 1:size(channelWeight,1);
            end;
            
            % to remove the extra figure which is created by topoplot()
            % we need to first have a list of current figures (to delete ones that are added)
            figureHandlesBefore = findobj('type', 'figure');
            
            for i = 1:size(channelWeight, 2)
                
                [hfig grid plotrad Xi Yi] = topoplot(channelWeight(:,i), chanlocs, ...
                    'verbose', 'off',...
                    'electrodes', 'on' ,'style','both',...
                    'plotrad',0.55,'intrad',0.55,...
                    'noplot', 'on');
                
                obj.gridX = Xi;
                obj.gridY = Yi;
                gridCube(1,:,:) = grid;
                obj.originalChannelWeight = cat(1, obj.originalChannelWeight, gridCube);
                obj.subjectName = cat(1, obj.subjectName, subjectName(i));
                obj.numberInDataset = cat(1, obj.numberInDataset, numberInDataset(i));
            end;
                      
            figureHandlesAfter = findobj('type', 'figure');
            close(setdiff(figureHandlesAfter, figureHandlesBefore));
            
            obj.normalizedChannelWeight = obj.originalChannelWeight;
            
            %                 if inputOptions.normalizePolarity
            %                     obj = obj.normalizePolarity(inputOptions.normalizationMethod);
            %                 end;
        end;
        
        function [obj sameMap] = removeDuplicates(obj, method, varargin)
            if nargin < 2
                method = 'hash';
            end;
            
            if strcmpi(method, 'hash') % more than 10 times faster duplicate detection with two hashes
                channelWeight = obj.originalChannelWeight(:,:);
                channelWeight(isnan(channelWeight)) = 0;
                sumWeight = sum(channelWeight,2);
                sumAbsWeight = sum(abs(channelWeight),2);
                
                % use two hashes and select ones that have the same hashes for both hash types
                [c ia ic] = unique(sumAbsWeight);
                [c2 ia2 ic2] = unique(sumWeight);
                
                isDuplicateBasedOnHash1 = true(length(sumAbsWeight),1);
                isDuplicateBasedOnHash2 = true(length(sumAbsWeight),1);
                
                isDuplicateBasedOnHash1(ia) = false;
                isDuplicateBasedOnHash2(ia2) = false;
                isDuplicateBasedOnHash1and2 = isDuplicateBasedOnHash1 & isDuplicateBasedOnHash2;
                isUnique = ~isDuplicateBasedOnHash1and2;
                
                obj = obj.createSubsetForId(isUnique, false);
            else % exact method, much much slower
                nanId = isnan(obj.originalChannelWeight(1,:));
                channelWeight = obj.originalChannelWeight(:, ~nanId);
                sameMap = logical(spalloc(size(channelWeight,1),size(channelWeight,1), size(channelWeight,1)));
                
                progress('init'); % start the text based progress bar
                
                for i=1:size(sameMap, 1)
                    progress(i / size(sameMap, 1), sprintf('\npercent done %d/100',round(100*i / size(sameMap, 1))));
                    
                    theSame = channelWeight(i,1) == channelWeight(:,1);
                    for j=1:size(channelWeight,2)
                        if any(theSame)
                            theSame(theSame) = theSame(theSame) & channelWeight(i,j) == channelWeight(theSame,j);
                        end;
                    end;
                    
                    
                    sameMap(i,theSame) = true;
                    sameMap(theSame,i) = true;
                end;
                
                
                % keep the first of duplicates and removes others
                isDuplicate = false(size(sameMap,1),1);
                for i=1:size(sameMap,1)
                    if ~isDuplicate(i)
                        isDuplicate(sameMap(i,:)) = true;
                        isDuplicate(i) = false;
                    end;
                end;
                
                obj = obj.createSubsetForId(~isDuplicate, false);
                
                pause(.1);
                progress('close'); % duo to some bug need a pause() before
                fprintf('\n');
            end;
        end;
    end;
end
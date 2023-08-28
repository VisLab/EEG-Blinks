classdef scalpmapOfStudy < scalpmap
    % holds scalpmap data from an EEGLAB Study.
    properties
        % properties to keep track of IC subject name, group name and number
        groupName % an array containing group names associates with dipoles.        
    end % properties
    methods
        
        function obj = scalpmapOfStudy(STUDY, ALLEEG, icIndexForEachDipole, varargin) % constructor
            % conditionId is an optional input that specifies which conditions should be included.
            % by default all conditions are included.
            inputOptions = finputcheck(varargin, ...
                { 'normalizePolarity'         'boolean'  [true false]  true; ...
                'normalizationMethod'       'string'     {'convex' 'greedy'}   'greedy'});
            
            if nargin > 0
                
                % if icIndexForEachDipole is not provided, assume 1-to-1 association between ICs and
                % Dipoles (as opposed to potentially two dipoles for some ICs).
                
                if nargin < 3 || isempty(icIndexForEachDipole)
                    icIndexForEachDipole = 1:length(STUDY.cluster(1).comps);
                end;
                
                fprintf('Reading scalp-map data...\n');
                for i = 1:length(STUDY.cluster(1).comps)
                    [channelWeightForIc(i,:,:), obj.gridY, obj.gridX ] = std_readtopo(ALLEEG, STUDY.cluster(1).sets(1, i), STUDY.cluster(1).comps(i), 'mode', '2dmap');
                end;
                
                obj.originalChannelWeight = channelWeightForIc(icIndexForEachDipole,:,:);

                if inputOptions.normalizePolarity
                    obj = obj.normalizePolarity(inputOptions.normalizationMethod);
                else
                    obj.normalizedChannelWeight = obj.originalChannelWeight;
                end;
                
                icSubjectAndGroup = get_ic_subject_and_group(STUDY);
                
                obj.subjectName = icSubjectAndGroup.icSubjectName(icIndexForEachDipole);
                obj.groupName = icSubjectAndGroup.icGroupName(icIndexForEachDipole);               
                obj.numberInDataset = STUDY.cluster(1).comps(icIndexForEachDipole);
            end;
        end;
        
        function obj = createSubsetForId(obj,subsetId, varargin)
            % call from the parent class
            obj = createSubsetForId@scalpmap(obj, subsetId, varargin{:});
            
            obj.groupName = obj.groupName(subsetId);
        end;
    end;
end
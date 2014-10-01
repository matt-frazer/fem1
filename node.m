classdef node
    
    %node class represents a node which serves to connect elements, have
    %forces applied to it, and attach supports. It has a global id used as
    %the key in the global map, geometric coordinates, a list of forces
    %acting on it (assumed to be of length 1 in this version) and a
    %property for the type of support associated with it. Element map and
    %list as well as forceMap are extraneous properties for extensibility. 
    properties (Access=public)
        globalId_
        x_
        y_
        forceMap_
        forceList_
        elementMap_        
        elementList_
        support_
    end
    
    methods
        %constructor
        function n = node(gId, x,y,fMap,fList, eMap, eList, support)            
            n.globalId_ = gId;
            n.x_ = x;
            n.y_ = y;
            n.forceMap_ = fMap;
            n.forceList_ = fList;
            n.elementMap_ = eMap;
            n.elementList_ = eList;
            n.support_ = support;
        end
        
        function disp(n)
            fprintf('xcoord: %f\nycoord: %f\n', n.x_, n.y_);
        end
        
        %Returns the external force in the global x direction
        function f = extForceX(n)
            if(n.forceList_ == -1)
                f = 0;
            else
                f = xMag(n.forceMap_(n.forceList_));
            end
        end
    
        %Returns the external force in the global y direction
        function f = extForceY(n)
            if(n.forceList_ == -1)
                f = 0;
            else
                f = yMag(n.forceMap_(n.forceList_));
            end
        end
        
        function r = getBoundaryValues(n)
            %returns r in the form [f1 f2; u v], NaN represents unknown
            %values in either the displacement or the applied force
            
            if(strcmp(n.support_,'Fixed'))
                r = [NaN 0; NaN 0];
            elseif (strcmp(n.support_,'YRoller'))
                r = [NaN 0; extForceY(n) NaN];
            elseif (strcmp(n.support_,'XRoller'))
                r = [extForceX(n) NaN; NaN 0];
            else %free
                r = [extForceX(n) NaN;extForceY(n) NaN];
            end
                
        end
    end
end
classdef node
%     
%     enumeration
%         Fixed(0),
%         YRoller(1),
%         XRoller(2),
%         FreeUnloaded(3),
%         FreeLoaded(4)
%     end
    
    properties (Access=public)
        globalId_
        x_
        y_
        forceMap_
        forceList_
        elementMap_        
        elementList_
        boundary_
    end
    
    methods
        function n = node(gId, x,y,fMap,fList, eMap, eList)            
            n.globalId_ = gId;
            n.x_ = x;
            n.y_ = y;
            n.forceMap_ = fMap;
            n.forceList_ = fList;
            n.elementMap_ = eMap;
            n.elementList_ = eList;
            %n.boudary_=boundary;
        end
        
        function disp(n)
            fprintf('xcoord: %f\nycoord: %f\n', n.x_, n.y_);
        end
    end
end
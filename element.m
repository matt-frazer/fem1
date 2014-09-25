classdef element
   
    properties (Access = public)
       elementId_
       yngMod_ %young's modulus
       area_
       length_
       node1_ %id
       node2_ %id
       nodeMap_
       kEff_
    end
    
    methods
        function e = element(eId, node1, node2, nodeMap, yngMod, area)
            e.elementId_ = eId;
            e.node1_ = node1;
            e.node2_ = node2;
            e.nodeMap_ = nodeMap;
            e.yngMod_ = yngMod;
            e.area_ = area;
            
            %calculate length, if nodes are defined
            if(isKey(e.nodeMap_,node1) && isKey(e.nodeMap_,node2))
                n1 = e.nodeMap_(node1);
                n2 = e.nodeMap_(node2);
                e.length_ = sqrt( (n1.x_-n2.x_)^2 + (n1.y_-n2.y_)^2);
            end
        end
        
        %TODO calculate length function incase it doesn't happen in the
        %construtor
        
        function a = angle(e)
           %returns the angle of the element relative to node 1
           n1 = e.nodeMap_(e.node1_);
           n2 = e.nodeMap_(e.node2_);
           
           a = atan2(n2.y_ - n1.y_, n2.x_ - n1.x_);
        end
        
        function eOut = kEff(e)
            %generates the k-effective matrix for this element, should have
            %nodes already assigned
            
            a = cos(angle(e));
            b = sin(angle(e));
            
            m = [ a^2     a*b     -a^2    -a*b;
                  a*b     b^2     -a*b    -b^2;
                  -a^2    -a*b    a^2     a*b;
                  -a*b    -b^2    a*b     b^2;];
           
           e.kEff_ = ((e.area_ * e.yngMod_)/e.length_).*m;
           %e.kEff_ = m; 
           eOut = e;
        end
        
    end
   
end
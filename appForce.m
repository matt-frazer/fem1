classdef appForce
    
    %This class represents an applied force at a node
    %it has an identifier which can also be used as its key in the global
    %map, a magnitude, and a direction specified in radians from the +ive
    %global x-axis
    
    properties(Access=public)
        forceId_
        mag_
        dir_
    end
    
    methods
        
        %constructor
        function f = appForce(fId,mag,dir)
           f.forceId_ = fId;
           f.mag_ = mag;
           f.dir_ = dir;
        end
        
        %diagnostic display
        function disp(f)
           fprintf('Force %d magnitude is %f\n', f.forceId_, f.mag_);
        end
        
        %magnitude in the global x-dir
        function r = xMag(f)
            r = f.mag_*cos(f.dir_);
        end
        
        %magnitude in the global y-dir
        function r = yMag(f)
            r = f.mag_*sin(f.dir_);
        end
        
    end
end
classdef appForce
   
    properties(Access=public)
        forceId_
        mag_
        dir_
    end
    
    methods
        function f = appForce(fId,mag,dir)
           f.forceId_ = fId;
           f.mag_ = mag;
           f.dir_ = dir;
        end
        
        function disp(f)
           fprintf('Force %d magnitude is %f\n', f.forceId_, f.mag_);
        end
               
        function r = xMag(f)
            r = f.mag_*cos(f.dir_);
        end
        
        function r = yMag(f)
            r = f.mag_*sin(f.dir_);
        end
        
    end
end
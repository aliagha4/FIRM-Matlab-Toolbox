classdef A
    
    properties ( Constant )
        m = 233;
    end
    
    properties
        j;
    end
    
    methods (Static)
        function s = tester()
            s = A.m*2;
        end
    end
    
    methods
        function obj = A(j_inp)
            obj.j = j_inp;
        end
    end
end
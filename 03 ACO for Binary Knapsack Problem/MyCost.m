%
% Copyright (c) 2015, Mostapha Kalami Heris & Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "LICENSE" file for license terms.
%
% Project Code: YPEA103
% Project Title: Ant Colony Optimization for Binary Knapsack Problem
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Cite as:
% Mostapha Kalami Heris, Ant Colony Optimization in MATLAB (URL: https://yarpiz.com/53/ypea103-ant-colony-optimization), Yarpiz, 2015.
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [z, sol] = MyCost(x, model)

    v = model.v;
    w = model.w;
    W = model.W;

    V1 = sum(v.*x);
    W1 = sum(w.*x);
    V0 = sum(v.*(1-x));
    W0 = sum(w.*(1-x));
    
    Violation = max(W1/W-1, 0);
    
    z = V0*(1+100*Violation);
    
    sol.V1 = V1;
    sol.W1 = W1;
    sol.V0 = V0;
    sol.W0 = W0;
    sol.Violation = Violation;
    sol.z = z;
    sol.IsFeasible = (Violation == 0);

end
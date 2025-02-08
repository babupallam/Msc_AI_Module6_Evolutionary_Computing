function [o1, o2] = UniformCrossover(p1, p2, gamma)
    % gamma - spread factor
    %the random values will be generared in between -gamma and 1+gamma
    alpha = unifrnd(-gamma, 1+gamma, size(p1));
    
    o1 = alpha.*p1 + (1-alpha).*p2;
    o2 = alpha.*p2 + (1-alpha).*p1;

end
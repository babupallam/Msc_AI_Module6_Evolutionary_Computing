function [o1, o2] = applyRealDoublePointCrossover(p1, p2, gamma)
    %Determine size of either one solution binary string                    
    % (since size(p1) = size(p2) )
    nVar = numel(p1);
    %take random permutation of size nVar
    r = randperm(nVar);
    % create three random variable since this is Binary Three Point Crossover
    [j1,j2] = deal(r(1:2));    
    
    %the random values will be generared in between -gamma and 1+gamma
    alpha = unifrnd(-gamma, 1+gamma, size(p1));

    % Creation of offspring
    o1 = [alpha(1:j1).*p1(1:j1) (1-alpha(j1+1:j2)).*p2(j1+1:j2) alpha(j2+1:end).*p1(j2+1:end)];
    o2 = [alpha(1:j1).*p2(1:j1) (1-alpha(j1+1:j2)).*p1(j1+1:j2) alpha(j2+1:end).*p2(j2+1:end)];

end


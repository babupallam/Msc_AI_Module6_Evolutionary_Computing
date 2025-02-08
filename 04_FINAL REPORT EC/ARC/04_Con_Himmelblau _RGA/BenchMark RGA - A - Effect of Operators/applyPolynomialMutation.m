function o = applyPolynomialMutation(p, mu, sigma, VarMin, VarMax)
%p - parent
%mu - mutation probability
%sigma - distribution index used to calculate delta


%initialize offprings
o = zeros(size(p));
% compared randomly generated probability with mutation probability
if rand() < mu
    %perform mutation
    % Iterate over each gene (parameter) in the individual
    for i = 1:length(p)
        % generate random number for mutation
        u = rand();
        % calculate delta value for mutation, delta is the variation
        if u < 0.5
            delta = (2*u)^(1/(sigma+1))-1;
        else
            delta = 1 - (2*(1-u))^(1/(sigma+1));
        end

        % apply mutation using this delta and sigma values
        o(i) = p(i) + delta * (VarMax - VarMin);
    end
else
    %no mutation performed
    o=p;
end
end
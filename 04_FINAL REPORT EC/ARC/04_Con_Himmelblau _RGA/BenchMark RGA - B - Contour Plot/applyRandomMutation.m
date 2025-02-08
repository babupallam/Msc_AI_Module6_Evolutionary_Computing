function o = applyRandomMutation(p, mu, VarMin, VarMax)
    
    % Compare with a random probability with mutation probability
    if rand() > mu
        %perform mutation
        for i=1:length(p)
            %create offspring randomly with the bounds of variable
            o(i) = rand()*(VarMax -VarMin);
        end
    else
        %no mutation performed, parent itself refered as offspring
        o=p;
    end
    
end
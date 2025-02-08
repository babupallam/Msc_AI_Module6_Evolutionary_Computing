function pop = applyMuPlusLambdaSurvivorSelection(pop, nPop)

    [~, so] = sort([pop.Cost]);
    pop = pop(so);     
    % Remove Extra Individuals
    pop = pop(1:nPop);
end
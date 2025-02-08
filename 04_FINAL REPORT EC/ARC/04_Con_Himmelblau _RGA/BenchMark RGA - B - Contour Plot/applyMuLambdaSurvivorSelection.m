function pop = applyMuLambdaSurvivorSelection(popc, nPop)
    %choosing best nPop from popc since nPop < nC ==> number of offspring
    %population is higher than number of parent population
    [~, so] = sort([popc.Cost]);
    popc =popc(so);
    %select the first 'nPop' solutions from updated popc, which will be the
    %parent population for the next iteration
    pop = popc(1:nPop);
end
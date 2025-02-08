function popc  = applyStochasticUniversalSamplingSelection(pop, nPop, popc, nC, beta)
    
    % Selection of Probabilities 
    c =[pop.Cost];
    cavg = mean(c);
    if cavg ~= 0
        c =c/cavg;
    end
    %distribution of probabilities based on cost of each solution
    probs = exp(-beta*c);

    %finding cumulative sum 
    cumulativeSum = cumsum(probs);

    %create a random variable in between 0 and 1
    r = rand(1);

    % create crossover population from parent population by iterating steps
    % nC times to find each solution at a time.
    for k=1:nC
        % generate a random number by adding one of nPop divisions with the
        % random number and take the fraction part (which is less than zero) 
        r = mod(r+(k-1)/nPop,1);
        %find the first index by traversing from left to right in the 'cumulative sum row matrix' subjected to the
        %condition that r > 'the value at the index'
        index = find(r <= cumulativeSum, 1, 'first');
        % add the solution from parent population into crossover population
        popc(k,1) = pop(index);
    end
end
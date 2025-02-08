function popc = MySelection(pop,beta,nC,popc)
    
    % Selection Probabilities
    c =[pop.Cost];
    cavg = mean(c);
    if cavg ~= 0
        c =c/cavg;
    end
    probs = exp(-beta*c);
    tic
    %Select Parents 
    %for making this function to work with other my own functions
    for k=1:nC
        popc(k,1) = pop(RouletteWheelSelection(probs));
    end
    toc
end
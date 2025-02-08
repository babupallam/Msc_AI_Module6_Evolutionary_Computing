function popc = applyBinaryTournamentSelection(pop,nPop,popc,nC)
    % applyBinaryTournamentSelection => Tournament operator with k=2, pick
    % 2 random from the population and take the best
    %Steps involved
    % 1. choose two random values from 1 to nPop(number of population) 
    % 2. compare the cost 
    % 3. chose minimum cost valued index, save it into popc
    % 4. iterate from step 2 nC times        % p1 and p2 consists the parents corresponding to the random
     
    k=1;
    while k<=nC
        %Generate two random indices
        %with the following code the random generated number often happens
        %to be same, so I add code to ensure both random numbers are same
        
        %Method2        
        r = randperm(nPop);
        [index1, index2] = deal(r(1),r(2));
     
        % indexes from Population (pop)
        p1 = pop(index1);
        p2 = pop(index2);
        if p1.Cost <= p2.Cost
            %p1 wins in the selection process since the cost is less
            %compared to the competent
            %Assign the value into popc, for further process
            popc(k,1) = p1;
            k=k+1;
        end
    end
end
function out = RunGA(problem, params)
    %Problem
    CostFunction = problem.CostFunction;
    nVar = problem.nVar;

    %Parameters
    MaxIt = params.MaxIt;%Maximum Iterations : THreshold value
    nPop = params.nPop;%number of populations
    pC = params.pC;%probability of Crossover
    nC = round(pC*nPop/2)*2; %
    beta = params.beta;
    mu = params.mu;

    % Template for Empty Individuals
    empty_individual.Position = [];
    empty_individual.Cost = [];
    
    % note: the design of a tuple has been defined above
    
    % Best Solution Ever Found
    bestsol.Cost = inf;
    
    % Initialization
    pop = repmat(empty_individual, nPop, 1)

    %note: 50x1 matrix each row contain position as well as cost
    
    %Generate random solutions
    for i=1:nPop

        % Generate Random Solution
        pop(i).Position = randi([0,1],1,nVar)

        % %Evaluate Solution
        pop(i).Cost = CostFunction(pop(i).Position)

        %Compare solution with best solution
        if pop(i).Cost < bestsol.Cost
            bestsol = pop(i);
        end
    end

    %Main Loop
    for it =1:MaxIt
        %Selection Operator ============
        % Probability
        c = [pop.Cost];
        cavg = mean(c);
        if cavg ~=0
            c=c/cavg;
        end
        probs = exp(-beta*c);
        
        popc = repmat(empty_individual, nC/2, 2)
        %Crossover=========================
        for k = 1:nC/2
            p1 = pop(RouletteWheelSelection(probs));
            p2 = pop(RouletteWheelSelection(probs));
    
            %Perform Crossover
            [popc(k,1).Position,popc(k,2).Position] =  SinglePointCrossOver(p1,p2);
        end
        
        %Convert into single column matrix
        popc = popc(:);

        %Mutation ====================
        for l=1:nC
            %perform mutation
            popc(l).Position = Mutate(popc(l).Position,mu)
        
            %Evaluation
            pop(l).Cost = CostFunction(pop(l).Position);
    
            if pop(l).Cost < bestsol.Cost
                bestsol = popc(l)
            end
        end

        %Merge and Sort Population
        pop=SortPopulation(pop);

        %Remove Extra Individuals
        pop = pop(1:nPop);

        %update best Cost of Iteration
        bestcost(it) = bestsol.Cost;

        %Display Iteration
        disp(['Iteration' num2str(it) ':Best Cost = ' num2str(bestcost(it))])
    end

    out.pop = pop;
    outbestsol =bestsol;
    outbestcost =bestcost;
end
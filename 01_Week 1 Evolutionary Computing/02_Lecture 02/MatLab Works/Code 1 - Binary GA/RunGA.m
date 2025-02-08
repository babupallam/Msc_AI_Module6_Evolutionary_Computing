function out = RunGA(problem, params)

    % Problem 
    CostFunction = problem.CostFunction;
    nVar = problem.nVar;
    
    % Params
    MaxIt = params.MaxIt;
    nPop = params.nPop;
    beta = params.beta;
    pC = params.pC;
    nC = round(pC*nPop/2)*2; 
       %Note: pC is used only once in the whole algorithm. The main purpous of that variable is to control the
       %    number of Crossover solutions should be generated as part of the algorithm. 
    mu = params.mu;
    
    % Template for Empty Individuals
    empty_individual.Position = [];
    empty_individual.Cost = [];
    
    % Best Solution Ever Found
    bestsol.Cost = inf;
    
    % Initialization
    pop = repmat(empty_individual, nPop, 1);
    for i = 1:nPop
        
        % Generate Random Solution
        pop(i).Position = randi([0, 1], 1, nVar);
        
        % Evaluate Solution
        pop(i).Cost = CostFunction(pop(i).Position);
        
        % Compare Solution to Best Solution Ever Found
        if pop(i).Cost < bestsol.Cost
            bestsol = pop(i);
        end
        
    end
    
    % Best Cost of Iterations
    bestcost = nan(MaxIt, 1);
    
    % Main Loop
    for it = 1:MaxIt
        
        %Section Operator Section
        %============================
        % Selection Probabilities
        c = [pop.Cost];
        cavg = mean(c);
        if cavg ~= 0
            c = c/cavg;
        end
        probs = exp(-beta*c);
        
        % Initialize Offsprings Population
        popc = repmat(empty_individual, nC/2, 2);
        
        % Crossover
        for k = 1:nC/2
            
            % Select Parents
            p1 = pop(RouletteWheelSelection(probs));
            p2 = pop(RouletteWheelSelection(probs)); % pop with index value. which comes as the output of Selction function 
            
            % Perform Crossover
            [popc(k, 1).Position, popc(k, 2).Position] = MyCrossover(p1.Position, p2.Position);%#pairs = half of the total population
            
        end
        
        % Convert popc to Single-Column Matrix
        popc = popc(:);
        % popc = popc' -- error
        % Mutation ===================================
        for l = 1:nC
            
            % Perform Mutation
            popc(l).Position = Mutate(popc(l).Position, mu);
            
            % Evaluation
            popc(l).Cost = CostFunction(popc(l).Position);
            
            % Compare Solution to Best Solution Ever Found
            if popc(l).Cost < bestsol.Cost
                bestsol = popc(l);
            end
            
        end
        
        % Merge and Sort Populations
        pop = SortPopulation([pop; popc]);
        
        % Remove Extra Individuals
        pop = pop(1:nPop);
        
        % Update Best Cost of Iteration
        bestcost(it) = bestsol.Cost;

        % Display Itertion Information
        if bestcost(it)~=0
            disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))]);
        end
    end
    
    
    % Results
    out.pop = pop;
    out.bestsol = bestsol;
    out.bestcost = bestcost;
    
end
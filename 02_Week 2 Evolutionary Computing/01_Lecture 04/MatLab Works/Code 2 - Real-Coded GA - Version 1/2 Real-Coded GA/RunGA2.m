function out = RunGA(problem, params)

    % Problem
    CostFunction = problem.CostFunction;
    nVar = problem.nVar;
    VarSize = [1, nVar];%numbe rof variables 
    VarMin = problem.VarMin;
    VarMax = problem.VarMax;
    
    % Params
    MaxIt = params.MaxIt;
    nPop = params.nPop;
    beta = params.beta;
    pC = params.pC;
    nC = round(pC*nPop/2)*2;
    gamma = params.gamma;
    mu = params.mu;%mutation probability
    sigma = params.sigma;
    
    % Template for Empty Individuals
    empty_individual.Position = [];
    empty_individual.Cost = [];
    
    % Best Solution Ever Found
    bestsol.Cost = inf;
    
    % Initialization
    pop = repmat(empty_individual, nPop, 1);
    for i = 1:nPop
        
        % Generate Random Solution
        pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
        
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
        % Initialize Population for Evolution Stategy
        popc = repmat(empty_individual, nC, 1);

        %already given in the code
        % popc = MySelection(pop, beta, nC, popc);
        % Applying Stochastic Universal Sambling Selection Opearation
        popc  = applyStochasticUniversalSamplingSelection(pop, nPop, popc, nC, beta);
        
        % Convert popc to nC/2x2 Matrix for Crossover Operation
        popc = reshape(popc,nC/2,2);
        
        % Crossover
        for k = 1:nC/2
                  
            % Perform Crossover
            % [popc(k, 1).Position, popc(k, 2).Position] = UniformCrossover(popc(k,1).Position, popc(k,2).Position, gamma);
            % Applying Real Double Point Crossover Opeation
            [popc(k, 1).Position, popc(k, 2).Position] = applyRealDoublePointCrossover(popc(k,1).Position, popc(k,2).Position, gamma);
            % Applying Real Linear Crossover Opeation
            [popc(k, 1).Position, popc(k, 2).Position] = applyRealLinearCrossover(popc(k,1).Position, popc(k,2).Position, gamma);
 
        end
        
        % Convert popc to Single-Column Matrix
        popc = popc(:);
        
        % Mutation
        for l = 1:nC
            
            % Perform Mutation
            popc(l).Position = Mutate(popc(l).Position, mu, sigma);
            
            %only in the real not in binary.. if the variable cross the
            %biinary, we need to make it into the boundary in beween varMIn
            %and varMax
            %the 
            % Check for Variable Bounds
            popc(l).Position = max(popc(l).Position, VarMin);
            popc(l).Position = min(popc(l).Position, VarMax);
            
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
        disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))]);
        
    end
    
    
    % Results
    out.pop = pop;
    out.bestsol = bestsol;
    out.bestcost = bestcost;
    
end
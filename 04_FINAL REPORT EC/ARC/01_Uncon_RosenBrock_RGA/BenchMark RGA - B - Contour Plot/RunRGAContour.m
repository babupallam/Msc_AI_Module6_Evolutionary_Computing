function out = RunRGAContour(problem, params)

% Problem
CostFunction = problem.CostFunction;
nVar = problem.nVar;
VarSize = [1, nVar];
VarMin = problem.VarMin;
VarMax = problem.VarMax;
toleranceValue = problem.toleranceValue;

% Params
MaxIt = params.MaxIt;
nPop = params.nPop;
beta = params.beta;
pC = params.pC;
nC = round(pC*nPop/2)*2;
mu = params.mu;
genNumber =params.genNumber;%generation index of which graph has to be ploted

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
    pop(i).Cost = CostFunction(pop(i).Position(1), pop(i).Position(2));
    % Compare Solution to Best Solution Ever Found
    if pop(i).Cost < bestsol.Cost
        bestsol = pop(i);
    end
end

% Best Cost of Iterations
bestcost = nan(MaxIt, 1);

%plot Control Variables
plotX = zeros(MaxIt,nPop);
plotY = zeros(MaxIt,nPop);

% Main Loop
for it = 1:MaxIt

    % Initialize Population for Evolution Stategy
    popc = repmat(empty_individual, nC, 1);

    % Applying Binary Tournament Selection
    popc  = applyStochasticUniversalSamplingSelection(pop,nPop,popc,nC,beta);

    % Convert popc to nC/2x2 Matrix for Crossover Operation
    popc = reshape(popc,nC/2,2);


    % Applying Crossover Operation
    for k = 1:nC/2
        % Perform SBX Crossover Operation
        [popc(k, 1).Position, popc(k, 2).Position] = applyLinearCrossover(popc(k,1).Position, popc(k,2).Position, pC, CostFunction,empty_individual );
        % Check for Variable Bounds
        popc(k,1).Position = max(popc(k,1).Position, VarMin);
        popc(k,1).Position = min(popc(k,1).Position, VarMax);
        popc(k,2).Position = max(popc(k,2).Position, VarMin);
        popc(k,2).Position = min(popc(k,2).Position, VarMax);
    end
    % Convert popc to Single-Column Matrix
    popc = popc(:);

    % Apply Mutation Operation
    for l = 1:nC

        % Perform Polynomial Mutation
        popc(l).Position = applyRandomMutation(popc(l).Position, mu, VarMin, VarMax);

        % Check for Variable Bounds
        popc(l).Position = max(popc(l).Position, VarMin);
        popc(l).Position = min(popc(l).Position, VarMax);

        % Evaluation
        popc(l).Cost = CostFunction(popc(l).Position(1),popc(l).Position(2));

        % Compare Solution to Best Solution Ever Found
        if popc(l).Cost < bestsol.Cost
            bestsol = popc(l);
        end

        %save the best soliution found in the iteration it of particle i
        %into plotX and plotY inorder to draw the graph
        plotX(it,l) = popc(l).Position(1);
        plotY(it,l) = popc(l).Position(2);

    end

    %applying Mu + Lambda Survivor Selection survivor selection operaton
    pop =applyMuLambdaSurvivorSelection([pop; popc], nPop);

    % Update Best Cost of Iteration
    bestcost(it) = bestsol.Cost;

    % Display Itertion Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))]);


    %plot the graph with the newly updated solutions and best received in the above
    %generation process( the drawing code has been seperated from this into
    %another file named DrawTheContourPlot.m)
    %check with the toleranc value to make sure that the graph has been
    %ploted for the optimum solution (0) here tolerance value =0 has been
    %set
    if bestcost(it) <= toleranceValue
        disp(['Tolerance value has been reached at generation: ' num2str(it)]);
        genNumber =[it];
        DrawTheContourPlot
        %Once optimum has been reached no need to run the code again so
        %we terminate the exicution at here
        out.bestsol = bestsol;
        out.bestcost = bestcost;
        out.minIterationToReachToleranceValue = it;
        return;
    else
        DrawTheContourPlot
    end

end
% Results
out.pop = pop;
out.bestsol = bestsol;
out.bestcost = bestcost;

end
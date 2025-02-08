function out = RunRGAContour(problem, params)

% Problem
CostFunction = problem.CostFunction; % Cost Function
Constraints = problem.Constraints; % Constraint function
FitnessValue = problem.FitnessValue; %Fitness function
nVar = problem.nVar;
VarSize = [1, nVar];
VarMin = problem.VarMin;
VarMax = problem.VarMax;
toleranceValue = problem.toleranceValue;
%%
% Params
MaxIt = params.MaxIt;
nPop = params.nPop;
beta = params.beta;
pC = params.pC;
nC = round(pC*nPop/2)*2;
gamma = params.gamma;
mu = params.mu;
sigma = params.sigma;
genNumber =params.genNumber;%generation index of which graph has to be ploted

%static penality parameter
R = params.R;
%%
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
    pop(i).Cost = FitnessValue(pop(i).Position(1), pop(i).Position(2), R);
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

    %Effect of Operators
    % Applying Stochastic Universal Sambling Selection Opearation
    popc  = applyStochasticUniversalSamplingSelection(pop, nPop, popc, nC, beta);

    % Convert popc to nC/2x2 Matrix for Crossover Operation
    popc = reshape(popc,nC/2,2);


    % Applying Crossover Operation
    for k = 1:nC/2
        %Effect of Operators
        %Perform Linear Crossover
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


        %Effect of Operators
        %perform Random Mutation Operator
        popc(l).Position = applyRandomMutation(popc(l).Position, mu, VarMin, VarMax);
        % Check for Variable Bounds
        popc(l).Position = max(popc(l).Position, VarMin);
        popc(l).Position = min(popc(l).Position, VarMax);

        % Evaluation
        popc(l).Cost = FitnessValue(popc(l).Position(1),popc(l).Position(2), R);

        % Compare Solution to Best Solution Ever Found
        if popc(l).Cost < bestsol.Cost
            bestsol = popc(l);
        end

        %save the best soliution found in the iteration it of particle i
        %into plotX and plotY inorder to draw the graph
        plotX(it,l) = popc(l).Position(1);
        plotY(it,l) = popc(l).Position(2);

    end

    %Effect of Operators
    %apply Mu, Lambda Survivor Selection Operator
    pop = applyMuLambdaSurvivorSelection(popc, nPop);


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
    if bestcost(it) < toleranceValue
        disp(['Tolerance value has been reached at generation: ' num2str(it)]);
        genNumber =[it];
        DrawTheContourPlot
        %Once optimum has been reached no need to run the code again so
        %we terminate the exicution at here
        out.bestsol = bestsol;
        out.bestcost = bestcost;
        out.minIterationToReachToleranceValue = it;
        disp(bestsol)
        disp(['Constraints: ', num2str(Constraints(bestsol.Position(1), bestsol.Position(2), R))] );
        return;
    else
        DrawTheContourPlot
    end

end
% Results
out.pop = pop;
out.bestsol = bestsol;
out.bestcost = bestcost;
% Display Best Solution in Command Window
disp(bestsol)
disp(['Constraints: ', num2str(Constraints(bestsol.Position(1), bestsol.Position(2), R))] );

end
%% RGA - Constraints Himmelblue Function and Static Penalty

function out = RunRGA(problem, params)

%% Problem
Constraints = problem.Constraints; % Constraint function
FitnessValue = problem.FitnessValue; %Fitness function
nVar = problem.nVar;
VarSize = [1, nVar];
VarMin = problem.VarMin;
VarMax = problem.VarMax;
toleranceValue = problem.toleranceValue;
%% Params
MaxIt = params.MaxIt;
nPop = params.nPop;
% beta = params.beta;
pC = params.pC;
nC = round(pC*nPop/2)*2;
gamma = params.gamma;
mu = params.mu;
sigma = params.sigma;
R = params.R;
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

% Main Loop
for it = 1:MaxIt

    % Initialize Population for Evolution Stategy
    popc = repmat(empty_individual, nC, 1);

    % Applying Binary Tournament Selection
    popc  = applyBinaryTournamentSelection(pop,nPop,popc,nC);

    %Effect of Operators
    % Applying Stochastic Universal Sambling Selection Opearation
    % popc  = applyStochasticUniversalSamplingSelection(pop, nPop, popc, nC, beta);


    % Convert popc to nC/2x2 Matrix for Crossover Operation
    popc = reshape(popc,nC/2,2);


    % Applying Crossover Operation
    for k = 1:nC/2
        % Perform SBX Crossover Operation
        [popc(k, 1).Position, popc(k, 2).Position] = applySBXCrossover(popc(k,1), popc(k,2), pC, gamma);


        %Effect of Operators
        %Perform Linear Crossover
        % [popc(k, 1).Position, popc(k, 2).Position] = applyLinearCrossover(popc(k,1).Position, popc(k,2).Position, pC, CostFunction,empty_individual );
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
        popc(l).Position = applyPolynomialMutation(popc(l).Position, mu, sigma, VarMin, VarMax);


        %Effect of Operators
        %perform Random Mutation Operator
        % popc(l).Position = applyRandomMutation(popc(l).Position, mu, VarMin, VarMax);

        % Check for Variable Bounds
        popc(l).Position = max(popc(l).Position, VarMin);
        popc(l).Position = min(popc(l).Position, VarMax);

        % Evaluation
        popc(l).Cost = FitnessValue(popc(l).Position(1),popc(l).Position(2), R);

        % Compare Solution to Best Solution Ever Found
        if popc(l).Cost < bestsol.Cost
            bestsol = popc(l);
        end

    end

    %applying Mu + Lambda Survivor Selection survivor selection operaton
    pop =applyMuPlusLambdaSurvivorSelection([pop; popc], nPop);


    %Effect of Operators
    %apply Mu, Lambda Survivor Selection Operator
    % pop = applyMuLambdaSurvivorSelection(popc, nPop);

    % Update Best Cost of Iteration
    bestcost(it) = bestsol.Cost;

    % Display Itertion Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))]);


    if bestcost(it) <= toleranceValue
        disp(['Tolerance value has been reached at generation: ' num2str(it)]);
        % Results
        out.bestsol = bestsol;
        out.bestcost = bestcost;
        out.minIterationToReachToleranceValue = it;
        disp(bestsol)
        disp(['Constraints: ', num2str(Constraints(bestsol.Position(1), bestsol.Position(2), R))] );
        return;
    end


end

% Results
out.pop = pop;
out.bestsol = bestsol;
out.bestcost = bestcost;
%the below line set is by maing an assumption that MaxIt is atleast needed
%to reach the tolerance value with the given specification. its for avoid
%the error of indefinit looing while finding the result
out.minIterationToReachToleranceValue = MaxIt; 
% Display Best Solution in Command Window
disp(bestsol)
disp(['Constraints: ', num2str(Constraints(bestsol.Position(1), bestsol.Position(2), R))] );

end
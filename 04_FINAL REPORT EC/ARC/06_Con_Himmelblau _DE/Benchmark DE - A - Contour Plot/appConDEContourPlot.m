%% DE /rand/1/bin with Contraint HImmelblue function
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables    x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables
problem.toleranceValue = 517.063; % this is not the optimum solution, but to demonstrate the convergence for this problem 

%% DE Parameters

params.MaxIt = 200;       % Maximum Number of Iterations
params.nPop = 50;          % Population Size
params.beta_min = 0.3;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.3;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability
params.R = 100;             % Static Penalty Parameter
%Generation numbers needed to be plot as a graph
params.genNumber = [1,5,10,100];

%% Calling DE
out = DE_ForContour(problem, params);

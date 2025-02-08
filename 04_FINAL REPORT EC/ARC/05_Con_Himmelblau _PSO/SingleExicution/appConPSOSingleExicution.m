%% PSO - Constraint Himmelblu Funciton with Static Penalty
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables    x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables
problem.toleranceValue = 517.063 ; % this is not the optimum solution, but used to demonstrate the convergence for this problem 

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 2;              % Personal Acceleration Coefficient
params.c2 = 2;              % Social Acceleration Coefficient
params.R = 2;             % Static Penalty Parameter
%Generation numbers needed to be plot as a graph
params.genNumber = [1,30,100];

%% Calling PSO Algorithm
out = PSO(problem, params);

%% Show Results
%out contains, BestCost in each iteration, BestSol received so far, and the
%minimum iteration it took to get the optimum solution(here it is tolerance
%value)
%plot the result which is in out.BestCost
semilogy(out.BestCosts , 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;

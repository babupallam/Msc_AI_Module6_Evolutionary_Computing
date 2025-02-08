%% DE /best/2/bin with Contraint HImmelblue function
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

params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability
params.R = 100;             % Static Penalty Parameter

%% Effect of MaxIt and nPop

%save different values of MaxIt and nPop inorder to do the experiment
maxItVariation = [100, 200, 300, 400, 500];
nPopVariation = [10, 30, 100, 500, 1000];

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(maxItVariation)
        params.MaxIt = maxItVariation(i);       % Maximum Number of Iterations
    for j=1:numel(nPopVariation)
        params.nPop = nPopVariation(i);          % Population Size
        out = DE(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end


% Describing the attributes for the graph
[X,Y] = meshgrid(maxItVariation,nPopVariation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of MaxIt and nPop ');
xlabel('Maximum number of Iterations (MaxIt)');
ylabel('Number of Populations (nPop)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
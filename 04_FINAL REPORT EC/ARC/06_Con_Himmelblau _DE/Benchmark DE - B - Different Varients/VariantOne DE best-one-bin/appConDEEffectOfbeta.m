%% DE /best/1/bin with Contraint HImmelblue function
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
params.pCR = 0.5;          % Crossover Probability
params.R = 100;             % Static Penalty Parameter

%% Effect of beta(beta_min and beta_max) in the result

%save different values of beta_min and beta_max 
boundVariations = [0:0.25:2];% for figure-A
% boundVariations = [-2,-1,3,4];% for figure-C

% size of variation arrays for the loop generation
sizeOfbetaMinVariation = numel(boundVariations);
sizeOfbetaMaxVariation = numel(boundVariations);

% use two for loops to do the experiment with various combinations
for i=1:sizeOfbetaMaxVariation
    % Lowerbound for scaling factor-beta (bata_min)
    params.beta_min = boundVariations(i);
    for j=1:sizeOfbetaMaxVariation
        % Upperbound for scaling factor-beta (bata_max)
        params.beta_max = boundVariations(i);
        out = DE(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(boundVariations,boundVariations);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Bounds for the Scaling Factors (beta-min and beta-max)')
xlabel('Lowerbound of Beta (beta-min');
ylabel('Upperbound of Beta (beta-max)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
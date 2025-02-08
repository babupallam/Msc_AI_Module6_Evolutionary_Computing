%% RGA - Constraints Himmelblue Function and Static Penalty 
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables   x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables
problem.toleranceValue = 520; % this is the optimum solution when x1 = 3.763 and x2 = 4.947 

%% RGA Parameters
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator
params.beta =1;
params.R = 100;  % Static Penalty Parameter
%% Effect of MaxIt and nPop

%save different values of MaxIt and nPop inorder to do the experiment
maxItVariation = [100, 200, 300, 400, 500];
nPopVariation = [10, 30, 100, 500, 1000];

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(maxItVariation)
     % Intertia Coefficient (w)
    params.MaxIt = maxItVariation(i);
    for j=1:numel(nPopVariation)
        % Damping Ratio of Inertia Coefficient (wdamp)
        params.nPop = nPopVariation(j);
        out = RunRGA(problem, params);
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
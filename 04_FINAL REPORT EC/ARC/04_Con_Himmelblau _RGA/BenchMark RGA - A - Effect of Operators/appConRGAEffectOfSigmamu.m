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
params.MaxIt = 1000;
params.nPop = 40;
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator

params.R = 100;  % Static Penalty Parameter

%% Effect of Sigma and mu

%save different values of Sigma and mu inorder to do the experiment
sigmaVariation = [0, 10, 15, 50, 100]; 
muVariation = [0 0.3 0.5 0.8 1]; % in between 0 and 1

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(sigmaVariation)
    params.sigma = sigmaVariation(i);   % Distribution index for Polynomial Mutation Operator
    for j=1:numel(muVariation)
        params.mu = muVariation(i);% 1/nVar  % Mutation probability
        out = RunRGA(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end


% Describing the attributes for the graph
[X,Y] = meshgrid(sigmaVariation,muVariation);
Z= transpose(Z);
surf(X,Y,Z);
title('Effect of Sigma and mu ');
xlabel(' Distribution index for Polynomial Mutation Operator (sigma)');
ylabel('Mutation probability (mu)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
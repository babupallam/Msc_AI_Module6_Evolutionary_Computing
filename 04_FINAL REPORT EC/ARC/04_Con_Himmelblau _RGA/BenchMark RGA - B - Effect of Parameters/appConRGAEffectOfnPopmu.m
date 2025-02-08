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
params.MaxIt = 5000;
params.pC = 1;  % Probability of crossover
params.beta =1; %coeffient of probability distribution in selection operator
params.R = 100;  % Static Penalty Parameter

%% Effect of Population Size (nPop) and Probability of Mutation (mu)


%save different values of nPop and pC inorder to do the experiment
nPopVariation = [100, 200, 300, 400, 500];
muVariation = [0 0.3 0.5 0.7 1];

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(nPopVariation)
    params.nPop = nPopVariation(i); %number of populations
    for j=1:numel(muVariation)
        params.mu = muVariation(i);  % Probability of Mutation
        out = RunRGA(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end


% Describing the attributes for the graph
[X,Y] = meshgrid(nPopVariation,muVariation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of nPop and mu ');
xlabel('Number of Population (nPop)');
ylabel('Mutation Probability (mu)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
%% PSO - Constraint Himmelblu Funciton with Static Penalty
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables    x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient

params.R = 100;             % Static Penalty Parameter
%Generation numbers needed to be plot as a graph
params.genNumber = [1,30,100];
params.toleranceValue = 517.063 ; % this is the optimum solution, but used to demonstrate the convergence for this problem 
%% Effect of Population Size (nPop) and the Inertia Coefficient (w)

%save different values of nPop and w inorder to do the experiment
nPopVariation = [100:200:1000];
wVariation = [1:2:10];


% size of variation arrays
sizeOfnPopVariation = numel(nPopVariation);
sizeOfwVariation = numel(wVariation);

% use two for loops to do the experiment with various combinations of nPop
% and w
for i=1:sizeOfnPopVariation
    % Population Size (Swarm Size)
    params.nPop = nPopVariation(i);
    for j=1:sizeOfwVariation
         % Intertia Coefficient
        params.w = wVariation(j);
        out = PSO(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(nPopVariation,wVariation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Population Size (nPop) and the Inertia Coefficient (w)')
xlabel('Population Size');
ylabel('Inertia Coefficient');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
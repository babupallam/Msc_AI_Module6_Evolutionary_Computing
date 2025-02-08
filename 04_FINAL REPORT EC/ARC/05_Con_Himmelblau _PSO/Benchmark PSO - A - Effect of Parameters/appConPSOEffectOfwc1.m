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
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient

params.R = 100;             % Static Penalty Parameter
%Generation numbers needed to be plot as a graph
params.genNumber = [1,30,100];
params.toleranceValue = 517.063 ; % this is the optimum solution, but used to demonstrate the convergence for this problem 

%% Effect of Inertia Coefficient (w) and Personal Acceleration Coefficient (c1)

%save different values of w and c1 inorder to do the experiment
wVariation = [-2:2:10];
c1Variation = [-2:2:10];

% use two for loops to do the experiment with various combinations of w
% and c1
for i=1:numel(wVariation)
     % Intertia Coefficient
    params.w = wVariation(i);
    for j=1:numel(c1Variation)
        % Personnel Acceleration Coefficient
        params.c1 = c1Variation(j);
        out= PSO(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(wVariation,c1Variation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Inertia Coefficient (w) and Personal Acceleration Coefficient (c1)');
xlabel('Inertia Coefficient (w)');
ylabel('Personal Acceleration Coefficient (c1)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
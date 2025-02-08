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
params.c1 = 1.5;              % Personal Acceleration Coefficient

params.R = 100;             % Static Penalty Parameter
%Generation numbers needed to be plot as a graph
params.genNumber = [1,30,100];
params.toleranceValue = 517.063 ; % this is the optimum solution, but used to demonstrate the convergence for this problem 

%% Intertia Coefficient (w) and Social Acceleration Coefficient (c2)

%save different values of c1 and c2 inorder to do the experiment
wVariation = [0:2:10];
c2Variation = [0:2:10];

% size of variation arrays
sizeOfWVariation = numel(wVariation);
sizeOfc2Variation = numel(c2Variation);

% use two for loops to do the experiment with various combinations of w
% and c2
for i=1:sizeOfWVariation
     % Intertia Coefficient (w)
    params.w = wVariation(i);
    for j=1:sizeOfc2Variation
        % Social Acceleration Coefficient (c2)
        params.c2 = c2Variation(j);
        out = PSO(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(wVariation,c2Variation);
Z= transpose(Z)
surf(X,Y,Z)
title('Intertia Coefficient (w) and Social Acceleration Coefficient (c2)');
xlabel('Intertia Coefficient (w)');
ylabel('Social Acceleration Coefficient (c2)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
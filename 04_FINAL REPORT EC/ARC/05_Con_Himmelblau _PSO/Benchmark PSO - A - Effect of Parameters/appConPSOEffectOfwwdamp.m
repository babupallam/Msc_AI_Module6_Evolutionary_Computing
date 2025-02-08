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
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient

params.R = 100;             % Static Penalty Parameter
%Generation numbers needed to be plot as a graph
params.genNumber = [1,30,100];
params.toleranceValue = 517.063 ; % this is the optimum solution, but used to demonstrate the convergence for this problem 

%% Effect of Inertia Coefficient (w) and Damping Ratio of Inertia Coefficient (wdamp)

%save different values of w and wdamp inorder to do the experiment
wVariation = [1:2:10];
wdampVariation = [-1:0.3:1];


% use two for loops to do the experiment with various combinations of w
% and wdamp
for i=1:numel(wVariation)
     % Intertia Coefficient (w):
    params.w = wVariation(i);
    for j=1:numel(wdampVariation)
        % Damping Ratio of Inertia Coefficient (wdamp)
        params.wdamp = wdampVariation(j);
        out = PSO(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(wVariation,wdampVariation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Inertia Coefficient (w) and Damping Ratio of Inertia Coefficient (wdamp)');
xlabel('Inertia Coefficient (w)');
ylabel('Damping Ratio of Inertia Coefficient (wdamp)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
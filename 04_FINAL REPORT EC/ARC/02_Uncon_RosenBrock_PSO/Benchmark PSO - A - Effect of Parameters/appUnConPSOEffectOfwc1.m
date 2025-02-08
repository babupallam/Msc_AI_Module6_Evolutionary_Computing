%% PSO - Unconstraint RosenBrock Function 

clc; clear;
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables
%% Parameters of PSO

params.MaxIt = 200;        % Maximum Number of Iterations
params.nPop = 40;           % Population Size (Swarm Size)
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1
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
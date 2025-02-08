%% PSO - Unconstraint RosenBrock Function 

clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables
params.toleranceValue = 10^(-3); %tolerance value which can be accepted as solution with the maximum error allowed
%% Parameters of PSO

params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1

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
        out = PSO(problem, params);
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
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
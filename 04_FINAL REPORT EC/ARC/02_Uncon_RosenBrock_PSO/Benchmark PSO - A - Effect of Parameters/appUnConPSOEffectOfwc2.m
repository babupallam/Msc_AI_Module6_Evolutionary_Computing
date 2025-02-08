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
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1

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
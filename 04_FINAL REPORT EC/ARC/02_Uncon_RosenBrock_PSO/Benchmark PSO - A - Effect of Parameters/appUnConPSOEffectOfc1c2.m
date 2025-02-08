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
params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1
%% Personal Acceleration Coefficient (c1) and Social Acceleration Coefficient (c2)

%save different values of c1 and c2 inorder to do the experiment
c1Variation = [-2:0.5:2];
c2Variation = [-2:0.5:2];


% use two for loops to do the experiment with various combinations of c1
% and c2
for i=1:numel(c1Variation)
     % Personal Acceleration Coefficient (c1)
    params.c1 = c1Variation(i);
    for j=1:numel(c2Variation)
        % Social Acceleration Coefficient (c2)
        params.c2 = c2Variation(j);
        out = PSO(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(c1Variation,c2Variation);
Z= transpose(Z)
surf(X,Y,Z)
title('Personal Acceleration Coefficient (c1) and Social Acceleration Coefficient (c2)');
xlabel('Personal Acceleration Coefficient (c1)');
ylabel('Social Acceleration Coefficient (c2)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 200;        % Maximum Number of Iterations
params.nPop = 40;           % Population Size (Swarm Size)
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1

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
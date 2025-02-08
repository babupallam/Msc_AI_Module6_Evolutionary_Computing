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
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient
params.toleranceValue = 10^-2; % which is not the optimum solution for this problme when x=1 and y=1
%Generation numbers needed to be plot as a graph
params.genNumber = [1,10, 20];

%% Call PSO functions
out = PSO_ForContour(problem, params);

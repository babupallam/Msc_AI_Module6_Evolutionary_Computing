%% DE /rand/1/bin
clc; clear;

%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);    % Cost Function
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = -5;            % Lower Bound of Decision Variables
problem.VarMax = 5;             % Upper Bound of Decision Variables
problem.toleranceValue = 0; % tolerance value at which the solution is acceptable with the maximum error possible

%% DE Parameters

params.MaxIt = 1000;       % Maximum Number of Iterations
params.nPop = 40;          % Population Size
params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability
%Generation numbers needed to be plot as a graph
params.genNumber = [1,10,20,40];

%% Calling DE
out = DE_ForContour(problem, params);

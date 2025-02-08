% RGA with Unconstrainted RosenBrock Function (Optimum value when f(1,1)=0)
clc; clear;
%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 0; % tolerance value at which the solution is acceptable with the maximum error possible

%% GA Parameters

params.MaxIt = 50000;
params.nPop = 40;
params.beta = 1;% For random probability in selection Operator 
params.pC = 1;  % Probability of crossover
params.mu = 0.5; % = 1/nVar  % Mutation probability

%Generation numbers needed to be plot as a graph
params.genNumber = [1,100,5000,50000];
%% Run Real GA
out = RunRGAContour(problem, params);

%% DE /rand/1/bin
clc; clear;

%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);    % Cost Function
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = -5;            % Lower Bound of Decision Variables
problem.VarMax = 5;             % Upper Bound of Decision Variables
problem.toleranceValue = 10^-5; % tolerance value at which the solution is acceptable with the maximum error possible

%% DE Parameters

params.MaxIt = 1000;       % Maximum Number of Iterations
% params.nPop = 4;          % Population Size -- TEST1
params.nPop = 50;          % Population Size
params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.2;          % Crossover Probability
%% Calling DE
out = DE(problem, params);

%% Show Results
%out contains, BestCost in each iteration, BestSol received so far, and the
%minimum iteration it took to get the optimum solution(here it is tolerance
%value)
%plot the result which is in out.BestCost
semilogy(out.BestCost , 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;

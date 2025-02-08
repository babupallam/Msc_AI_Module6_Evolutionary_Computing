%% DE /rand/1/bin
clc; clear;

%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);    % Cost Function
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = -5;            % Lower Bound of Decision Variables
problem.VarMax = 5;             % Upper Bound of Decision Variables
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible

%% DE Parameters

params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability

%% Effect of MaxIt and nPop

%save different values of MaxIt and nPop inorder to do the experiment
maxItVariation = [100, 200, 300, 400, 500];
nPopVariation = [10, 30, 100, 500, 1000];

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(maxItVariation)
        params.MaxIt = maxItVariation(i);       % Maximum Number of Iterations
    for j=1:numel(nPopVariation)
        params.nPop = nPopVariation(i);          % Population Size
        out = DE(problem, params);
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
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
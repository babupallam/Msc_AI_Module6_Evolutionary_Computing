%% DE /best/1/bin RosenBrock Function Unconstrainted
clc; clear;

%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);    % Cost Function
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = -5;            % Lower Bound of Decision Variables
problem.VarMax = 5;             % Upper Bound of Decision Variables
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible

%% DE Parameters
params.MaxIt = 1000;       % Maximum Number of Iterations
params.nPop = 40;          % Population Size
params.pCR = 0.5;          % Crossover Probability (in between 0 and 1)
%% Effect of beta(beta_min and beta_max) in the result

%save different values of beta_min and beta_max 
boundVariations = [0:0.25:2];% for figure-A
% boundVariations = [-2,-1,3,4];% for figure-C

% size of variation arrays for the loop generation
sizeOfbetaMinVariation = numel(boundVariations);
sizeOfbetaMaxVariation = numel(boundVariations);

% use two for loops to do the experiment with various combinations
for i=1:sizeOfbetaMaxVariation
    % Lowerbound for scaling factor-beta (bata_min)
    params.beta_min = boundVariations(i);
    for j=1:sizeOfbetaMaxVariation
        % Upperbound for scaling factor-beta (bata_max)
        params.beta_max = boundVariations(i);
        out = DE_V1(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(boundVariations,boundVariations);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Bounds for the Scaling Factors (beta-min and beta-max)')
xlabel('Lowerbound of Beta (beta-min');
ylabel('Upperbound of Beta (beta-max)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
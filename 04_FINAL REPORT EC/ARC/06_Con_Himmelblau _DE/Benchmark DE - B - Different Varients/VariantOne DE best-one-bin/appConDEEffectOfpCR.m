%% DE /best/1/bin with Contraint HImmelblue function
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables    x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables
problem.toleranceValue = 517.063; % this is not the optimum solution, but to demonstrate the convergence for this problem 

%% DE Parameters

params.MaxIt = 200;       % Maximum Number of Iterations
params.nPop = 50;          % Population Size
params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.R = 100;             % Static Penalty Parameter

%% Calling DE for different pCR values to see the effect of it in the Result
%different number of 'pCR' values
pCRVariation = [0:0.2:1]; 

%Variable to store the number of Iterations take to reach the tolerance
%value
numberOfIterations = numel(pCRVariation);
%repeat the test for numberOfIterations times
for i=1:numberOfIterations
    %assign value to pCR
    params.pCR = pCRVariation(i);
    out= DE(problem, params);
    % plot the result into the existing graph else create a new graph
    hold on
    semilogy(out.BestCost,"LineWidth",2);
    hold off
end

% Describing the attributes for the graph
title("Effect of Crossover Probability (pCR)")
xlabel('Iterations (MaxIt)');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
ylim([500 600])
xlim([0 50]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
grid on;
legend(num2str(pCRVariation.'), 'location', 'northeast');

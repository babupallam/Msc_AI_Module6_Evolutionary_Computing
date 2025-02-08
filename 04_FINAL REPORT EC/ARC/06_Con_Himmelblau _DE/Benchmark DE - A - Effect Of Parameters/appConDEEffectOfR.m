%% DE /rand/1/bin with Contraint HImmelblue function
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
params.beta_min = 0.3;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability
params.R = 100;             % Static Penalty Parameter

%% Effect of Static Penality Parameter R

%save different values of beta values for the experiment
RVariation = [0,2,10,15,50,100,500,1000];

%Do the experiment for number of Iteration
for i=1:numel(RVariation)
    params.R = RVariation(i);
    out= DE(problem, params); 
    % plot the result into the existing graph
    hold on
    plot(out.BestCost,"LineWidth",2)
    hold off
end
% Describing the attributes for the graph
title("Effect of R Value");
xlabel('Iterations');
ylabel('Best Cost');
xlim([0,40]);
ylim([500, 600])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(RVariation'), 'location', 'northeast');
grid on;
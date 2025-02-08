%% RGA - Constraints Himmelblue Function and Static Penalty 
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.toleranceValue = 520; % this is the optimum solution when x1 = 3.763 and x2 = 4.947 

%% RGA Parameters
params.MaxIt = 1000;
params.nPop = 40;
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator

params.R = 100;  % Static Penalty Parameter
%% Effect of Different Bounds of Variables
%different number of 'Variable Bound' values
diffVariations = [1,3,5,7,10];

%Perform test with different variations mentioned above
for i=1:numel(diffVariations)
    problem.VarMin = -diffVariations(i);
    problem.VarMax = diffVariations(i);
    out= RunRGA(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.bestcost,"LineWidth",2);
    hold off
end
% Describing the attributes for the graph
title("Effect of Different Bounds of Variables")
xlabel('Iterations');
ylabel('Best Cost');
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(diffVariations'), 'location', 'northeast');
grid on;




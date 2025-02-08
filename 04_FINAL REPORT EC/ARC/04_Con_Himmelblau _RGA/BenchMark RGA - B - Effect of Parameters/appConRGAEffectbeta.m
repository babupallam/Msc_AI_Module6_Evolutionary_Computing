%% RGA - Constraints Himmelblue Function and Static Penalty 
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables   x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables
problem.toleranceValue = 520; % this is the optimum solution when x1 = 3.763 and x2 = 4.947 

%% GA Parameters

params.MaxIt = 5000;
params.nPop = 40;
params.beta = 1;% For random probability in selection Operator 
params.pC = 1;  % Probability of crossover
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.R = 100;  % Static Penalty Parameter

%% Effect of Beta Value)
%save different values of beta values for the experiment
betaVariation = [-10, -1, 1, 0 1, 3];

%Variable to store the number of Iterations take to reach the minimum
%value (In Min One Problem, it is zero)
numberOfIterations = nnz(betaVariation);
iterationsForSolution = inf(1,numberOfIterations);
%Do the experiment for number of Iteration
for i=1:numberOfIterations
    params.beta = betaVariation(i);
    out = RunRGA(problem, params); 
    % plot the result into the existing graph
    hold on
    plot(out.bestcost,"LineWidth",2)
    hold off
end
% Describing the attributes for the graph
title("Effect of Beta Value (beta)")
xlabel('Iterations');
ylabel('Best Cost');
grid on;
ylim([500, 600])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(betaVariation'), 'location', 'northeast');

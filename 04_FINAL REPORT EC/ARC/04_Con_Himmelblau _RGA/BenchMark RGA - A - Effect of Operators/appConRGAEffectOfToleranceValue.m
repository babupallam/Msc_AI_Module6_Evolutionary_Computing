%% RGA - Constraints Himmelblue Function and Static Penalty 
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables   x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables

%% RGA Parameters
params.MaxIt = 1000;
params.nPop = 40;
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator

params.R = 100;  % Static Penalty Parameter

%% Effect of Tolerance Value Set

%different Tolerance values
diffVariations = [518, 520, 530, 540, 550];

%Perform test with different variations mentioned above
for i=1:numel(diffVariations)
    problem.toleranceValue = diffVariations(i);
    out= RunRGA(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.bestcost,"LineWidth",2);
    %draw a line parallel to x axis to find on which iteration the output
    %reaches to tolerance value
    yline(problem.toleranceValue,'-',{num2str(problem.toleranceValue) });
    hold off
end
% Describing the attributes for the graph
title("Effect of Tolerance Value Set")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
ylim([500 600])
legend(num2str(diffVariations'), 'location', 'northeast');
grid on;




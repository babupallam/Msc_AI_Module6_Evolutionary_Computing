%% DE /best/2/bin with Contraint HImmelblue function
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.toleranceValue = 517.063; % this is not the optimum solution, but to demonstrate the convergence for this problem 

%% DE Parameters

params.MaxIt = 200;       % Maximum Number of Iterations
params.nPop = 50;          % Population Size
params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability
params.R = 100;             % Static Penalty Parameter
%% Calling DE for various Range of nVar
RangeVariations = [3, 6, 10, 15, 20];
for i=1:numel(RangeVariations)
    %performing the test
    problem.VarMin = 0; % since x1 and x2 are positive % Lower Bound of Decision Variables
    problem.VarMax = RangeVariations(i);  % Upper Bound of Decision Variables 
    out= DE(problem, params);
    % plot the result into the existing graph else create a new graph
    hold on
    semilogy(out.BestCost,"LineWidth",2);
    hold off
end

% Describing the attributes for the graph
title("Effect of nVar Range (VarMin and VarMax)")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
ylim([500, 600])
xlim([0 30]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
grid on;
legend(num2str([1:5].'), 'location', 'northeast');

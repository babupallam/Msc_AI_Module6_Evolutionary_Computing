%% PSO - Constraint Himmelblu Funciton with Static Penalty
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables    x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient

params.toleranceValue = 517.063 ; % this is the optimum solution, but used to demonstrate the convergence for this problem 

%% Effect of Static Penality Parameter R

%save different values of beta values for the experiment
RVariation = [0,2,10,15,50,100,500,1000];

%Do the experiment for number of Iteration
for i=1:numel(RVariation)
    params.R = RVariation(i);
    out= PSO(problem, params); 
    % plot the result into the existing graph
    hold on
    plot(out.BestCosts,"LineWidth",2)
    hold off
end
% Describing the attributes for the graph
title("Effect of R Value");
xlabel('Iterations');
ylabel('Best Cost');
% xlim([0,25]);
ylim([500, 600])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(params.toleranceValue,'-',{'Acceptable','Limit:', num2str(params.toleranceValue) });
legend(num2str(RVariation'), 'location', 'northeast');
grid on;
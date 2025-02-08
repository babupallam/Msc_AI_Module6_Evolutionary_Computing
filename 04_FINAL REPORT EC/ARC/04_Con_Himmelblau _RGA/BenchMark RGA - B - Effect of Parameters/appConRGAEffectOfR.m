%% RGA - Constraints Himmelblue Function and Static Penalty 
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value

problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables   x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables
problem.toleranceValue = 525; % this is the optimum solution when x1 = 3.763 and x2 = 4.947 

%% RGA Parameters
params.MaxIt = 5000;
params.nPop = 40;
params.pC = 1;  % Probability of crossover
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.beta =1; %coeffient of probability distribution in selection operator

%% Effect of Static Penality Parameter R

%save different values of beta values for the experiment
RVariation = [0,2,10,15,50,100,500,1000];

%Do the experiment for number of Iteration
for i=1:numel(RVariation)
    params.R = RVariation(i);
    out= RunRGA(problem, params); 
    % plot the result into the existing graph
    hold on
    plot(out.bestcost,"LineWidth",2)
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
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(RVariation'), 'location', 'northeast');
grid on;
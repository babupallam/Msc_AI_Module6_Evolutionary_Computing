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
params.pCR = 0.5;          % Crossover Probability
params.R = 100;             % Static Penalty Parameter

%% Calling DE
% number of iterations required
noOfTests = 10;
% array to store the result of each test, initially all assign to infinity
minIterationsFromEachTest = inf(1,noOfTests);
%test the experiment for noOfTests times
for i=1:noOfTests
    out = DE(problem, params);
    minIterationsFromEachTest(i)=out.minIterationToReachToleranceValue;
    %plot the graph for this test result
    hold on
    plot(out.BestCost,"LineWidth",2)
    hold off
end

%% Show Results
%Calculate Median value
medianOfAllSolutions = median(minIterationsFromEachTest);

%plot median value in the graph
hold on
plot(medianOfAllSolutions,0,"r*","MarkerSize",20)
hold off
title("The Median of 10 Tests - Benchmark A")
%attributes to the graph
xlabel('Iteration');
ylabel('Best Cost');
yline(problem.toleranceValue,'-',{'Acceptable','Limit'});
xlim([0,40]);
ylim([0,800]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });

grid on;

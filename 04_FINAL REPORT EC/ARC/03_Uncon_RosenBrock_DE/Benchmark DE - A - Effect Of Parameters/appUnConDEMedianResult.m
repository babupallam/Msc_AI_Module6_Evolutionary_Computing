%% DE /rand/1/bin RosenBrock Function Unconstrainted
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
params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability

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
xlim([0,100]);
ylim([0,0.1]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });

grid on;

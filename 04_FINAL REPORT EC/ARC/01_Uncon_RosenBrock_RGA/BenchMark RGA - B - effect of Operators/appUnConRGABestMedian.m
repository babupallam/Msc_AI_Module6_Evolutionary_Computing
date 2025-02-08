    clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible


%% GA Parameters
%Based on the tuned parameter values
params.MaxIt = 100;
params.nPop = 400;
params.beta = 5;% For random probability in selection Operator 
params.pC = 0.7;  % Probability of crossover
params.mu = 0.01; % = 1/nVar  % Mutation probability


%% Calling PSO - FOR MEDIAN CALCULATION
% Run 10 experiments and find the median of those results
numberOfIterations =10;
experimentsResults = zeros(1,numberOfIterations);
for i=1:numberOfIterations
    out = RunRGA(problem, params);
    experimentsResults(i) = out.minIterationToReachToleranceValue;
    %plot the value in the graph if exists otherwise plot it in a new graph
    hold on
    semilogy(out.bestcost,"LineWidth",2)
    grid on;
    hold off
end
disp(["Results found: " num2str(experimentsResults)])
medianOfResults = median(experimentsResults);
disp(["Median of the Results (Min iterations needed to reach the tolerance value): " num2str(medianOfResults)])

%plot median value in the graph
hold on
semilogy(medianOfResults,0,"r*","MarkerSize",20)
hold off

%graph parameters
title("Median Result");
xlabel('Iterations');
ylabel('Best Cost');
xlim([0,100]);
ylim([0, 0.5])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(experimentsResults'), 'location', 'northeast');
grid on;




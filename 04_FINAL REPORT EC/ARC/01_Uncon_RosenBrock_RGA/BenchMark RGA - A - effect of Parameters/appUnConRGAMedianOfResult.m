    clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible


%% GA Parameters

params.MaxIt = 500;
params.nPop = 40;
params.beta = 1;% For random probability in selection Operator 
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator


%% Calling RGA - FOR MEDIAN CALCULATION
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
xlim([0,200]);
ylim([0, 10^-1])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(experimentsResults'), 'location', 'northeast');
grid on;




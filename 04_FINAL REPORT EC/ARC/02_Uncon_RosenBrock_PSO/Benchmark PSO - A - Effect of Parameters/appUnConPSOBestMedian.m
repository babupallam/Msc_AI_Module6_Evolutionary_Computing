%% PSO - Unconstraint RosenBrock Function 

clc; clear;
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables
%% Parameters of PSO

params.MaxIt = 200;        % Maximum Number of Iterations
params.nPop = 1000;           % Population Size (Swarm Size)
params.w = 1;               % Intertia Coefficient
params.wdamp = -0.4;        % Damping Ratio of Inertia Coefficient
params.c1 = -0.5;              % Personal Acceleration Coefficient
params.c2 = 2;              % Social Acceleration Coefficient
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1

%% Calling PSO - FOR MEDIAN CALCULATION
% Run 10 experiments and find the median of those results
numberOfIterations =10;
experimentsResults = zeros(1,numberOfIterations);
for i=1:numberOfIterations
    %perform PSO
    out = PSO(problem, params);
    experimentsResults(i) = out.minIterationToReachToleranceValue;
    %plot the value in the graph if exists otherwise plot it in a new graph
    hold on
    semilogy(out.BestCosts,"LineWidth",2)
    grid on;
    hold off
end
%display the result
disp(["Results found: " num2str(experimentsResults)])
%find the median
medianOfResults = median(experimentsResults);
disp(["Median of the Results (Min iterations needed to reach the tolerance value): " num2str(medianOfResults)])

%plot median value in the graph
hold on
semilogy(medianOfResults,0,"r*","MarkerSize",20)
hold off
%add graph attributes
xlabel('Iterations');
ylabel('Best Cost');
title("Median of the result - PSO - RosenBrock Function UnConstrainted")
xlim([0,10]);
ylim([0, 1])
yline(params.toleranceValue,'-',{'Acceptable','Limit:', num2str(params.toleranceValue) });
legend(num2str(experimentsResults'), 'location', 'northeast');

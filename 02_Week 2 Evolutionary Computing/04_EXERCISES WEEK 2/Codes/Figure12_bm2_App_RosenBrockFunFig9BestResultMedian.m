clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 10;        % Maximum Number of Iterations
params.nPop = 15000;           % Population Size (Swarm Size)
params.w = 7;               % Intertia Coefficient
params.wdamp = 0.2;        % Damping Ratio of Inertia Coefficient
params.c1 = 1;              % Personal Acceleration Coefficient
params.c2 = 1;              % Social Acceleration Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Informatin
params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed

%% Calling PSO - FOR MEDIAN CALCULATION
% Run 10 experiments and find the median of those results
numberOfIterations =10;
experimentsResults = zeros(1,numberOfIterations);
for i=1:numberOfIterations
    out = pso_RosenBrockFunWithToleranceValue(problem, params);
    experimentsResults(i) = out.minIterationForToleranceValue;
    %plot the value in the graph if exists otherwise plot it in a new graph
    hold on
    semilogy(out.BestCosts,"LineWidth",2)
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

xlabel('Iterations');
ylabel('Best Cost');
xlim([0,30]);
ylim([0, 10^-4])
yline(params.toleranceValue,'-',{'Acceptable','Limit:', num2str(params.toleranceValue) });
legend(num2str(experimentsResults'), 'location', 'northeast');

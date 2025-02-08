%% PSO - Unconstraint RosenBrock Function 

clc; clear;
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables

%% Parameters of PSO

% Constriction Coefficients
kappa = 1;
phi1 = 9;
phi2 = 2.05;
phi = phi1 + phi2;
chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

params.MaxIt = 1000;        % Maximum Number of Iterations
params.nPop = 40;           % Population Size (Swarm Size)
%adding dynamicity to w (Inertia Coefficient) 
params.w = chi;             % Intertia Coefficient
%adding dynamicity to wdamp (Damping Ratio of Inertia Coefficient)
params.wmax = chi;          % Maximum value of Intertia Coefficient
params.wmin = -10;            % Minimum value of Intertia Coefficient
params.c1 = chi*phi1;       % Personal Acceleration Coefficient
params.c2 = chi*phi2;       % Social Acceleration Coefficient

params.toleranceValue = 10^(-2); %tolerance value which can be accepted as solution with the maximum error allowed

%% Calling PSO - FOR MEDIAN CALCULATION
% Run 10 experiments and find the median of those results
numberOfIterations =10;
experimentsResults = zeros(1,numberOfIterations);
for i=1:numberOfIterations
    out = PSO(problem, params);
    experimentsResults(i) = out.minIterationToReachToleranceValue;
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

title("Median Result");
xlabel('Iterations');
ylabel('Best Cost');
xlim([0,50]);
ylim([0, 0.1])
yline(params.toleranceValue,'-',{'Acceptable','Limit:', num2str(params.toleranceValue) });
legend(num2str(experimentsResults'), 'location', 'northeast');

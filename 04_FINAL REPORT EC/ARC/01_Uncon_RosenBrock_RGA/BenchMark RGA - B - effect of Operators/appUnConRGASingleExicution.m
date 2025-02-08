    clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible


%% GA Parameters

params.MaxIt = 5000; %Maximum number of iteations
params.nPop = 40; %number of populations
params.beta = 1;% For random probability in selection Operator 
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator


%% Run GA

out = RunRGA(problem, params);


%% Results

semilogy(out.bestcost, 'LineWidth', 2);
xlabel('Iterations');
ylabel('Best Cost');
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
grid on;




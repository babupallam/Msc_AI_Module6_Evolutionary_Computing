clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible

%% GA Parameters
params.MaxIt = 200;
params.nPop = 40;
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator


%% Effect of MaxIt and nPop

%save different values of beta values for the experiment
betaVariation = [-10, -1, 0, 1, 3, 5];

%Do the experiment for number of Iteration
for i=1:numel(betaVariation)
    params.beta = betaVariation(i);
    out= RunRGA(problem, params); 
    % plot the result into the existing graph
    hold on
    plot(out.bestcost,"LineWidth",2)
    hold off
end
% Describing the attributes for the graph
title("Effect of Beta Value (beta)");
xlabel('Iterations');
ylabel('Best Cost');
xlim([0,25]);
ylim([0, 1])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(betaVariation'), 'location', 'northeast');
grid on;
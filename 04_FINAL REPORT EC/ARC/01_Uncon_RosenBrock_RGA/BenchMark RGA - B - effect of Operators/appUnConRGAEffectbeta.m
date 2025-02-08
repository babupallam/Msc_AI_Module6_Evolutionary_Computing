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
params.mu = 0.5; % = 1/nVar  % Mutation probability

%% Effect of Beta Value)
%save different values of beta values for the experiment
betaVariation = [-10, -1, 1, 3, 5];

%Variable to store the number of Iterations take to reach the minimum
%value (In Min One Problem, it is zero)
numberOfIterations = nnz(betaVariation);
iterationsForSolution = inf(1,numberOfIterations);
%Do the experiment for number of Iteration
for i=1:numberOfIterations
    params.beta = betaVariation(i);
    out = RunRGA(problem, params); 
    % plot the result into the existing graph
    hold on
    plot(out.bestcost,"LineWidth",2)
    hold off
end
% Describing the attributes for the graph
title("Effect of Beta Value (beta)")
xlabel('Iterations');
ylabel('Best Cost');
grid on;
xlim([0,500]);
ylim([0, 0.1])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(betaVariation'), 'location', 'northeast');

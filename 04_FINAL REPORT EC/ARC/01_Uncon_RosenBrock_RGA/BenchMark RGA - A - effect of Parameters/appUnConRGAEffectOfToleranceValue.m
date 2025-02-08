clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide


%% GA Parameters

params.MaxIt = 500;
params.nPop = 40;
params.beta = 1;% For random probability in selection Operator
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator


%% Effect of Tolerance Value Set

%different Tolerance values
diffVariations = [10^-1,10^-2,10^-3,10^-4];

%Perform test with different variations mentioned above
for i=1:numel(diffVariations)
    problem.toleranceValue = diffVariations(i);
    out= RunRGA(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.bestcost,"LineWidth",2);
    %draw a line parallel to x axis to find on which iteration the output
    %reaches to tolerance value
    yline(problem.toleranceValue,'-',{num2str(problem.toleranceValue) });
    hold off
end
% Describing the attributes for the graph
title("Effect of Tolerance Value Set")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
xlim([0,200]);
ylim([0,0.11])
legend(num2str(diffVariations'), 'location', 'northeast');
grid on;




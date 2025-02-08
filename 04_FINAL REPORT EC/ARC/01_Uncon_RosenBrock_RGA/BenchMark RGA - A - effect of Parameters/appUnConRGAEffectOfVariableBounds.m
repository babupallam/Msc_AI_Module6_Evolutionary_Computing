    clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible


%% GA Parameters

params.MaxIt = 500;
params.nPop = 40;
params.beta = 1;% For random probability in selection Operator 
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator


%% Effect of Different Bounds of Variables
%different number of 'Variable Bound' values
diffVariations = [1,3,5,7,10];

%Perform test with different variations mentioned above
for i=1:numel(diffVariations)
    problem.VarMin = -diffVariations(i);
    problem.VarMax = diffVariations(i);
    out= RunRGA(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.bestcost,"LineWidth",2);
    hold off
end
% Describing the attributes for the graph
title("Effect of Different Bounds of Variables")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
xlim([0,30]);
ylim([0, 0.5])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
legend(num2str(diffVariations'), 'location', 'northeast');
grid on;




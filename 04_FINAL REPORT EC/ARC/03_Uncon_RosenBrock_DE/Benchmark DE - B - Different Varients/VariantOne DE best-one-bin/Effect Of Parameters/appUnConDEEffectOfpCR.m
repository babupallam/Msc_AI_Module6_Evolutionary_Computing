%% DE /best/1/bin RosenBrock Function Unconstrainted
clc; clear;

%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);    % Cost Function
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = -5;            % Lower Bound of Decision Variables
problem.VarMax = 5;             % Upper Bound of Decision Variables
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible

%% DE Parameters
params.MaxIt = 1000;       % Maximum Number of Iterations
params.nPop = 40;          % Population Size
params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
%% Calling DE for different pCR values to see the effect of it in the Result
%different number of 'pCR' values
pCRVariation = [0:0.2:1]; 

%Variable to store the number of Iterations take to reach the tolerance
%value
numberOfIterations = numel(pCRVariation);
%repeat the test for numberOfIterations times
for i=1:numberOfIterations
    %assign value to pCR
    params.pCR = pCRVariation(i);
    out= DE_V1(problem, params);
    % plot the result into the existing graph else create a new graph
    hold on
    semilogy(out.BestCost,"LineWidth",2);
    hold off
end

% Describing the attributes for the graph
title("Effect of Crossover Probability (pCR)")
xlabel('Iterations (MaxIt)');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
ylim([0 0.1])
xlim([0 40]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
grid on;
legend(num2str(pCRVariation.'), 'location', 'northeast');

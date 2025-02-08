%% DE /rand/1/bin
clc; clear;

%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);    % Cost Function
problem.nVar = 2;              % Number of Decision Variables
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible

%% DE Parameters
params.MaxIt =1000;
params.nPop = 40;          % Population Size
params.beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
params.beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
params.pCR = 0.5;          % Crossover Probability
%% Calling DE for various Range of nVar
numberofRangeVariations =5;
for i=1:numberofRangeVariations
    %performing the test
    problem.VarMin = -1 * (i*10); % Lower Bound of Decision Variables
    problem.VarMax = 1 *(i*10);  % Upper Bound of Decision Variables 
    out= DE(problem, params);
    % plot the result into the existing graph else create a new graph
    hold on
    semilogy(out.BestCost,"LineWidth",2);
    hold off
end

% Describing the attributes for the graph
title("Effect of nVar Range (VarMin and VarMax)")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
ylim([0 0.1])
xlim([0 100]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(problem.toleranceValue,'-',{'Acceptable','Limit:', num2str(problem.toleranceValue) });
grid on;
legend(num2str([1:5].'), 'location', 'northeast');

clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO
params.nPop = 50;           % Population Size (Swarm Size)
params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 2;              % Personal Acceleration Coefficient
params.c2 = 2;              % Social Acceleration Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Informatin

params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
%% Effect of Maximum Iteration (MaxIt)
%different number of 'MaxIt' values
maxItenVariation = [200:200:2000];

%Variable to store the number of Iterations take to reach the minimum
%value (In Min One Problem, it is zero)
numberOfIterations = numel(maxItenVariation);
%Run the same Binary GA 30 times
for i=1:numberOfIterations
    params.MaxIt = maxItenVariation(i);
    out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out(i).BestCosts,"LineWidth",2);
    hold off
end
% Describing the attributes for the graph
title("Effect of Maximum Iteration (MaxIt)")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
ylim([0 10^-4])
xlim([0 200]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to 10^-10
yline(10^-5,'-',{'Acceptable','Limit'});
grid on;
legend(num2str(maxItenVariation.'), 'location', 'northeast');

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
phi1 = 2.05;
phi2 = 2.05;
phi = phi1 + phi2;
chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

params.MaxIt = 1000;        % Maximum Number of Iterations
params.nPop = 40;           % Population Size (Swarm Size)
params.w =chi;
%adding dynamici nature to both w (Inertia Coefficient) and wdamp (Damping
%Ratio of Inertia Coefficient)
params.wmax = chi;          % Maximum value of Intertia Coefficient
params.c1 = chi*phi1;       % Personal Acceleration Coefficient
params.c2 = chi*phi2;       % Social Acceleration Coefficient

params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1

%% Effect of Constraint Variable : Wmin

%different number of 'wmin' values
wminVariations = [-10:5:30];

numberOfIterations = numel(wminVariations);
%run the experiment for numberOfIterations times 
for i=1:numberOfIterations
    params.wmin = wminVariations(i);
    out= PSO(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.BestCosts,"LineWidth",2,'DisplayName',num2str(wminVariations(i)));
    hold off
end
% Describing the attributes for the graph
title("Effect of Variable : Wmin")
xlabel('Iterations');
ylabel('Best Cost');
% make the y limit to a narrow region to get a closer look
ylim([0 0.1]);
xlim([0 200])
%draw a line parallel to x axis to find on which iteration the output
%reaches to the tolerance value
yline(params.toleranceValue,'-',{'Acceptable','Limit: ' num2str(params.toleranceValue)});
grid on;
legend(num2str(wminVariations.'), 'location', 'northeast');
clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;      % Number of Unknown (Decision) Variables
problem.VarMin = -10;   % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables


%% Parameters of PSO

% Constriction Coefficients
kappa = 1;
phi1 = 2.05;
phi2 = 2.05;
phi = phi1 + phi2;
chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

params.MaxIt = 200;        % Maximum Number of Iterations
params.w = chi;             % Intertia Coefficient
params.wdamp = 1;           % Damping Ratio of Inertia Coefficient
params.c1 = chi*phi1;       % Personal Acceleration Coefficient
params.c2 = chi*phi2;       % Social Acceleration Coefficient
params.ShowIterInfo = true; % Flag for Showing Iteration Information
params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed

%% Effect of Maximum Iteration (MaxIt)
%different number of 'MaxIt' values
nPopVariation = [10:300:2000];

%Variable to store the number of Iterations take to reach the minimum
%value (In Min One Problem, it is zero)
numberOfIterations = numel(nPopVariation);
%Run the same Binary GA 30 times
for i=1:numberOfIterations
    params.nPop = nPopVariation(i);
    out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out(i).BestCosts,"LineWidth",2);
    hold off
end
% Describing the attributes for the graph
title("Effect of Population Size (nPop)")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
ylim([0 10^-4])
xlim([0 300]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to 10^-10
yline(10^-5,'-',{'Acceptable','Limit'});
grid on;
legend(num2str(nPopVariation.'), 'location', 'northeast');
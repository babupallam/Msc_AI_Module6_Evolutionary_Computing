%% PSO - Constraint Himmelblu Funciton with Static Penalty
clc; clear;

%% Problem Definition
problem.CostFunction = @(x1,x2) HimmelblauFunction(x1,x2); % Cost Function
problem.Constraints = @(x1,x2,R) InequalityConstraints(x1,x2,R); % Constraint
problem.FitnessValue = @(x1,x2,R) problem.CostFunction(x1,x2) + problem.Constraints(x1,x2,R); % Fitness Value
problem.nVar = 2;              % Number of Decision Variables
problem.VarMin = 0;            % Lower Bound of Decision Variables    x1 and x2 are greater than 0
problem.VarMax = 6;             % Upper Bound of Decision Variables

%% Parameters of PSO
% Constriction Coefficients
kappa = 1;
phi1 = 2.05;
phi2 = 2.05;
phi = phi1 + phi2;
chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 40;           % Population Size (Swarm Size)
%adding dynamicity to w (Inertia Coefficient) 
params.w = chi;             % Intertia Coefficient
%adding dynamicity to wdamp (Damping Ratio of Inertia Coefficient)
params.wmax = chi;          % Maximum value of Intertia Coefficient
params.wmin = 0.1;            % Minimum value of Intertia Coefficient
params.c1 = chi*phi1;       % Personal Acceleration Coefficient
params.c2 = chi*phi2;       % Social Acceleration Coefficient

params.R = 100;             % Static Penalty Parameter

%% Effect of Tolerance Value Set

%different Tolerance values
diffVariations = [517.063, 515, 520, 530];

%Perform test with different variations mentioned above
for i=1:numel(diffVariations)
    params.toleranceValue = diffVariations(i);
    out= PSO(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.BestCosts,"LineWidth",2);
    %draw a line parallel to x axis to find on which iteration the output
    %reaches to tolerance value
    yline(params.toleranceValue,'-',{num2str(params.toleranceValue) });
    hold off
end
% Describing the attributes for the graph
title("Effect of Tolerance Value Set")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
xlim([0,25]);
ylim([500 560])
legend(num2str(diffVariations'), 'location', 'northeast');
grid on;




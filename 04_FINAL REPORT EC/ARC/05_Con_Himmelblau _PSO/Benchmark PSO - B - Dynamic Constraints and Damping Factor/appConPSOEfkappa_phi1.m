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

params.R = 100;             % Static Penalty Parameter
params.toleranceValue = 517.063 ; % this is the optimum solution, but used to demonstrate the convergence for this problem
%% Effect of Constraint Variable : Kappa and phi1

%different number of 'kappa' values
% kappaVariations = [1:0.05:1.5]; %values in between 1 and 1.5 -- B
kappaVariations = [0.50, 0.51, 0.55, 0.7, 0.8,0.9,1]; %values in between
%different values of phi1
phi1Variations = 1:2:20;

% size of variation arrays
sizeOfkappaVariation = numel(kappaVariations);
sizeOfphi1Variation = numel(phi1Variations);


% use two for loops to do the experiment with various combinations of c1
% and c2
for i=1:sizeOfkappaVariation
    % Personal Acceleration Coefficient (c1)
    kappa = kappaVariations(i);
    for j=1:sizeOfphi1Variation
        phi1 = phi1Variations(j);
        % Constriction Coefficients
        kappa = 1;
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

        out = PSO(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(kappaVariations,phi1Variations);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of values Kappa and phi1');
xlabel('kappa value');
ylabel('phi1 value');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
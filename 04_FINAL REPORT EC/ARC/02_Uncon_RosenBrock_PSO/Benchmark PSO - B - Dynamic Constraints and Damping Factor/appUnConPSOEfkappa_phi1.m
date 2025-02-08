%% PSO - Unconstraint RosenBrock Function

clc; clear;
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables
params.toleranceValue = 10^(-2); %tolerance value which can be accepted as solution with the maximum error allowed
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
        phi1 = phi1Variations(j)
        phi2 = 2.05;
        phi = phi1 + phi2;
        chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

        params.MaxIt = 500;        % Maximum Number of Iterations
        %adding dynamicity to w (Inertia Coefficient)
        params.w = chi;             % Intertia Coefficient
        %adding dynamici nature to both w (Inertia Coefficient) and wdamp (Damping
        %Ratio of Inertia Coefficient)
        params.wmax = chi;          % Maximum value of Intertia Coefficient
        params.wmin = 0.1;            % Minimum value of Intertia Coefficient
        params.c1 = chi*phi1;       % Personal Acceleration Coefficient
        params.c2 = chi*phi2;       % Social Acceleration Coefficient
        params.nPop = 40;           % Population Size (Swarm Size)

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
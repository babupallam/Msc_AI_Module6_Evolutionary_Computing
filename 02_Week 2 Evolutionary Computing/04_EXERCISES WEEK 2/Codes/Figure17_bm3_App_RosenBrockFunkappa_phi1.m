clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;      % Number of Unknown (Decision) Variables
problem.VarMin = -10;   % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
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
         params.w = chi;             % Intertia Coefficient
         params.wdamp = 1;           % Damping Ratio of Inertia Coefficient
         params.c1 = chi*phi1;       % Personal Acceleration Coefficient
         params.c2 = chi*phi2;       % Social Acceleration Coefficient
         params.ShowIterInfo = true; % Flag for Showing Iteration Information
         params.nPop = 50;           % Population Size (Swarm Size)

        out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
        Z(i,j)= out(i).minIterationForToleranceValue;
    end
end

% For ploting the result for performance analysis, An assumption has been made as for those experimenents
% which have not reached the Tolerance value after the exicution of each experiment can be considered as the one
% which needed more than MaxIt, so MaxIt value replaces as result
% where "Inf" - (infinite) is assigned.
for i=1:sizeOfkappaVariation
    for j=1:sizeOfphi1Variation
        if Z(i,j) == Inf
            %assigning MaxIt as result for Inf value
            Z(i,j) = params.MaxIt;
        end
    end
end
% Describing the attributes for the graph
[X,Y] = meshgrid(kappaVariations,phi1Variations);
Z= transpose(Z)
surf(X,Y,Z)
title('Personal Acceleration Coefficient (c1) and Social Acceleration Coefficient (c2)');
xlabel('kappa value');
ylabel('phi1 value');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
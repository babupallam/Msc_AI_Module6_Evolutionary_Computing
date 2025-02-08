clc; clear;

%% Problem Definiton
problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.c1 = 2;               % Social Acceleration Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Information

params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
%% Intertia Coefficient (w) and Social Acceleration Coefficient (c2)

%save different values of c1 and c2 inorder to do the experiment
wVariation = [0:10];
c2Variation = [0:2:10];

% size of variation arrays
sizeOfWVariation = numel(wVariation);
sizeOfc2Variation = numel(c2Variation);

% use two for loops to do the experiment with various combinations of w
% and c2
for i=1:sizeOfWVariation
     % Intertia Coefficient (w)
    params.w = wVariation(i);
    for j=1:sizeOfc2Variation
        % Social Acceleration Coefficient (c2)
        params.c2 = c2Variation(j);
        out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
        Z(i,j)= out(i).minIterationForToleranceValue;
    end
end

% For ploting the result for performance analysis, An assumption has been made as for those experimenents
% which have not reached the Tolerance value after the exicution of each experiment can be considered as the one
% which needed more than MaxIt, so MaxIt value replaces as result
% where "Inf" - (infinite) is assigned.
for i=1:sizeOfWVariation
    for j=1:sizeOfc2Variation
        if Z(i,j) == Inf
            %assigning MaxIt as result for Inf value
            Z(i,j) = params.MaxIt;
        end
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(wVariation,c2Variation);
Z= transpose(Z)
surf(X,Y,Z)
title('Intertia Coefficient (w) and Social Acceleration Coefficient (c2)');
xlabel('Intertia Coefficient (w)');
ylabel('Social Acceleration Coefficient (c2)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
clc; clear;

%% Problem Definiton
problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c2 = 2;              % Social Acceleration Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Information

params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
%% Effect of Inertia Coefficient (w) and Personal Acceleration Coefficient (c1)

%save different values of w and c1 inorder to do the experiment
wVariation = [-2:10];
c1Variation = [-2:2:10];



% size of variation arrays
sizeOfwVariation = numel(wVariation);
sizeOfc1Variation = numel(c1Variation);

% use two for loops to do the experiment with various combinations of w
% and c1
for i=1:sizeOfwVariation
     % Intertia Coefficient
    params.w = wVariation(i);
    for j=1:sizeOfc1Variation
        % Personnel Acceleration Coefficient
        params.c1 = c1Variation(j);
        out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
        Z(i,j)= out(i).minIterationForToleranceValue;
    end
end


% For ploting the result for performance analysis, An assumption has been made as for those experimenents
% which have not reached the Tolerance value after the exicution of each experiment can be considered as the one
% which needed more than MaxIt, so MaxIt value replaces as result
% where "Inf" - (infinite) is assigned.
for i=1:sizeOfwVariation
    for j=1:sizeOfc1Variation
        if Z(i,j) == Inf
            %assigning MaxIt as result for Inf value
            Z(i,j) = params.MaxIt;
        end
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(wVariation,c1Variation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Inertia Coefficient (w) and Personal Acceleration Coefficient (c1)');
xlabel('Inertia Coefficient (w)');
ylabel('Personal Acceleration Coefficient (c1)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
clc; clear;

%% Problem Definiton
problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.w = 1;               % Intertia Coefficient
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Information

params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
%% Personal Acceleration Coefficient (c1) and Social Acceleration Coefficient (c2)

%save different values of c1 and c2 inorder to do the experiment
c1Variation = [-2:0.5:2];
c2Variation = [-2:0.5:2];


% size of variation arrays
sizeOfc1Variation = numel(c1Variation);
sizeOfc2Variation = numel(c2Variation);


% use two for loops to do the experiment with various combinations of c1
% and c2
for i=1:sizeOfc1Variation
     % Personal Acceleration Coefficient (c1)
    params.c1 = c1Variation(i);
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
for i=1:sizeOfc1Variation
    for j=1:sizeOfc2Variation
        if Z(i,j) == Inf
            %assigning MaxIt as result for Inf value
            Z(i,j) = params.MaxIt;
        end
    end
end
% Describing the attributes for the graph
[X,Y] = meshgrid(c1Variation,c2Variation);
Z= transpose(Z)
surf(X,Y,Z)
title('Personal Acceleration Coefficient (c1) and Social Acceleration Coefficient (c2)');
xlabel('Personal Acceleration Coefficient (c1)');
ylabel('Social Acceleration Coefficient (c2)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
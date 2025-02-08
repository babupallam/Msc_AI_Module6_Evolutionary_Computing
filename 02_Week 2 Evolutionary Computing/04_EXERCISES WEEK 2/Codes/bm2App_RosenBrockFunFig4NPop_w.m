clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 2;              % Personal Acceleration Coefficient
params.c2 = 2;              % Social Acceleration Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Information

params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
%% Effect of Population Size (nPop) and the Inertia Coefficient (w)

%save different values of nPop and w inorder to do the experiment
nPopVariation = [100:100:1000];
wVariation = [1:2:10];


% size of variation arrays
sizeOfnPopVariation = numel(nPopVariation);
sizeOfwVariation = numel(wVariation);

% use two for loops to do the experiment with various combinations of nPop
% and w
for i=1:sizeOfnPopVariation
    % Population Size (Swarm Size)
    params.nPop = nPopVariation(i);
    for j=1:sizeOfwVariation
         % Intertia Coefficient
        params.w = wVariation(j);
        out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
        Z(i,j)= out(i).minIterationForToleranceValue;
    end
end


% For ploting the result for performance analysis, An assumption has been made as for those experimenents
% which have not reached the Tolerance value after the exicution of each experiment can be considered as the one
% which needed more than MaxIt, so MaxIt value replaces as result
% where "Inf" - (infinite) is assigned.
for i=1:sizeOfnPopVariation
    for j=1:sizeOfwVariation
        if Z(i,j) == Inf
            %assigning MaxIt as result for Inf value
            Z(i,j) = params.MaxIt;
        end
    end
end

% Describing the attributes for the graph
[X,Y] = meshgrid(nPopVariation,wVariation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Population Size (nPop) and the Inertia Coefficient (w)')
xlabel('Population Size');
ylabel('Inertia Coefficient');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
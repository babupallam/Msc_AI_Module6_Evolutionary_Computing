clc; clear;

%% Problem Definiton
problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.c1 = 2;              % Personal Acceleration Coefficient
params.c2 = 2;              % Social Acceleration Coefficient
params.ShowIterInfo = false; % Flag for Showing Iteration Information

params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
%% Effect of Inertia Coefficient (w) and Damping Ratio of Inertia Coefficient (wdamp)

%save different values of w and wdamp inorder to do the experiment
wVariation = [1:10];
wdampVariation = [-1:0.2:1];


% size of variation arrays
sizeOfwVariation = numel(wVariation);
sizeOfwDampVariation = numel(wdampVariation);

% use two for loops to do the experiment with various combinations of w
% and wdamp
for i=1:sizeOfwVariation
     % Intertia Coefficient (w)
    params.w = wVariation(i);
    for j=1:sizeOfwDampVariation
        % Damping Ratio of Inertia Coefficient (wdamp)
        params.wdamp = wdampVariation(j);
        out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
        Z(i,j)= out(i).minIterationForToleranceValue;
    end
end

% For ploting the result for performance analysis, An assumption has been made as for those experimenents
% which have not reached the Tolerance value after the exicution of each experiment can be considered as the one
% which needed more than MaxIt, so MaxIt value replaces as result
% where "Inf" - (infinite) is assigned.
for i=1:sizeOfwVariation
    for j=1:sizeOfwDampVariation
        if Z(i,j) == Inf
            %assigning MaxIt as result for Inf value
            Z(i,j) = params.MaxIt;
        end
    end
end


% Describing the attributes for the graph
[X,Y] = meshgrid(wVariation,wdampVariation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of Inertia Coefficient (w) and Damping Ratio of Inertia Coefficient (wdamp)');
xlabel('Inertia Coefficient (w)');
ylabel('Damping Ratio of Inertia Coefficient (wdamp)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(params.toleranceValue)]);
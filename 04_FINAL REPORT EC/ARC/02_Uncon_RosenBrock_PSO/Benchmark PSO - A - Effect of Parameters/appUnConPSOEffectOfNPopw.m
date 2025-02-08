
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables
params.toleranceValue = 10^(-3); %tolerance value which can be accepted as solution with the maximum error allowed
%% Parameters of PSO

params.MaxIt = 200;        % Maximum Number of Iterations
params.wdamp = 0.99;        % Damping Ratio of Inertia Coefficient
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1
%% Effect of Population Size (nPop) and the Inertia Coefficient (w)

%save different values of nPop and w inorder to do the experiment
nPopVariation = [100:200:1000];
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
        out = PSO(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
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
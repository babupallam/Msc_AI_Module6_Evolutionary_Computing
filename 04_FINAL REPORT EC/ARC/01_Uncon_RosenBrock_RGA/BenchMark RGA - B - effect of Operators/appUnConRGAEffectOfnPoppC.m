clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible

%% GA Parameters

params.MaxIt = 500; %Maximum number of iteations
params.beta = 1;% For random probability in selection Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability


%% Effect of Population Size (nPop) and Probability of Crossover (pC)


%save different values of nPop and pC inorder to do the experiment
nPopVariation = [100, 200, 300, 400, 500];
pCVariation = [0.3, 0.5 0.7 0.9 1];

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(nPopVariation)
    params.nPop = nPopVariation(i); %number of populations
    for j=1:numel(pCVariation)
        params.pC = pCVariation(i);  % Probability of crossover
        out = RunRGA(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end


% Describing the attributes for the graph
[X,Y] = meshgrid(nPopVariation,pCVariation);
Z= transpose(Z)
surf(X,Y,Z)
title('Effect of nPop and Pc ');
xlabel('Number of Population (nPop)');
ylabel('Crossover Probability (pC)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
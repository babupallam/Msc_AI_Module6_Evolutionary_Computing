clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 10^-2; % tolerance value at which the solution is acceptable with the maximum error possible

%% GA Parameters

params.MaxIt = 500; %Maximum number of iteations
params.nPop = 40; %number of populations
params.beta = 1;% For random probability in selection Operator
params.pC = 1;  % Probability of crossover
params.gamma = 15; % Spread factor for SBX Crossover Operator


%% Effect of Sigma and mu

%save different values of Sigma and mu inorder to do the experiment
sigmaVariation = [0, 10, 15, 50, 100]; 
muVariation = [0 0.3 0.5 0.8 1]; % in between 0 and 1

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(sigmaVariation)
    params.sigma = sigmaVariation(i);   % Distribution index for Polynomial Mutation Operator
    for j=1:numel(muVariation)
        params.mu = muVariation(i);% 1/nVar  % Mutation probability
        out = RunRGA(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end


% Describing the attributes for the graph
[X,Y] = meshgrid(sigmaVariation,muVariation);
Z= transpose(Z);
surf(X,Y,Z);
title('Effect of Sigma and mu ');
xlabel(' Distribution index for Polynomial Mutation Operator (sigma)');
ylabel('Mutation probability (mu)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
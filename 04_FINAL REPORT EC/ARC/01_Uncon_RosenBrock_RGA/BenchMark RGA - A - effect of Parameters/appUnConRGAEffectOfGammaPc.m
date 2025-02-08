clc; clear;


%% Problem Definition

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);
problem.nVar = 2; %as per given in the lecture slide
problem.VarMin = -5; %as per given in the lecture slide
problem.VarMax = 5; %as per given in the lecture slide
problem.toleranceValue = 10^-1; % tolerance value at which the solution is acceptable with the maximum error possible

%% GA Parameters

params.MaxIt = 500; %Maximum number of iteations
params.nPop = 40; %number of populations
params.beta = 1;% For random probability in selection Operator
params.mu = 0.5; % = 1/nVar  % Mutation probability
params.sigma = 20;   % Distribution index for Polynomial Mutation Operator


%% Effect of Gamma and pC

%save different values of Gamma and pC inorder to do the experiment
gammaVariation = [0, 10, 15, 50, 100]; 
pCVariation = [0 0.3 0.5 0.8 1]; %in between 0 and 1

% use two for loops to do the experiment with various combinations of
% parameters taken into consideration
for i=1:numel(gammaVariation)
        params.gamma = gammaVariation(i); % Spread factor for SBX Crossover Operator
    for j=1:numel(pCVariation)
        params.pC = pCVariation(i);  % Probability of crossover
        out = RunRGA(problem, params);
        Z(i,j)= out.minIterationToReachToleranceValue;
    end
end


% Describing the attributes for the graph
[X,Y] = meshgrid(gammaVariation,pCVariation);
Z= transpose(Z);
surf(X,Y,Z);
title('Effect of Gamma and pC ');
xlabel('Spread factor for SBX Crossover Operator (Gamma)');
ylabel('Probability of crossover (pC)');
zlabel(["Minimum Iterations for Tolerance Value: " num2str(problem.toleranceValue)]);
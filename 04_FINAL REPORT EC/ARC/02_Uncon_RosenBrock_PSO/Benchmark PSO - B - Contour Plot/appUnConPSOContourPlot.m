%% PSO - Unconstraint RosenBrock Function 

clc; clear;
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables

%% Parameters of PSO

% Constriction Coefficients
kappa = 1;
phi1 = 2.05;
phi2 = 2.05;
phi = phi1 + phi2;
chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

params.MaxIt = 500;        % Maximum Number of Iterations
params.nPop = 40;           % Population Size (Swarm Size)
%adding dynamicity to w (Inertia Coefficient) 
params.w = chi;             % Intertia Coefficient
%adding dynamicity to wdamp (Damping Ratio of Inertia Coefficient)
params.wmax = chi;          % Maximum value of Intertia Coefficient
params.wmin = 0.1;            % Minimum value of Intertia Coefficient
params.c1 = chi*phi1;       % Personal Acceleration Coefficient
params.c2 = chi*phi2;       % Social Acceleration Coefficient

params.toleranceValue = 10^(-2); %tolerance value which can be accepted as solution with the maximum error allowed

%Generation numbers needed to be plot as a graph
params.genNumber = [1,5,10];

%% Call PSO functions
out = PSO_ForContour(problem, params);

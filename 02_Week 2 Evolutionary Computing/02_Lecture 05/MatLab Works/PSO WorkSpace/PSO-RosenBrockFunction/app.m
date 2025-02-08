clc; clear;

%% Problem Definiton

problem.CostFunction = @(x) RosenBrockFunction(x);  % Cost Function
problem.nVar = 4;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 200;        % Maximum Number of Iterations
params.nPop = 40;           % Population Size (Swarm Size)
params.wmax = 0.9;               % Intertia Coefficient max
params.wmin = 0.1;        % Intertia Coefficient min
params.c1 = 1.5;              % Personal Acceleration Coefficient
params.c2 = 1.5;              % Social Acceleration Coefficient
params.ShowIterInfo = true; % Flag for Showing Iteration Informatin

%% Calling PSO

out = PSO(problem, params);

BestSol = out.BestSol;
BestCosts = out.BestCosts;

%% Results

% figure
% x = linspace(problem.VarMin,problem.VarMax,200);   % 1xm
% y = linspace(problem.VarMin,problem.VarMax,200);   % 1xn
% [X, Y] = meshgrid(x,y);      % mxn
Z = BestCosts; % mxn
% contourf(X,Y,Z);
% contour(randi(100,200,200));
% contour(X,Y,rand(200,200));
% hold on
% scatter([1:10],BestCosts(1:10,:),"filled","k");

%==============test4
% figure
% x = linspace(problem.VarMin,problem.VarMax,10);   % 1xm
% y = linspace(problem.VarMin,problem.VarMax,10);   % 1xn
% [X, Y] = meshgrid(x,y);      % mxn
% Z = reshape(BestCosts(1:100,1),10,10); % mxn
% contour(x,y,Z);
% hold on
% scatter([1:10],BestCosts(1:10,:),"k");

%=============test3

%=============test2
%plotting bestcost points
% scatter([1:10],BestCosts(1:10,:),"k");
%=============test1
% semilogy(BestCosts, 'LineWidth', 2);
% xlabel('Generation');
% ylabel('Best Cost');
% grid on;



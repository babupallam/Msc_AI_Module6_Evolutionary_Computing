clc; clear;


%% Problem Definition

problem.CostFunction = @(x) Sphere(x);
problem.nVar = 5;
problem.VarMin = -5;
problem.VarMax = 5;


%% GA Parameters

params.MaxIt = 100;
params.nPop = 100;

params.beta = 1;
params.pC = 1;
params.gamma = 0.1;%spread factor for crossover operator
params.mu = 0.02;%mutation propbabip;otu used for selection opeator
params.sigma = 0.1;% range which we want to haev the mutation


%% Run GA

out = RunGA2(problem, params);


%% Results

semilogy(out.bestcost, 'LineWidth', 2);
xlabel('Iterations');
ylabel('Best Cost');
grid on;




clear clc;
%% Problem Definition

problem.CostFunction = @(x)MinOne(x);  %functionReferencing

problem.nVar =20;
    
%% GA Parameters
params.MaxIt = 100;
params.nPop = 50; %number of populations

params.pC = 1; %probability of crossover
params.beta =1;
params.mu = 0.02;
%% Run GA

out = RunGA(problem, params);
%% Result
semilogy(out.bestcost);
xlabel("Iterations");
ylabel("Best Cost");
grid on;




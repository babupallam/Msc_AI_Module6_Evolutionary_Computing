clear; clc;
clear;

%% Problem Definition
% Note: 
%       - this cost function is nothing but the objective function; for
%           demo we use MinOne(x) that calculates the sum of bits in a binary string
        % - A problem is defined by:
        %     1. CostFunction -> fitness function
        %     2. nVar -> number of variables


problem.CostFunction = @(x) MinOne(x);
problem.nVar = 100;
    
%% GA Parameters
% Note:
    % - Parameters required for:
    %     1. MaxIt -> maximum iterations
    %     2. nPop -> number of populations/solutions space size
    %     3. beta -> 
    %     4. pC -> probability of crossovers
    %     5. mu -> probability of mutation
    % 

%%ORIGINAL VALUES--------
% params.MaxIt = 100;
% params.nPop = 100;
% 
% params.beta = 1;
% params.pC = 1;
% params.mu = 0.02;

params.MaxIt = 100;
params.nPop = 100;

params.beta = 1;
params.pC = 1;
params.mu = 0.02;

%% Run GA
out = RunGA(problem, params);   

%% Results
semilogy(out.bestcost, 'LineWidth', 2);
% plot(out.bestcost)
xlabel('Iterations');
ylabel('Best Cost');
grid on;

%% PSO - Unconstraint RosenBrock Function

clc; clear;
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables
problem.VarMin =  -5;  % Lower Bound of Decision Variables
problem.VarMax =  5;   % Upper Bound of Decision Variables
params.toleranceValue = 10^-2; % which is the optimum solution for this problme when x=1 and y=1

%% Effect of Constraint Variable : Kappa

%different number of 'kappa' values
% kappaVariations = [1:0.05:1.5]; %values in between 1 and 1.5 -- B
kappaVariations = [0.50, 0.51, 0.55, 0.7, 0.8,0.9,1]; %values in between
% 0 and 1 C


%Variable to store the number of Iterations take to reach the minimum
%value (In Min One Problem, it is zero)
numberOfIterations = numel(kappaVariations);
%run the experiment for numberOfIterations times
for i=1:numberOfIterations
    % Parameters of PSO
    % Constriction Coefficients
    kappa = kappaVariations(i);
    phi1 = 2.05;
    phi2 = 2.05;
    phi = phi1 + phi2;
    chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

    params.MaxIt = 500;        % Maximum Number of Iterations
    params.w = chi;             % Intertia Coefficient
    %adding dynamicity to wdamp (Damping Ratio of Inertia Coefficient)
    params.wmax = chi;          % Maximum value of Intertia Coefficient
    params.wmin = 0.1;            % Minimum value of Intertia Coefficient
    params.c1 = chi*phi1;       % Personal Acceleration Coefficient
    params.c2 = chi*phi2;       % Social Acceleration Coefficient
    params.nPop = 40;           % Population Size (Swarm Size)

    out = PSO(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.BestCosts,"LineWidth",2,'DisplayName',num2str(kappaVariations(i)));
    hold off
end
% Describing the attributes for the graph
title("Effect of Constraint Variable : Kappa")
xlabel('Iterations');
ylabel('Best Cost');
% make the y limit to a narrow region to get a closer look
ylim([0 0.1]);
xlim([0,200])
%draw a line parallel to x axis to find on which iteration the output
%reaches to the tolerance value
yline(params.toleranceValue,'-',{'Acceptable','Limit: ' num2str(params.toleranceValue)});
grid on;
legend(num2str(kappaVariations.'), 'location', 'northeast');
clc; clear;

%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;      % Number of Unknown (Decision) Variables
problem.VarMin = -10;   % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables



params.toleranceValue = 10^(-5); %tolerance value which can be accepted as solution with the maximum error allowed
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
    params.wdamp = 1;           % Damping Ratio of Inertia Coefficient
    params.c1 = chi*phi1;       % Personal Acceleration Coefficient
    params.c2 = chi*phi2;       % Social Acceleration Coefficient
    params.ShowIterInfo = true; % Flag for Showing Iteration Information
    params.nPop = 50;           % Population Size (Swarm Size)

    out(i) = pso_RosenBrockFunWithToleranceValue(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out(i).BestCosts,"LineWidth",2,'DisplayName',num2str(kappaVariations(i)));
    hold off
end
% Describing the attributes for the graph
title("Effect of Constraint Variable : Kappa")
xlabel('Iterations');
ylabel('Best Cost');
% make the y limit to a narrow region to get a closer look
ylim([0 10^-4]);
%draw a line parallel to x axis to find on which iteration the output
%reaches to the tolerance value
yline(params.toleranceValue,'-',{'Acceptable','Limit: ' num2str(params.toleranceValue)});
grid on;
legend(num2str(kappaVariations.'), 'location', 'northeast');
%% PSO - Unconstraint RosenBrock Function 

clc; clear;
%% Problem Definiton

problem.CostFunction = @(x,y) RosenBrockFunction(x,y);  % Cost Function
problem.nVar = 2;       % Number of Unknown (Decision) Variables

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


%% Effect of Different Bounds of Variables
%different number of 'Variable Bound' values
diffVariations = [1,3,5,7,10];

%Perform test with different variations mentioned above
for i=1:numel(diffVariations)
    problem.VarMin = -diffVariations(i);
    problem.VarMax = diffVariations(i);
    out= PSO(problem, params);
    % plot the result into the existing graph
    hold on
    semilogy(out.BestCosts,"LineWidth",2);
    hold off
end
% Describing the attributes for the graph
title("Effect of Different Bounds of Variables")
xlabel('Iterations');
ylabel('Best Cost');
%for the purpous of seeing the change in each experiment, xlim is used to
%get a more close view
xlim([0,200]);
ylim([0, 0.1])
%draw a line parallel to x axis to find on which iteration the output
%reaches to tolerance value
yline(params.toleranceValue,'-',{'Acceptable','Limit:', num2str(params.toleranceValue) });
legend(num2str(diffVariations'), 'location', 'northeast');
grid on;




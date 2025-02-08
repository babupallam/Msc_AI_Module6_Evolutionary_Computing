%% DE /rand/1/bin
clc; clear;


%% Problem Definition

CostFunction = @(x) Sphere(x);    % Cost Function
nVar = 20;              % Number of Decision Variables
VarSize = [1 nVar];     % Decision Variables Matrix Size
VarMin = -5;            % Lower Bound of Decision Variables
VarMax = 5;             % Upper Bound of Decision Variables


%% DE Parameters

MaxIt = 1000;       % Maximum Number of Iterations
nPop = 50;          % Population Size
beta_min = 0.2;     % Lower Bound of Scaling Factor (0)
beta_max = 0.8;     % Upper Bound of Scaling Factor (2)
pCR = 0.2;          % Crossover Probability


%% Initialization

empty_individual.Position = [];
empty_individual.Cost = [];

BestSol.Cost = inf;

pop = repmat(empty_individual, nPop, 1);
%sample solution space
for i = 1:nPop
    %sample creation
    pop(i).Position = unifrnd(VarMin, VarMax, VarSize);
    %sample solution creation
    pop(i).Cost = CostFunction(pop(i).Position);
    
    if pop(i).Cost<BestSol.Cost
        BestSol = pop(i);
    end
    
end

BestCost = zeros(MaxIt, 1);


%% DE Main Loop

for it = 1:MaxIt
    
    for i = 1:nPop
        %ith indivitual
        x = pop(i).Position;
        %create a random arrangement (reorder the population numbers)
        A = randperm(nPop);
        %Note: we can do this with rand, but we want all numbers different
        
        %remove the i index from this since we dont want that to
        %be target vector
        A(A == i) = [];

        a = A(1);   % Target Vector index
        b = A(2);   % Random Vector 1 index
        c = A(3);   % Random Vector 2 index
        
        % Mutant Vector (Mutation) 1x20 here in this problem
        beta = unifrnd(beta_min, beta_max, VarSize);
        
        %y is the mutant vector
        y = pop(a).Position + beta.*(pop(b).Position - pop(c).Position);
        y = max(y, VarMin);
		y = min(y, VarMax);
		
        % Trial Vector (Crossover between Target Vector x and Mutant Vector y)
        z = zeros(size(x));
        j0 = randi([1 numel(x)]);
        for j = 1:numel(x)
            if j == j0 || rand <= pCR
                z(j) = y(j);%from the mutant vector
            else
                z(j) = x(j);%from the target vector
            end
        end
        
        NewSol.Position = z;
        NewSol.Cost = CostFunction(NewSol.Position);
        
        % Selection
        if NewSol.Cost<pop(i).Cost
            pop(i) = NewSol;
            
            if pop(i).Cost<BestSol.Cost
               BestSol = pop(i);
            end
        end
        
    end
    
    % Update Best Cost
    BestCost(it) = BestSol.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
end


%% Show Results

semilogy(BestCost, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;

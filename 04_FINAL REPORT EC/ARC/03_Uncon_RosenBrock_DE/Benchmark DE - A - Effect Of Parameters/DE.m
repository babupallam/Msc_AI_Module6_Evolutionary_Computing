%% DE /rand/1/bin
function out = DE(problem, params)
CostFunction = problem.CostFunction; % Cost Function
VarSize = [1 problem.nVar];     % Decision Variables Matrix Size
VarMin = problem.VarMin;            % Lower Bound of Decision Variables
VarMax = problem.VarMax;             % Upper Bound of Decision Variables
toleranceValue = problem.toleranceValue; % tolerance value at which the solution is acceptable with the maximum error possible

%% DE Parameters

MaxIt = params.MaxIt;       % Maximum Number of Iterations
nPop = params.nPop;          % Population Size
beta_min = params.beta_min;     % Lower Bound of Scaling Factor (0)
beta_max = params.beta_max;     % Upper Bound of Scaling Factor (2)
pCR = params.pCR;          % Crossover Probability


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
    pop(i).Cost = CostFunction(pop(i).Position(1),pop(i).Position(2));

    if pop(i).Cost<BestSol.Cost
        BestSol = pop(i);
    end

end
%inilialize the BestCost of all generations into zeros 
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

        % Mutant Vector 
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
        NewSol.Cost = CostFunction(NewSol.Position(1),NewSol.Position(2));

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
    % Comparing the best cost with the tolerance value 
    % This code has been added for improving efficiency of the code
    if BestCost(it) <= toleranceValue
        disp(['Tolerance value has been reached at generation: ' num2str(it)]);
        %return from the function
        out.BestCost = BestCost;
        out.BestSol =BestSol;
        out.minIterationToReachToleranceValue = it;
        return;
    end

end

out.BestCost = BestCost;
out.BestSol =BestSol;
%assing number of iteration to reach minimum tolerance value as MaxIt since the generations of MaxIt has
%not reached to the required result, this is done as part of plotting the
%graph without any error
out.minIterationToReachToleranceValue =MaxIt;
end

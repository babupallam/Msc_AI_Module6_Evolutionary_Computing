%% DE /best/2/bin
function out = DE_V2_ForContour(problem, params)
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
genNumber =params.genNumber;%generation index of which graph has to be ploted

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

%plot Control Variables
plotX = zeros(MaxIt,nPop);
plotY = zeros(MaxIt,nPop);
%% DE Main Loop
for it = 1:MaxIt
    %assign the best solution as best solution in the current generation
    %which is used as base vector for mutate vector formation
    bestSolutionInPreviousGen = BestSol;
    %process
    for i = 1:nPop
        %ith indivitual
        x = pop(i).Position;
        %create a random arrangement (reorder the population numbers)
        A = randperm(nPop);
        %Note: we can do this with rand, but we want all numbers different

        %remove the i index from this since we dont want that to
        %be target vector
        A(A == i) = [];

        a = A(1);   % Random Vector 1 index
        b = A(2);   % Random Vector 2 index 
        c = A(3);  % Random Vector 3 index
        d = A(4);   %random Vector 4 index
        % Mutant Vector (Mutation)
        beta = unifrnd(beta_min, beta_max, VarSize);

        %y is the mutant vector - best is used as base vector  
        y = bestSolutionInPreviousGen.Position + beta.*(pop(a).Position + pop(b).Position - pop(c).Position - pop(d).Position);
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
        %save the best soliution found in the iteration it of particle i
        %into plotX and plotY inorder to draw the graph
         plotX(it,i) = pop(i).Position(1);
         plotY(it,i) = pop(i).Position(2);
    end

    % Update Best Cost
    BestCost(it) = BestSol.Cost;

    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);


    %plot the graph with the newly updated solutions and best received in the above
    %generation process( the drawing code has been seperated from this into
    %another file named Draw.m)
    %check with the toleranc value to make sure that the graph has been
    %ploted for the optimum solution (0) here tolerance value =0 has been
    %set
     if BestCost(it) <= toleranceValue
        disp(['Tolerance value has been reached at generation: ' num2str(it)]);
        genNumber =[it];
        DrawTheContourPlot
        %Once optimum has been reached no need to run the code again so
        %we terminate the exicution at here
        out.BestCost = BestCost;
        out.BestSol =BestSol;
        return;
     else
         DrawTheContourPlot
     end
    
end

out.BestCost = BestCost;
out.BestSol =BestSol;
end

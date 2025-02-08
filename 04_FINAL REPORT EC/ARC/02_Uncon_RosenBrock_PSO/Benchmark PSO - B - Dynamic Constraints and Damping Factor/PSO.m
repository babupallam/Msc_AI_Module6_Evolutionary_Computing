function out = PSO(problem, params)


%% Problem Definiton

CostFunction = problem.CostFunction;  % Cost Function
nVar = problem.nVar;        % Number of Unknown (Decision) Variables
VarSize = [1 nVar];         % Matrix Size of Decision Variables
VarMin = problem.VarMin;	% Lower Bound of Decision Variables
VarMax = problem.VarMax;    % Upper Bound of Decision Variables

%% Parameters of PSO

MaxIt = params.MaxIt;   % Maximum Number of Iterations
nPop = params.nPop;     % Population Size (Swarm Size)
wmax= params.wmax;
wmin = params.wmin;
w = params.w;           % Inertia Coefficient
c1 = params.c1;         % Personal Acceleration Coefficient
c2 = params.c2;         % Social Acceleration Coefficient

% Define the velocity bounds
MaxVelocity = 0.2*(VarMax-VarMin);
MinVelocity = -MaxVelocity;

%Defining the paramters for Tolerance Value for Acceptace of the Result
%(Best Cost for the objective Function)
toleranceValue = params.toleranceValue;
minIterationForToleranceValue = Inf;
ToleranceFlag = false;% for finding the minimum iteration to reach the tolerance value

%% Initialization

% The Particle Template
empty_particle.Position = [];
empty_particle.Velocity = [];
empty_particle.Cost = [];
empty_particle.Best.Position = [];
empty_particle.Best.Cost = [];

% Create Population Array
particle = repmat(empty_particle, nPop, 1);

% Initialize Global Best
GlobalBest.Cost = inf;

% Initialize Population Members
for i=1:nPop

    % Generate Random Solution
    particle(i).Position = unifrnd(VarMin, VarMax, VarSize);

    % Initialize Velocity
    particle(i).Velocity = zeros(VarSize);

    % Evaluation
    particle(i).Cost = CostFunction(particle(i).Position(1),particle(i).Position(2));

    % Update the Personal Best
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;

    % Update Global Best
    if particle(i).Best.Cost < GlobalBest.Cost
        GlobalBest = particle(i).Best;
    end

end

% Array to Hold Best Cost Value on Each Iteration
BestCosts = zeros(MaxIt, 1);

%% Main Loop of PSO

for it=1:MaxIt
    %assigning dynamic wdamp
    wdamp = (it/MaxIt)*(wmax-wmin);
    w = w * wdamp;
    for i=1:nPop
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            + c1*rand(VarSize).*(particle(i).Best.Position - particle(i).Position) ...
            + c2*rand(VarSize).*(GlobalBest.Position - particle(i).Position);

        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity, MinVelocity);
        particle(i).Velocity = min(particle(i).Velocity, MaxVelocity);

        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;

        % Apply Lower and Upper Bound Limits
        particle(i).Position = max(particle(i).Position, VarMin);
        particle(i).Position = min(particle(i).Position, VarMax);

        % Evaluation
        particle(i).Cost = CostFunction(particle(i).Position(1),particle(i).Position(2));

        % Update Personal Best
        if particle(i).Cost < particle(i).Best.Cost

            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;

            % Update Global Best
            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
            end
        end
    end

    % Display Itertion Information
    % disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(GlobalBest.Cost)]);

    % Store the Best Cost Value
    BestCosts(it) = GlobalBest.Cost;
    
    %Compare the bestcost found in this iteration with the tolerance value
    if BestCosts(it) < toleranceValue
        disp(["Tolerance value " num2str(toleranceValue) " reached in " num2str(it) "th iteration"]);
        out.pop = particle;
        out.BestSol = GlobalBest;
        out.BestCosts = BestCosts;
        out.minIterationToReachToleranceValue = it;
        return;
    end
end

out.pop = particle;
out.BestSol = GlobalBest;
out.BestCosts = BestCosts;
%the below line set is by maing an assumption that MaxIt is atleast needed
%to reach the tolerance value with the given specification. its for avoid
%the error of indefinit looing while finding the result
out.minIterationToReachToleranceValue = MaxIt; 
end
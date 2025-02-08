%% PSO - Constraint Himmelblu Funciton with Static Penalty

function out = PSO(problem, params)

CostFunction = problem.CostFunction; % Cost Function
Constraints = problem.Constraints; % Constraint function
FitnessValue = problem.FitnessValue; %Fitness function

nVar = problem.nVar;        % Number of Unknown (Decision) Variables
VarSize = [1 nVar];         % Matrix Size of Decision Variables
VarMin = problem.VarMin;	% Lower Bound of Decision Variables
VarMax = problem.VarMax;    % Upper Bound of Decision Variables
toleranceValue = problem.toleranceValue; % tolerance value at which the solution is acceptable with the maximum error possible

%% Parameters of PSO

MaxIt = params.MaxIt;   % Maximum Number of Iterations
nPop = params.nPop;     % Population Size (Swarm Size)
w = params.w;           % Inertia Coefficient
wdamp = params.wdamp;   % Damping Ratio of Inertia Coefficient
c1 = params.c1;         % Personal Acceleration Coefficient
c2 = params.c2;         % Social Acceleration Coefficient
genNumber =params.genNumber;%generation index of which graph has to be ploted
R = params.R;
MaxVelocity = 0.2*(VarMax-VarMin);
MinVelocity = -MaxVelocity;

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
    particle(i).Velocity = zeros(VarSize);%zeros([1,5])== [0 0 0 0 0]

    % Evaluation
    particle(i).Cost = FitnessValue(particle(i).Position(1),particle(i).Position(2),R);

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

%% PSO Main Loop

for it = 1:MaxIt
    % scatter(1,1.^2,35,'ok','filled');  %testing -- working fine
    for i = 1:nPop
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            + c1*rand(VarSize).*(particle(i).Best.Position - particle(i).Position) ...
            + c2*rand(VarSize).*(GlobalBest.Position - particle(i).Position);

        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity,MinVelocity);%if Velocity is lower than the min velocity
        particle(i).Velocity = min(particle(i).Velocity,MaxVelocity);%if velocity is greater than the max velocity

        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;

        % Apply Lower and Upper Bound Limits
        particle(i).Position = max(particle(i).Position, VarMin);
        particle(i).Position = min(particle(i).Position, VarMax);

        % Evaluation
        particle(i).Cost = FitnessValue(particle(i).Position(1),particle(i).Position(2),R);

        % Update Personal Best
        if particle(i).Cost < particle(i).Best.Cost

            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;

            % Update Global Best
            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
            end
        end

    end %end of nPop Iteration
    % % Store the Best Cost Value
    BestCosts(it) = GlobalBest.Cost;
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCosts(it))]);
    % Damping Inertia Coefficient
    w = w * wdamp;

end

out.BestSol =GlobalBest;
out.BestCosts = BestCosts;
% Display Best Solution in Command Window
disp(GlobalBest)
x = GlobalBest.Position;
disp(['Constraints: ', num2str(Constraints(x(1), x(2), R))] );
end

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

wmax = params.wmax;           % Intertia Coefficient Max
wmin = params.wmin;   % Inertia Coefficient Min
c1 = params.c1;         % Personal Acceleration Coefficient
c2 = params.c2;         % Social Acceleration Coefficient

% The Flag for Showing Iteration Information
ShowIterInfo = params.ShowIterInfo;

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
    particle(i).Cost = CostFunction(particle(i).Position);

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

%plot Control Variables
plotControl =0;
plotX = zeros(MaxIt,nPop);
plotY = zeros(MaxIt,nPop);
globalBest = zeros(MaxIt,2);
figure;
tiledlayout('flow');
%% Main Loop of PSO        
for it=1:MaxIt
        % scatter(1,1.^2,35,'ok','filled');  %testing -- working fine
        
    for i=1:nPop
        %Calculate w
        w = wmax - (i/200)*(wmax-wmin);
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
        particle(i).Cost = CostFunction(particle(i).Position);

        % Update Personal Best
        if particle(i).Cost < particle(i).Best.Cost

            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;

            % Update Global Best
            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
                
            end

        end
         plotX(it,i) = particle(i).Best.Position(1);
         plotY(it,i) = particle(i).Best.Position(2);
         globalBest(it,1) = GlobalBest.Position(1); 
         globalBest(it,2) = GlobalBest.Position(2); 

    end %end of nPop Iteration
    % % Store the Best Cost Value
    BestCosts(it) = GlobalBest.Cost;
    % Display Iteration Information
    
    if ShowIterInfo
        disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCosts(it))]);
    end

end %end of it (MaxIt)

%plot the graph of 5th iteration

loop=10;
while(loop<=MaxIt)
    nexttile
    [X,Y] = meshgrid(linspace(VarMin,VarMax,nPop),linspace(VarMin,VarMax,nPop));%101x101
    % Z= (1-X).^2 + 100*(Y-X.^2).^2; %101x101
    Z= meshgrid(BestCosts);
    contour(X,Y,Z,"ShowText","on");
    hold on;
    scatter(plotX(loop,:),plotY(loop,:),"filled","g");
    title(['Rosenbrock Function' num2str(loop) "th Generation"]);
    hold on
    scatter(globalBest(loop,1),globalBest(loop,2), "filled","r");%xb for vectors
    hold off
    % loop = loop+200;
    loop = loop+20;

end

out.pop = particle;
out.BestSol = GlobalBest;
out.BestCosts = BestCosts;

end
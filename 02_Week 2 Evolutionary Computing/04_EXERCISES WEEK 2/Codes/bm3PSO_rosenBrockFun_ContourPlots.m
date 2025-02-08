function out = bm1PSO_rosenBrockFun_ContourPlots(problem, params)


%% Problem Definiton

CostFunction = problem.CostFunction;  % Cost Function

nVar = problem.nVar;        % Number of Unknown (Decision) Variables

VarSize = [1 nVar];         % Matrix Size of Decision Variables

VarMin = problem.VarMin;	% Lower Bound of Decision Variables
VarMax = problem.VarMax;    % Upper Bound of Decision Variables


%% Parameters of PSO

MaxIt = params.MaxIt;   % Maximum Number of Iterations
nPop = params.nPop;     % Population Size (Swarm Size)

w = params.w;           % Inertia Coefficient
wdamp = params.wdamp;   % Damping Ratio of Inertia Coefficient

c1 = params.c1;         % Personal Acceleration Coefficient
c2 = params.c2;         % Social Acceleration Coefficient

genNumber =params.genNumber;%generation index of which graph has to be ploted

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

%plot Control Variables
plotX = zeros(MaxIt,nPop);
plotY = zeros(MaxIt,nPop);
%% Main Loop of PSO        
for it=1:MaxIt
        % scatter(1,1.^2,35,'ok','filled');  %testing -- working fine
    for i=1:nPop
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
        %save the best soliution found in the iteration it of particle i
        %into plotX and plotY inorder to draw the graph
         plotX(it,i) = particle(i).Best.Position(1);
         plotY(it,i) = particle(i).Best.Position(2);
       
    end %end of nPop Iteration
    % % Store the Best Cost Value
    BestCosts(it) = GlobalBest.Cost;
    if ShowIterInfo
        disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCosts(it))]);
    end
    %plot the graph with the bestcost and globalbest received in the above
    %generation process
    if any(it == genNumber(:))
        %this line of code below is to  make sure that all graphs come into
        %seperate
        figure(it);
        % plot the contour graph
        %create mesh
        [X,Y] = meshgrid(VarMin:0.1:VarMax, VarMin:0.1:VarMax);
        %create the possible solution space with X and Y 
        Z= 100*(Y-X.^2).^2+(1-X).^2;
        %draw contour
        contour(X,Y,Z);
        
        %mark the points in the contour graph for the iteration 'it'
        for loop = 1:nPop
            hold on;
            scatter(plotX(it,loop),plotY(it,loop),"k");
            title(['Rosenbrock Function' num2str(it) "th Generation"]);
            hold on
            scatter(GlobalBest.Position(1), GlobalBest.Position(2),"filled","o","r");
            hold off
        end
    end

    % Damping Inertia Coefficient
    w = w * wdamp;
    
end %end of it (MaxIt)
%%
out.pop = particle;
out.BestSol = GlobalBest;
out.BestCosts = BestCosts;

end
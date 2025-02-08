function [bParticles, gParticle]= PSO_Algorithm_Demo(Par)
%  =============================================================
%    Standard Particle Swarm Optimization Algorithm Version Demo
%  =============================================================
%    Validating PSO Alogirthm using eggcrate function
%
%    Programmed by: Haydar Khayou @Damascus University, Syria
%    June 20, 2020
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%
% [bParticles, gParticle]= Bat_Algorithm(Par)
% par= [NB, W, minW, C1, C2, Max_iter, initial_Velocity, plot_Type]
%
% where:
%   - NB= swarm sie;
%   - W= initial inertia;
%   - minW= last inertia;
%   - C1= Cognitive coefficient;
%   - C2= Social coefficient;
%   - initial_Velocity= initial Velocity of particles
%   - plot_Type= Surf or contour.

%% Start
if nargin<1
    help Bat_Algorithm
    Par= [30, 0.9, 0.4, 2.03, 2.03, 240, 0, 1];
end

%% Algorithm Coefficients
Max_iter= Par(6);   % Maximum number of iterations

NB= Par(1);      % number of particles(swarm size). It's best to be >= number of variables.

W= Par(2);       % initial Inertia

minW= Par(3);    % last inertia

C1= Par(4);      % Congnitive coefficient

C2= Par(5);      % Social Coefficient

init_Vel= Par(7);            % initial particles Velocity

Plot_type= Par(8);     % 1= surf plot,   0= contour plot

alpha= ((W - minW)/(Max_iter));      % a percentage to determine how much the W decreases in each iteration
% the decrease in W is important to end up with a single solution

var_W= W;  % for plotting
%% eggcrate function
lb= -5;   % lower bound of your variables
ub= 5;   % upper bound of your variables

[X, Y]= meshgrid(lb:0.1:ub, lb:0.1:ub);
Z= X.^2 + Y.^2 + (25 * (sin(X).^2 + sin(Y).^2));

xlabel('X');
ylabel('Y');


%%  Objective Function
Fitness= @(S) S(1).^2 + S(2).^2 + (25 * (sin(S(1)).^2 + sin(S(2)).^2));

%% Swarm initialization
tic % start timing

Temp.pos= [];
Temp.cost= [];
Temp.velocity= [];

% Initialize a number of Particles
Particles= repmat(Temp, NB, 1);


for i=1:NB
    % Choose pos withn lb~ub.
    Particles(i).pos= lb + (ub-lb)*rand(1, 2);
    
    % Evaluate Position
    Particles(i).cost= Fitness(Particles(i).pos);
    
    % Determine initial velocity.
    Particles(i).velocity= init_Vel.*ones(1, 2);
end

% Save personal best
bParticles= Particles;     % This is the first iteration so: Personal best= the same Particles

% Determine the global best among the bparticles
[~, index]= min([bParticles.cost]);

% Save the Global optimum
gParticle= Particles(index);

%% main loop

% parameters for plotting
AVR= mean([Particles.cost]);  % Average BAT cost for plotting
best= gParticle.cost;
iter= 1;                % number of iteration
W_vector= W;

% The stop criterium is as the following
while iter<Max_iter
    
    xx= [];
    yy= [];
    zz= [];
    for i=1:NB
        
        % Choose new Velocity
        Particles(i).velocity= W.*Particles(i).velocity...
            +C1.*rand(1, 2).*(bParticles(i).pos - Particles(i).pos)...
            +C2.*rand(1, 2).*(gParticle(iter).pos - Particles(i).pos);
        
        % Update position
        Particles(i).pos= Particles(i).pos + Particles(i).velocity;
        
        %% Handling Boundaries:
        CrossUp= Particles(i).pos >= ub;             % Get the variables which crossed the upper boundary after updating position
        Particles(i).pos(CrossUp)= ub;      % and set them= upper bounds.
        
        CrossDown= Particles(i).pos <= lb;           % Get the variables which crossed the lower boundary after updating position
        Particles(i).pos(CrossDown)= lb;  % and set them= lower bounds.
        
        %% Evaluate position
        Particles(i).cost= Fitness(Particles(i).pos);
        
        
        if Particles(i).cost<bParticles(i).cost
            bParticles(i)=Particles(i);
        end
        
        xx= [xx Particles(i).pos(1)];
        yy= [yy Particles(i).pos(2)];
        zz= [zz Particles(i).cost];
    end  % Here is the end of updating BATS
    
    [~, index]= min([bParticles.cost]);
    gParticle(iter)= bParticles(index);
    
    if W>minW
        W= W - alpha;
    end
    iter= iter+1;
    
    %% Update Global Best
    [~, index]= min([bParticles.cost]);
    gParticle(iter)= bParticles(index);
    best(iter)= gParticle(iter).cost;
    
    %% Save things to plot
    AVR(iter)= mean([Particles.cost]);
    W_vector= [W_vector W];
    disp([ 't= ' num2str(iter), ',  W= ' num2str(W), ',   BEST= ' num2str(best(iter))]);
    figure(1);
    if Plot_type
        subplot(2, 2, [1 3]); dd= surf(X, Y, Z); dd.EdgeColor= 'none';
        colormap(hsv(10000));
        title({['Eggcrate function',], ...
            ['Optimum Z= ' num2str(gParticle(end).cost)]}, 'FontSize', 10);
        xlabel('X');
        ylabel('Y');
        cc= gca;
        cc.CameraPosition= [-15.4048  -22.5827  871.7489];
        hold on
        s1=scatter3(xx, yy, zz, 30, 'fill','k');
        s2=scatter3(gParticle(end).pos(1), gParticle(end).pos(2), gParticle(end).cost, 30, 'fill','r');
        colorbar;
        hold off
    elseif ~Plot_type
        subplot(2, 2, [1 3]); dd= contour(X, Y, Z);     
        title({['Eggcrate function',], ...
            ['Optimum Z= ' num2str(gParticle(end).cost)]}, 'FontSize', 10);
        xlabel('X');
        ylabel('Y');
        hold on
        s1=scatter(xx, yy, 50, 'fill','k');
        s2=scatter(gParticle(end).pos(1), gParticle(end).pos(2), 50, 'fill','r');
        legend([s1 s2], 'Particles', 'Optimum')
        hold off
    end
    subplot(2, 2, [2 4]); plot(1:iter, W_vector, 'LineWidth', 2, 'MarkerSize', 4);
    axis([0 Max_iter minW var_W]);
    title(['Inertia (\omega)= ' num2str(W), ',  C1= ', num2str(C1), ',  C2= ', num2str(C2)], 'FontSize', 10);
    xlabel('Iteration'); ylabel('\omega')
    grid
    hold on
    scatter(iter, W_vector(end));
    hold off
    drawnow;
    
    % Break the loop if:
    if gParticle(iter).cost==0  % Change this tolerance condition to fit your case
        %         break;
    end
    
end
%% results
disp('======================================');
disp([' Time  '  num2str(toc)]);

figure;
subplot(1, 2, 1); plot(1:iter, best, 'b', 'Linewidth', 1);
% hold on
% Sca= scatter(1:iter, best,10 , 'filled', 'Marker' , '0', 'MarkerfaceColor' , 'r');
% hold off
title('Global Best')
xlabel('iteration');
ylabel('Z Value');
legend('Best solution');
grid on
subplot(1, 2, 2); plot(1:iter, AVR, 'r');
title('Average Z of Particles')
xlabel('iteration');
ylabel('Z Value');
legend('Avrg Z');
grid on;

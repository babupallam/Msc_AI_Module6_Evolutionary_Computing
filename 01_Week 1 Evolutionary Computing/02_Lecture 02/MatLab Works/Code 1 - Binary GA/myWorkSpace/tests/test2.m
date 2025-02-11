%Code in Uniform Crossover

p1 =[1 0 1 1 1]
p2=[1 0 0 1 0]
alpha = randi([0, 1], size(p1))
oneMinAplha= 1-alpha

alpha.*p1
oneMinAplha.*p2
o1 = alpha.*p1 + (1-alpha).*p2
o2 = alpha.*p2 + (1-alpha).*p1

%% 

% As per the example from the silde # 17 in 2b Week 1.2 

p1 =[1 0 1 0 1 1 1 0 1 0]
p2=[0 1 0 1 0 0 1 1 1 0]

% alpha = randi([0, 1], size(p1))
alpha = [1 0 1 0 0 0 1 1 1 0]

% condition: 
%   if alpha=1 then bit i of o1 is xi else yi
            
%   if alpha=1 then bit i of o2 is yi else xi

o1 = alpha.*p1 + (1-alpha).*p2
o2 = alpha.*p2 + (1-alpha).*p1

% Note: Same result as seen on the slide

%%  In mutation function

x = [1 0 1 0 1]
mu =0.2

flag = rand(size(x))<mu
y=x
y(flag)

y(flag) = 1 - x(flag)

% Ob: only one bit is changing at the end

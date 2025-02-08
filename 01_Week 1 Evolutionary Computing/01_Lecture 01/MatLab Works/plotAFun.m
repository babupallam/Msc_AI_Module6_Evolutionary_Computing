% Ref: https://uk.mathworks.com/help/matlab/ref/meshgrid.html

clc 
x = 1:3
y = 1:5
[X,Y] = meshgrid(x,y)
%% 
clc
x = -2:0.25:2
y = x
[X,Y] = meshgrid(x)
F = X.*exp(-X.^2-Y.^2);
surf(X,Y,F)

%% 

z = @(x,y) sin(x).*cos(y) .* ((x>-3) & (y<3));
[X,Y] = meshgrid(-5:0.5:5);
figure(1)
surf(X, Y, z(X,Y))
xlabel('\bfX')
ylabel('\bfY')
grid on
%% PLOT 2
% 
% 
%% 

z = @(x,y) sin(x).*cos(y) .* ((x>-3) & (y<3));
[X,Y] = meshgrid(-4:0.1:4);
figure(1)
surf(X, Y, z(X,Y))
xlabel('\bfX')
ylabel('\bfY')
grid on

%% PLOT3
% 
%% 
x = 0:2:6;
y = 0:1:6;
z = @(x,y) x.^2 + y.^2;
[X,Y] = meshgrid(0:1:10);
figure(1)
surf(X, Y, z(X,Y))
xlabel('\bfX')
ylabel('\bfY')
grid on

%% 
z = @(x,y) sin(x).*cos(y) .* ((x>-3) & (y<3));
[X,Y] = meshgrid(-5:0.5:5);
figure(1)
surf(X, Y, z(X,Y))
xlabel('\bfX')
ylabel('\bfY')
grid on

%% 



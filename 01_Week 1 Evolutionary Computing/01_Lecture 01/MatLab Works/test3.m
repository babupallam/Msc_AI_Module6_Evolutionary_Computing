t = [0: pi/20: 2*pi]; 
plot(t, cos(t))
grid on

title('The Cos Function')
xlabel('t'); ylabel('Cos')
axis([0 2*pi -1 1])
plot(t,cos(t),'k-', t,sin(t),'ro')
legend('Cos', 'Sin')
%% Logarithmic Scale
clc
semilogy(t, abs(cos(t)))
semilogx(t, abs(cos(t)))
loglog(t, abs(cos(t)))
%% Multiple Graphs
subplot(2,2,1) 
%% 3D Graphs

x = linspace(-20, 20, 80);
y = linspace(-2*pi, 2*pi, 160);
[X,Y] = meshgrid(x,y)
surf(X, Y, X.^2.*cos(Y))

%% More Commands
clc
help commandhistory

lookfor exponential

%% 
x= input("ENter a number: ")
format long %Set the default output number of decimal digits 15.
format short% Set the default output number of decimal digits 4.
%% 





%Ref:  https://in.mathworks.com/help/matlab/ref/contour.html#d126e242352
%https://www.youtube.com/watch?v=WsZj5Rb6do8
%% Contours of a Function
x = linspace(-2*pi,2*pi);
y = linspace(0,4*pi);
[X,Y] = meshgrid(x,y);
Z = sin(X)+cos(Y);
contour(X,Y,Z)

% Note: babu pallam
% x --> Z=mxn --> x would be 1xn    || x would be mxn
% y --> Z=mxn --> y would be 1xm    || x would be mxn
% 1.  x and y values should be either incresing or decresing
%
% Example: X = 1:10
% Example: X = [1 2 3; 1 2 3; 1 2 3]
% Example: [X,Y] = meshgrid(1:10)


%%
x = linspace(0,4);%default creates 100 unique numbers bwtween this values x =linspace(0,6,3) = [ 1.0000    3.5000    6.0000]
y = linspace(0,4);
[X,Y] = meshgrid(x,y);
Z = X+Y;
contour(X,Y,Z)
%% Contours at Twenty Levels
[X,Y,Z] = peaks;
contour(X,Y,Z,20)
%% Contours at One Level
[X,Y,Z] = peaks;
v = [1,1];
contour(X,Y,Z,v)

%% Dashed Contour Lines
[X,Y,Z] = peaks;
contour(X,Y,Z,'--')
%% Contours with Labels
x = -2:0.2:2;
y = -2:0.2:3;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
contour(X,Y,Z,'ShowText','on')
%% Labels in Different Units

contour(peaks,[-4 0 2],"ShowText",true,"LabelFormat",@mylabelfun)
%% Custom Line Width
Z = peaks;
[M,c] = contour(Z);
c.LineWidth = 3;
%%
Z= peaks(3);
Z= peaks(1);
Z= peaks(5);
%%
contour(peaks,1)
%%
contour(peaks,2)
%%
contour(peaks,10)
%%
contour(peaks,[-4 0 4])
%%


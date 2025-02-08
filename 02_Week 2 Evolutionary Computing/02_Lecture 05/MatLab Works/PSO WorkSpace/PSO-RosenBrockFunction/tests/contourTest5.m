n = 100; %n points
ind = [20,40,60,94]; %points to plot
xy = randi([10 20],n,2)% nx2 matrix in which each element in between 10 and 20
contour(peaks);
hold on
xy(ind,1)
xy(ind,2)
scatter(xy(ind,1),xy(ind,2),[], "filled",'k')
%% 
x = linspace(0,3*pi,200);
y = cos(x) + rand(1,200);  
scatter(x,y)

%% Scatter Simple Example

x = [1 2 3 4 5];
y=[9 11 10 13 10];
scatter(x,y,"filled","k")

%% 

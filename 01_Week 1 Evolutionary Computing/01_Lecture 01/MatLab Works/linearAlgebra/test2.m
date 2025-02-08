% Task 1 
x =linspace(0,3,100)

%% 

% Task 2
y1 = 6-x

%% 

% Task 3
plot(x,y1)

%% 

% Task 4
y2 = 2+3*x

%% 

% Task 5
plot(x,y1)
hold on
plot(x,y2)
hold off

%% 

% Task 6
A=[[1 1];[-3 1]]

%% 

% Task 7

b=[6;2]
%% 

% Task 8
point=A\b

%% 

% Further Practice

x3 = point(1);
y3 = point(2);
hold on
plot(x3,y3,"ro")
hold off
%% 


plot(x,y1)
hold on
plot(x,y2)
plot(x3,y3,"ro")

hold off
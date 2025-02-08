randi([0,1],1,50)

%% 
x=randi(10,1,10)
result = @(x) simpleFun(x)

fun1 = result;
x
fun1(x)

%% 
p1 = [1 0 0 1 0 1 0]
numel(p1)
%% 
rand([1,3])

%% 
% p = randperm(n) returns a row 
% vector containing a random 
% permutation of the integers 
% from 1 to n without 
% repeating elements.


randperm(10)

%% 
% p = randperm(n,k) returns 
% a row vector containing k 
% unique integers selected 
% randomly from 1 to n.


randperm(10,3)

%% 
A = rand(10)
B = rand(1)
C = rand([1])
D = rand([1 1])
E= rand([1, 2])

%% 

rand*sum(10)

%% 
A = 1:5
B = cumsum(A)

%% 
A = [1 4 7; 2 5 8; 3 6 9]
B = cumsum(A)
%% 
A = [1 3 5; 2 4 6]
B = cumsum(A,2)

%% Cumulative Sum of Logical Input
A = [true false true; true true false]
B = cumsum(A,2)
%% 
p = [1 2 3 4]
c = rand(p)
result = sum(c)

%% 
rand(1) %give fraction betwen 0 and 1
rand(1,2)%gives fractoj beween 0 and 1, size is 1x2 matrix
rand(1,2,3,4)% 3 and 4 have no effect

rand*sum(p) % first compute random then sum of those values
rand*sum(1)% only one value and sum is same as rand(i)
%% 
p=[1 2]
cumsum(p)%[1 3]
p=[1 2 3 4 5]
cumsum(p)%[1 3 6 10 15]
%% 
p = rand(1,5)
r= rand*sum(p)
c = cumsum(p)
i = find(r <= c, 1,"first")




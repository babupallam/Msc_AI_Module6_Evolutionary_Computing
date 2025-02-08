%%% REPEAT COPIES OF ARRAY REPMAT()
% Create a 3-by-2 matrix whose elements contain the value 10.
A = repmat(10,3,2)

%% 
% 3x2 matrix of max value 10
A = randi(10,3,2)

%use repmat 2x2 matrix, each element is replaced by that matrix
B= repmat(A,2)
%% 

%use repmat 1x2 matrix, each element is replaced by that matrix
B= repmat(A,1,2)

%% 

A = [1 2 3 4]
B= repmat(A,1,2)
C =repmat(A,4,1)
%% 
% Horizontal stack of column matrix
A = (1:3)';  
B = repmat(A,1,4)
%% With Table 

A = table([39; 26],[70; 63],'VariableNames',{'Age' 'Height'})

B= repmat(A,2,3)
%% 



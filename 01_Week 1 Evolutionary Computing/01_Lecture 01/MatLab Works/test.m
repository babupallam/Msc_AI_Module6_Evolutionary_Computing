v = [7 -2 5];
v = [7,-2, 5];
w = [1; 2; 3]; 
%% 
A = [4 -2 5; -1 7 -6; 2 3 5]
A = [ 4 -2 5 
    -1 7 -6 
    2 3 5]
%% Basic Functions

va = abs(v)
sq = sqrt(v)
y = sin(pi/6)
y = exp(4)%e^5
v'
C1 = eye(4)
C2 = eye(5,3)
C3 = ones(3)
C4 = ones(2,3)
C5 = zeros(2)
%% 
A1 = diag(v)
%% Sequences
u1 = [4:10] %Returns the vector with elements 4,5,6,7,8,9,10 (step 1).
v1 = [3:2:8] %Returns the vector with elements 3,5,7 (step 2). Notice that the last element is not 8.
t1 = [1:-1/2:-1] %Returns the vector with elements 1,1/2,0,-1/2,-1 (step -½).
u2 = linspace(4,10,7) %Returns the vector with 7 numbers starting from 4 until 10. 10 is always included as the last element.
t1 = logspace(0,3,4) %Returns the vector with 4 numbers 100, 101, 102, 103.Dimensions
%% 
% Dimensions and Indices
n = length(t1) %Returns the length of t1, if it is a vector or the maximum dimension, if it is a matrix.
[nr,nc] = size(A) %Assigns the rows of the matrix A in nr and the columns of A in nc.
A(1,2) %Returns the element of the first row and second column.
A(4,5) = 3 %Assigns the value 3 to the element at the 4th row and 5th column (The elements that were missing in the original matrix are filled with zeros, e.g. all elements of the 4th row, and 4th and 5th columns are 0 except for the element (4,5), which is 3).
B = [1:5, 2:6] %Creates the matrix []1234523456.
B = [1:5; 2:6] %Creates the matrix 
B(2,:) %Returns the 2nd row of the matrix B in the form of row vector.
B(:,5) %Returns the 5th column of the matrix B in the form of column vector.
B(1:2, end-1:end) %Returns a matrix with 4 elements of the 2 first rows and the 2 last columns, thus the matrix 6554.
B(:, 2:4) = [] %Deletes columns from 2 to 4 included.
%% 
A = [1 2 3 4 
    4 5 6 7]

A(1,1)%1
A(1,2)%2  vertical indexing
A(1:2)% 1 4
A(1:4)%1 4 2 5
A(1:5)%1 4 2 5 3

A(1, 3:4)% 3 4
A(:,2:3)% all rows
%% Matrix Production with Random Elements

v = rand(1,3)%    0.8147    0.9058    0.1270
A = rand(3)% 3x3 matrix of random numbers
B = rand(3,6)% 3x6 matexi of random numbers

A = rand(3)
C= rand(3)

D= A+C
D=A*C

A=[1 2 3]
x1=2
result = x1.*A

x1 =[2,3,4]
result = x1.*A

A =[1,2; 3,4]
A^3

A =[1,2,3]
% A^3 %error

A.^3  % cube of each numbers
%% 
A =[1,2; 3,4]
A^(-1) %Returns the inverse matrix of A.
inv(A) %Same as above.
%% 
% A\B %Inverse division: Does the operation inv(A)*B, where B matrix is not necessarily a square matrix, but the number of the rows of B must be equal to the dimension of square matrix A. The inverse division is useful for the solution of the systemAxb=.
max(A) %If A is a matrix, it returns the row vector with elements equal to the maximum of the value of element of the column where belongs to. If A is a vector (column or row), it returns the maximum value.
max(A,[],1) %If A is matrix, it returns the row vector with elements equal to the maximum of the value of element of the column where belongs to.
max(A,[],2) %If A is matrix, it returns the column vector with elements equal to the maximum of the value of element of the row where belongs to.

%% 
min(A) %Same syntax with max, but returns the minima.
sum(A) %If A is matrix, it returns the row vector with elements equal to the sum of the elements of the column where belong to. If A is a vector (column or row), it returns the sum of all elements.
sum(A,1) %If A is matrix, it returns the row vector with elements equal to the sum of the elements of the column where they belong to.
sum(A,2) %If A is matrix, it returns the column vector with elements equal to the sum of the elements of the row where they belong to.
prod(A) %Same syntax with sum, but it returns the products.



%% 
% Matrix Reductions
C = reshape([1 2 3; 4 5 6;7 8 9; 10 11 12], 2,6)

E = C(:) %Reshape C matrix to a column vector.
%% 






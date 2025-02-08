x= linspace(-5,5,10);%1x10
y=linspace(-5,5,10);%1x10

[X,Y]= meshgrid(x,y);%10x10

Z=rand(10);%10x10
contour(X,Y,Z);

%% 
x= linspace(-5,5,10);%1x10
y=linspace(-5,5,10);%1x10
z = x^2+y^2;
[X,Y]= meshgrid(x,y);%10x10
Z=meshgrid(z)
contour(X,Y,Z);

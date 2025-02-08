x=linspace(1,2,4);
y=linspace(1,2,4);

[X,Y]= meshgrid(x,y);
Z=randi(4,4)
contour(X,Y,Z);
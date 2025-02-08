
[x,y] = meshgrid(-3:.1:3,-3:.1:3);
w = (1/(2*pi))*exp(-0.5*(x.^2+y.^2));

contour(w)
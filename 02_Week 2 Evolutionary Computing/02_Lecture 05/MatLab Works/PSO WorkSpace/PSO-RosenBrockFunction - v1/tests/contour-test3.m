nx =200;
ny=199;
x = linspace(-5,5,nx);
y =linspace(-6,6,ny);
f=zeros(nx,ny);
g=zeros(nx,ny);

for i=1:nx
    for j=1:ny
        f(i,j) = obj([x(i),y(j)]);
        g(i,j) = con([x(i),y(j)]);
    end
end

figure;
hold on;
contour(x,y,f',50);
contour(x,y,g',[3,3],'LineColor','k','LineWidth',10);
colorbar;
xlabel('x');
ylabel('y');


function [f]=obj(x)
    f = 3*(x(1)-2)^2 + (x(2)+1)^2;
end

function [g] = con(x)
    g= x(1)^2 +x(2);
end
% Label Contour Plot Levels
Z = peaks;
figure
[C,h] = contour(Z,8);

clabel(C,h)
title('Contours Labeled Using clabel(C,h)')
%% Change Fill Colors for Contour Plot

[X,Y,Z] = peaks;
figure
contourf(X,Y,Z,20)
colormap(hot)
title('Hot Colormap')
%% Highlight Specific Contour Levels

Z = peaks(100);
% Round the minimum and maximum data values in Z and store these values in zmin and zmax, respectively. Define zlevs as 40 values between zmin and zmax.

zmin = floor(min(Z(:))); 
zmax = ceil(max(Z(:)));
zinc = (zmax - zmin) / 40;
zlevs = zmin:zinc:zmax;
% Plot the contour lines.

% figure
contour(Z,zlevs)
%% Contour Plot with Major and Minor Grid Lines

major = -6:2:8;
minor = -5:2:7;
[cmajor,hmajor] = contour(peaks,'LevelList',major);   
clabel(cmajor,hmajor)                                  

hold on
[cminor,hminor] = contour(peaks,'LevelList',minor);    
hminor.LineStyle = ':';                                
hold off



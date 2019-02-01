clc;
clear;
x = [0 6 6]';
y = [0 0 5]';
dt = DelaunayTri(x,y)
tri = dt(:,:);
triplot(dt);
figure
fill(x,y,'r');
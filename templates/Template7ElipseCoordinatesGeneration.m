clear all;
clc;

x0 = [5;0]; %center of ellipse, x coordinate
y0 = [6;0]; %center of ellipse, y coordinate
a = [3;6]; %half of horizontal axis
b = [5;3]; %half of vertical axis
rotation = [0;pi/6]; % rotation of ellipse in rads

[x,y] = ellipseCart(x0, y0, a, b, rotation);

figure(1);
daspect([1,1,1]);
hold on;
plot(x(1,:),y(1,:));
grid on;
hold on;
plot(x(2,:),y(2,:));

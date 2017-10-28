clear all;
clc;

x0 = 20; %center of ellipse, x coordinate
y0 = -50; %center of ellipse, y coordinate
a = 40; %half of horizontal axis
b = 60; %half of vertical axis
rotation = pi/6; % rotation of ellipse in rads

[x,y] = ellipseCart(x0, y0, a, b, rotation);

figure(1);
daspect([1,1,1]);
hold on;
plot(x,y);
grid on;

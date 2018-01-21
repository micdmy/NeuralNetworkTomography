close all;
clear all;
clc;

x = 1;
y = 30;
a = pi/6;
img = zeros(100,100);
img(y,x) = 1;
[rad,tau] = radon(img,180*a/pi);
shRad = shiftRadon(x,y,[100,100],rad,180*a/pi);
verify = [rad, shRad];
zero = floor((size(img)+1)/2);
xzero = zero(2)
yzero = zero(1)

xs = x-xzero
ys = (size(img,1)-y+1)-yzero

t=(xs)*cos(a) + (ys)*sin(a)
[tx,ty] = pol2cart(a,t);
tx = tx + xzero;
ty = ty + yzero;

ax = subplot(1,1,1);
ax = displayImage(img,ax,'img');
hold on;
plot(ax,xzero,yzero,'go')
hold on;
plot(ax,[xzero,tx],[yzero,ty],'r-')
hold on;
plot(ax,xs,ys,'bx')


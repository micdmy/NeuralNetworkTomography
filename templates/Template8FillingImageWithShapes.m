clear all;
clc;

imgSize = [100, 100];

xpos = [10; 50; 75]; %positions of figures
ypos = [20; 50; 60];
a = [5; 20; 10];    % half of ellipses axes
b = [10; 25; 20]; 
rotation = [pi/4; pi/6; 0]; %rotation of ellipses

[x,y] = ellipseCart(xpos, ypos, a, b, rotation); % calculate coordinates of ellipses
img = imageFromObjectsCoordinates(x, y, imgSize);

figure(1);
daspect([1,1,1]);
axis([0,100, 0,100]);
hold on;
grid on;
plotMore(x,y);

figure(2);
ax = gca;
displayImage(img,ax,'Generated image');    
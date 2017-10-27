clear all;
clc;
img = imageFromGrayscaleFile('rectangles1_x10.tif');

figure(1);
ax = gca;
displayImage(img, ax);
hold on;




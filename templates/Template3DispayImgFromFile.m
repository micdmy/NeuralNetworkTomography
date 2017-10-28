clear all;
clc;
filename = 'rectangles1_x10.tif'
img = imageFromGrayscaleFile(filename);

figure(1);
ax = gca;
displayImage(img, ax, ['Picture: ',  filename]);
hold on;




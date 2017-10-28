clear all;
clc;
filename = 'rectangles2_x100.pgm';
img = imageFromGrayscaleFile( filename );

figure(1);
ax1 = gca;
displayImage(img, ax1, filename);

angles = 1:177;
[radImg, tau] = radon(img, angles);

figure(2);
ax2 = gca;
displayRadonImage(radImg, angles, tau, ax2,['Radon projection of: ' filename]);
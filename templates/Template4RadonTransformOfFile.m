clear all;
clc;

img = imageFromGrayscaleFile( 'rectangles2_x100.pgm' );

figure(1);
ax1 = gca;
displayImage(img, ax1);

angles = 1:177;
[radImg, tau] = radon(img, angles);

figure(2);
ax2 = gca;
displayRadonImage(radImg, angles, tau, ax2)
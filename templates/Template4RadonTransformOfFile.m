clear all;
clc;

img = imageFromGrayscaleFile( 'rectangles2_x100.pgm' );

figure(1);
displayImage(img, 1);

angles = 1:177;
[radImg, tau] = radon(img, angles);
displayRadonImage(radImg, angles, tau, 2)
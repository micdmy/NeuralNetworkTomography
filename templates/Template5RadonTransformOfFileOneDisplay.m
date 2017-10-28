clear all;
clc;
img = imageFromGrayscaleFile( 'rectangles2_x100.pgm' );

angles = 1:177;
[radImg, tau] = radon(img, angles);
fHandle = figure(1);

displayImgAndRadon(img, radImg, angles, tau, fHandle, 'Orginal image', 'Radon projection');
clear all;
clc;

img = imageFromGrayscaleFile( 'rectangles2_x100.pgm' );

angles = 1:177;
[radImg, tau] = radon(img, angles);

reconstructedImg = iradon(radImg, angles);

figure(1);
ax1 = gca;
displayImage(img, ax1, 'Orginal image');

fHandle = figure(2);
displayImgAndRadon(reconstructedImg, radImg, angles, tau, fHandle, 'Reconstruction', 'Radon projection');
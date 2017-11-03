clear all;
clc;

imgSize = 100;
ellipse2ImgRatioMax = 1/4;
ellipse2ImgRatioMin = 1/8;
nrOfEllipses = 4;
img = generateImage1Ellipses(imgSize,ellipse2ImgRatioMax ,ellipse2ImgRatioMin ,nrOfEllipses);


figure(1);
ax = gca;
displayImage(img,ax,'Generated image');    
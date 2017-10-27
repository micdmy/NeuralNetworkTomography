clc;
clear all;
positionX = [0, 100];
positionY = [0, 100];

img = [0, 0.25, 0.5; 0.3, 0.7, 0.8; 0.6, 0.8, 1]
RGBArray = image2RGBArray(img)

image(RGBArray)


clc;
clear all;
positionX = [0, 100];
positionY = [0, 100];

imgMatrix = [0, 0.25, 0.5; 0.3, 0.7, 0.8; 0.6, 0.8, 1]
imgArray = toArrayImage(imgMatrix)

image(imgArray)


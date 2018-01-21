clear all;
close all;
clc;

namePattern = 'RandomPixels5y5n25';
numberOfImages = 25;
generatePgmFiles = true;

%images data:
imgSize = 5;

%radon data:
projectionNum = 8;
%angleStep = floor(180 / projectionNum);
angles = linspace(0, 180, projectionNum+1);
angles = angles(1: end-1);

imgs = zeros(imgSize, imgSize, numberOfImages);

%Generate images below:

%imgs(:,:,1) = round(rand(imgSize,imgSize)); %random 1
%imgs(:,:,2) = round(rand(imgSize,imgSize)); %random 2
%imgs(:,:,3) = round(rand(imgSize,imgSize)); %random 3
%imgs(:,floor(imgSize/2),4) = 1; % vertical line
%imgs(floor(imgSize/2),:,5) = 1; % horizontal line
%imgs(:,floor(imgSize/2),6) = 1; imgs(floor(imgSize/2),:,6) = 1; %cross
%imgs([2,end-1],:,7)=1; imgs(:,[2,end-1],7)=1; % rectangle

%generate single pixels 
p = 1;
for m = 1 : imgSize
    for n = 1: imgSize
       imgs(n,m,p) = 1;
       p=p+1;
    end
end

%mix images (permutation):
imgs = imgs(:,:,randperm(size(imgs,3)));

[firstProjection, tau] = radon(imgs(:,:,1), angles);
projSize = size(firstProjection);
projections = zeros(projSize(1), projSize(2), numberOfImages);
clear firstProjection;

for k = 1 : numberOfImages;
    projections(:,:,k) = radon(imgs(:,:,k), angles);
end

if generatePgmFiles
    images2GrayscaleFiles(imgs, [namePattern, 'I']);
    images2GrayscaleFiles(projections, [namePattern, 'R']);
end
save([namePattern, '.mat'], 'imgs', 'projections', 'tau', 'angles');

clear all;
clc;

namePattern = 'Ellipse1x6y6n200';
numberOfImages = 200;


%images data:
imgSize = 6;
ellipse2ImgRatioMax = 1/2;
ellipse2ImgRatioMin = 1/6;
nrOfEllipses = 1;

%radon data:
projectionNum = 8;
%angleStep = floor(180 / projectionNum);
angles = linspace(0, 180, projectionNum+1);
angles = angles(1: end-1);

imgs = zeros(imgSize, imgSize, numberOfImages);


for k = 1 : numberOfImages;
    imgs(:,:,k) = generateImage1Ellipses(imgSize,ellipse2ImgRatioMax ,ellipse2ImgRatioMin ,nrOfEllipses);
end

[firstProjection, tau] = radon(imgs(:,:,1), angles);
projSize = size(firstProjection);
projections = zeros(projSize(1), projSize(2), numberOfImages);
clear firstProjection;

for k = 1 : numberOfImages;
    projections(:,:,k) = radon(imgs(:,:,k), angles);
end

images2GrayscaleFiles(imgs, [namePattern, 'I']);
images2GrayscaleFiles(projections, [namePattern, 'R']);
save([namePattern, '.mat'], 'imgs', 'projections', 'tau', 'angles');

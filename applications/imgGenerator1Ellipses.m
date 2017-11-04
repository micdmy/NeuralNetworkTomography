clear all;
clc;

numberOfImages = 10;

imgSize = 100;
ellipse2ImgRatioMax = 1/2;
ellipse2ImgRatioMin = 1/6;
nrOfEllipses = 1;

imgs = zeros(imgSize, imgSize, numberOfImages);

for k = 1 : numberOfImages;
    imgs(:,:,k) = generateImage1Ellipses(imgSize,ellipse2ImgRatioMax ,ellipse2ImgRatioMin ,nrOfEllipses);
end
images2GrayscaleFiles(imgs, 'img1Ellipses');

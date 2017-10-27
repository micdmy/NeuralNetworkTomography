function [] = displayImgAndRadon(img, radImg, angles, tau, figHandle)

figure(figHandle);

imgAxes = subplot(1, 2 , 1);
displayImage(img, imgAxes);

radImgAxes = subplot(1, 2, 2);
displayRadonImage(radImg, angles, tau, radImgAxes);
end
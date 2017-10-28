function [] = displayImgAndRadon(img, radImg, angles, tau, figHandle, imgTitle, radImgTitle)

figure(figHandle);

imgAxes = subplot(1, 2 , 1);
displayImage(img, imgAxes, imgTitle);

radImgAxes = subplot(1, 2, 2);
displayRadonImage(radImg, angles, tau, radImgAxes, radImgTitle);
end
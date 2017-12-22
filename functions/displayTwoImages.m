function [] = displayTwoImages( img1, img2, figHandle, imgTitle1, imgTitle2 )

figure(figHandle);
img1Axes = subplot(1, 2 , 1);
displayImage(img1, img1Axes, imgTitle1);
img2Axes = subplot(1, 2 , 2);
displayImage(img2, img2Axes, imgTitle2);
end


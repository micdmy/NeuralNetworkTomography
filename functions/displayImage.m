function [] = displayImage(img, figureNr)
% Displays grayscale image matrix in figure

[xSize, ySize] = size(img);
figure(figureNr);
xAxisNumbers = linspace(0,xSize-1,10);
yAxisNumbers = linspace(0,ySize-1,10);
axes('XTick', xAxisNumbers, 'YTick', yAxisNumbers);
axis([-0.5, xSize-0.5, -0.5, ySize-0.5,]);
daspect([1,1,1]);
image('XData',0,'YData',0,'CData',image2RGBArray(img));
end
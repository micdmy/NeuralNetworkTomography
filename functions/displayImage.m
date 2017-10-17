function [] = displayImage(img, figureNr)
% Displays grayscale image matrix in figure

[xSize, ySize] = size(img);
figure(figureNr);
axes('XTick', 0 : 1 : xSize-1, 'YTick', 0 : 1 : ySize-1);
axis([-0.5, xSize-0.5, -0.5, ySize-0.5,]);
daspect([1,1,1]);
image('XData',0,'YData',0,'CData',toArrayImage(img));
end
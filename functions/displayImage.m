function [ax] = displayImage(img, ax, title)
% Displays grayscale image matrix in figure

axes(ax);
[xSize, ySize] = size(img);
set(ax, 'Title', text('String',title,'Color','k'));
set(ax, 'XTick', [1:1:xSize]);
set(ax, 'YTick', [1:1:ySize]);
axis([0.5, xSize+0.5, 0.5, ySize+0.5]);
daspect([1,1,1]);
image('XData',1,'YData',1,'CData',image2RGBArray(img));
end
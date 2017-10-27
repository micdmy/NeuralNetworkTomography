function [ RGBArray ] = image2RGBArray( img )
%Converts m x n matrix of [0:1] values to 3-D array of true colors
%Input and output is in grayscale;

[xSize, ySize] = size(img);
img = img([ySize:-1:1],:); % y-axis mirror, becouse image is displayed top to bottom
RGBArray = zeros(xSize,ySize,3);
RGBArray(:,:,1) = img; % set red channel
RGBArray(:,:,2) = img; % set green channel
RGBArray(:,:,3) = img; % set blue channel
end


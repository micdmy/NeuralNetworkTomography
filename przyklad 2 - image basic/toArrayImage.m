function [ RGBArray ] = toArrayImage( img )
%Converts m x n matrix of [0:1] values to 3-D array of true colors
%Input and output is in grayscale;
[xSize, ySize] = size(img);
RGBArray = zeros(xSize,ySize,3);
RGBArray(:,:,1) = img;
RGBArray(:,:,2) = img;
RGBArray(:,:,3) = img;
end


function [ img ] = imageFromGrayscaleFile ( fileName )
%Reads grayscale file and puts data to [0,1] valued simple grayscale image matrix.

img = imread(fileName);
img = img ./ 255;
end


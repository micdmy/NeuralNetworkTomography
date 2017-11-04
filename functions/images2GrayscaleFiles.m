function [] = images2GrayscaleFiles(images,fileNamePattern)
%Saves data from [0,1] valued simple grayscale image matrix to file.
images = 256 .* images;
nrOfImgs = size(images,3);
for k = 1 : nrOfImgs
    imwrite(images(:, :, k), [fileNamePattern, num2str(k, '%.4d'), '.pgm'] );
end
end


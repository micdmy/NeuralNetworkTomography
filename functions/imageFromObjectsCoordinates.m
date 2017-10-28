function [img] = imageFromObjectsCoordinates(x, y, imgSize)
%Generate (0-1) valued (binary) image of "imgSize" size from objects, which contours are
%given as list of coordinates in columns.
%Each row corresponds to one object.

assert(all(size(x) == size(y)),'x and y must be the same size' );
objects = size(x, 1);

img = zeros(imgSize);

for obj = 1 : objects
    img = img | poly2mask(x(obj,:), y(obj,:), imgSize(1), imgSize(2));
end

img = img([size(img,1): -1: 1], :); % y axis mirror, becouse  'poly2mask' works with inverted y axis

end

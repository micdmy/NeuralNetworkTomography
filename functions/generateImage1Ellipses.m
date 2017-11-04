function [img] = generateImage1Ellipses(imgSize, maxRatio, minRatio, ellipses)

maxEllipseLength = imgSize * maxRatio;
minEllipseLength = imgSize * minRatio;

%generate angles of rotations for ellipses 
rotation = pi.*rand(ellipses, 1);
% generate lenghts of halfes of ellipse's axes:
ab = randi([ceil(minEllipseLength/2), floor(maxEllipseLength/2)],ellipses ,2);
a = ab(:,1);
b = ab(:,2);
% generate coordinates for middles of ellipses:
[xpos, ypos] = randomInDisc(ceil(imgSize/2), ceil(imgSize/2), floor(imgSize/2 - maxEllipseLength/2), ellipses);

% generate ellipses's rims coordinates:
[x,y] = ellipseCart(xpos, ypos, a, b, rotation);

img = imageFromObjectsCoordinates(x, y, [imgSize,imgSize]);
end

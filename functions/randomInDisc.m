function [x, y, alfa, r] = randomInDisc(x0, y0, R, length)
% Generates coordinates of random points in specipied disc.
% Output in cartesian and polar coordinates, column vectors.
 r = R .* rand(length,1);
 alfa = (2*pi) .* rand(length, 1);
 
 x = x0.*ones(length, 1) + r.*cos(alfa);
 y = y0.*ones(length, 1) + r.*sin(alfa);
 
end
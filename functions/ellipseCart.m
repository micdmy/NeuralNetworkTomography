function [x,y] = ellipseCart(xpos, ypos, a, b, alfa)
%Returns ellipse's cartesian coordinates. Each row in parameters and output
%corresponds to one ellipse. Parameters are column vectors.
%x and y length is 4*max([a,b])

%Parameters (column vectors):
%x,y - center of ellipse
%a - half of width
%b - half of height
%alfa - rotation of ellipse in rads

xposSize = size(xpos);
ellipses = xposSize(1);


points = 4 * max([max(a),max(b)]); %number of counted pixels should be at least 2 * longer ellipse axis 
%each ellipse contains of 'points' points

firow = linspace(0, 2*pi, points); %row of fi angles 
licznik = (a .* b) * ones(1, points); % ellipse polar coordinates equation
mianownik = sqrt( (b*cos(firow)).^2 + (a*sin(firow)).^2 ); % ellipse polar coordinates equation
ro = licznik ./ mianownik; % ellipse polar coordinates equation
%now ro contains ro coordinates of ellipses with center in (0,0), each row
%of ro corresponds to one ellipse
fi = ones(ellipses, 1) * firow; 
rotationAngles = alfa * ones(1,points);
fi = fi + rotationAngles; % rotate ellipses by alfa
%now fi contains fi coordinates of ellipses rotated according to alfa vector, 
%with center in (0,0), each row of fi corresponds to one ellipse
[x, y] = pol2cart(fi, ro); % convert to cartesian
%now each x row contains x coordinates of one ellipse, the same with y
xshift = xpos * ones(1,points);
yshift = ypos * ones(1,points);
x = x + xshift;% shift ellipse horizontally to center specified in xpos
y = y + yshift;% shift ellipse vertically to center specified in ypos
end
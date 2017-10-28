function [x,y] = ellipseCart(xpos, ypos, a, b, alfa)
%Returns ellipse's cartesian coordinates.
%x and y length is 4*max([a,b])

%Parameters:
%x,y - center of ellipse
%a - half of width
%b - half of height
%alfa - rotation of ellipse in rads

longerSize = 4 * max([a,b]); %number of counted pixels should be at least 2 * longer ellipse axis 

fi = linspace(0, 2*pi, longerSize); %initial fi vector
ro = (a .* b) ./ sqrt( (b.*cos(fi)).^2 + (a.*sin(fi)).^2 ); % ellipse polar coordinates equation 
fi = fi + alfa.*ones(size(fi)); % rotate ellipsy by alfa
[x, y] = pol2cart(fi, ro); % convert to cartesian
x = x + xpos .* ones(size(x)); % shift ellipse horizontally
y = y + ypos .* ones(size(y)); % shift ellipse vertically
end
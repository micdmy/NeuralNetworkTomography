function [ radSh ] = shiftRadon(x, y , imgSize, radImg, angles)
% angles are in grads
numAng = max(size(angles));
zero = floor((imgSize+1)/2);
xzero = zero(2);
yzero = zero(1);
xs = x-xzero;
ys = (imgSize(1)-y+1)-yzero;

radSh = zeros(size(radImg));

for k = 1 : numAng
    
    t = (xs)*cos(angles(k)*pi/180) + (ys)*sin(angles(k)*pi/180);
    t = -round(t);
    projection = circshift(radImg(:,k),t);
    if t > 0 
        projection(1:t) = 0;
    end
    if t < 0 
        projection(end+t+1:end) = 0;
    end
    radSh(:,k) = projection;
end


end


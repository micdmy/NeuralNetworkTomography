function [ shRadsSums, pixels ] = preprocessDataForSinglePixel( imgs, rads, numPixel, angles )

numImgs = size(imgs,3);
radTauSize = size(rads,1);
radAngleSize = size(rads,2);
pixels = zeros(1, numImgs*numPixel); %num of pixels in one image
shRadsSums = zeros(radTauSize, numImgs*numPixel);
n=1; % counts shRadsSums
for k = 1 : numImgs %for every image and its radon transform:
    pixCords = randi(size(imgs,1), numPixel, 2); % rondomly generate numPixel pixel coordinates. Caution: assumes that image is square
    for m = 1 : numPixel % for every choosen pixel:
        %shift each angle projection according to pixel position and angle:
        shRadon = shiftRadon(pixCords(m,1), pixCords(m,2), [size(imgs,1), size(imgs,2)], rads(:,:,k), angles);
        shRadsSums(:,n) = sum(shRadon, 2)./radAngleSize; % calculate aritmethic average of projections 
        pixels(n) = imgs(pixCords(m,1), pixCords(m,2), k); % put pixel value to pixels
        n = n + 1;
    end
end

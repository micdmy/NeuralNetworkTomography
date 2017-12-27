function [ shRadsSums, pixels ] = preprocessDataForSinglePixel( imgs, rads, numPixel, angles )

numImgs = size(imgs,3);
radTauSize = size(rads,1);
pixels = zeros(1, numImgs*numPixel);
shRadsSums = zeros(radTauSize, numImgs*numPixel);
n=1; % counts shRadsSums
for k = 1 : numImgs
    pixCords = randi(size(imgs,1), numPixel, 2); % assumes that image is square
    for m = 1 : numPixel
        shRadon = shiftRadon(pixCords(m,1), pixCords(m,2), [size(imgs,1), size(imgs,2)], rads(:,:,k), angles);
        shRadsSums(:,n) = sum(shRadon, 2); %sum all angles to 1 column
        pixels(n) = imgs(pixCords(m,1), pixCords(m,2), k); % put pixel value to pixels
        n = n + 1;
    end
end

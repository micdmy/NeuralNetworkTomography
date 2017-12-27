function [ shRadsSums ] = radon2PixelProjections( imgsSize, rads, angles )

radTauSize = size(rads,1);
shRadsSums = zeros(radTauSize, numImgs*numPixel);
n=1; % counts shRadsSums
for k = 1 : imgsSize(3)
    for ny = 1 : imgsSize(1)
        for nx = 1 : imgsSize(2)
            shRadon = shiftRadon(nx, ny, [imgsSize(1), imgsSize(2)], rads(:,:,k), angles);
            shRadsSums(:,n) = sum(shRadon, 2); %sum all angles to 1 column
            n = n + 1;
        end       
    end
end

end


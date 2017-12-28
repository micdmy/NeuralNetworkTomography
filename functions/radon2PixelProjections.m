function [ shProjForPixels ] = radon2PixelProjections( imgsSize, rad, angles )

radTauSize = size(rad,1);
radAngleSize = size(rad,2);
shProjForPixels = zeros(radTauSize, imgsSize(1) * imgsSize(2));
n=1; % counts shRadsSums
    for nx = 1 : imgsSize(2)
        for ny = 1 : imgsSize(1)
            shRadon = shiftRadon(nx, ny, [imgsSize(1), imgsSize(2)], rad, angles);
            shProjForPixels(:,n) = sum(shRadon, 2) ./ radAngleSize; %average all angles to 1 column
            n = n + 1;
        end       
    end
end


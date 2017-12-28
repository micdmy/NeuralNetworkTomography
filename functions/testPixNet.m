function [ imgs ] = testPixNet(net, rads, imgSize, angles)
imgs = zeros(imgSize(1),imgSize(2),size(rads,3));
for k = 1 : size(rads,3)
    projForPixelsInImg = radon2PixelProjections(imgSize, rads(:,:,k), angles);
    projForPixelsInImgCA = tonndata(projForPixelsInImg, true, false);
    rowImgCA  = net(projForPixelsInImgCA);
    imgs(:,:,k)  = reshape(fromnndata(rowImgCA ,true, true, false), imgSize);
end
end


function [ imgs, timeProc, timeNet ] = testPixNet(net, rads, imgSize, angles)
imgs = zeros(imgSize(1),imgSize(2),size(rads,3));
timeProc = 0;
timeNet = 0;
for k = 1 : size(rads,3)
    
    val = tic;
    projForPixelsInImg = radon2PixelProjections(imgSize, rads(:,:,k), angles);
    timeProc = timeProc + toc(val);
    
    projForPixelsInImgCA = tonndata(projForPixelsInImg, true, false);
    
    val = tic;
    rowImgCA  = net(projForPixelsInImgCA);
    timeNet = timeNet + toc(val);
    
    imgs(:,:,k)  = reshape(fromnndata(rowImgCA ,true, true, false), imgSize);
end
end


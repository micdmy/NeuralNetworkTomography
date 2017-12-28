function [ imgs ] = testImgNet(net, rads, imgSize)
radsCA = images2nnData(rads);
imgsCA = net(radsCA);
imgs = nnData2Images(imgsCA, [imgSize(1), imgSize(2), size(rads,3)]);
end


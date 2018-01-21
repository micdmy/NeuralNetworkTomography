function [ imgs, time] = testImgNet(net, rads, imgSize)
radsCA = images2nnData(rads);
val = tic;
imgsCA = net(radsCA);
time = toc(val);
imgs = nnData2Images(imgsCA, [imgSize(1), imgSize(2), size(rads,3)]);
end


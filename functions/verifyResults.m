function [] = verifyResults( name, testImagesName )

%LOAD TEST DATA
file = load([testImagesName '.mat']);
orginals = file.imgs;
radons = file.projections;
angles = file.angles;
clear file;
imgSize = [size(orginals,1),size(orginals,2)];

% WHOLE IMAGE NETWORK
file  = load([name 'Results.mat']);
imgNet = file.net;
numTrain = file.numToTrain;
clear file;
val = tic;
imgImgs = testImgNet(imgNet,radons,imgSize);
imgTime = toc(val);
imgImgs = normalizeImages(imgImgs);

% SINGLE PIXEL NETWORK
file  = load([name 'PixResults.mat']);
pixNet = file.net;
clear file;
val = tic;
pixImgs = testPixNet(pixNet,radons,imgSize,angles);
pixTime = toc(val);
pixImgs = normalizeImages(pixImgs);

%INVERTED RADON
iradImgs = zeros(size(orginals));
val = tic;
for k = 1 : size(radons,3)
     iradImgs(:,:,k) = iradon(radons(:,:,k), angles,'linear','Ram-Lak',1,imgSize(1));
end
iradTime = toc(val);
iradImgs = normalizeImages(iradImgs);

%DISPLAY RESULTS:
view(imgNet);
view(pixNet);
N = size(radons,3);
for k = 1 : N
    ax = subplot(2,2,1);
    displayImage(orginals(:,:,k), ax, ['Orginal ' sprintf('%d',k) ' out of ' sprintf('%d',N)]);
    ax = subplot(2,2,2);
    displayImage(iradImgs(:,:,k), ax, ['Iradon Ram-Lak, angles=' sprintf('%d',size(radons,2)) ' clks=' sprintf('%d',iradTime)]);
    ax = subplot(2,2,3);
    displayImage(imgImgs(:,:,k), ax, ['Whole image, train examples=' sprintf('%d',numTrain) ' clks=' sprintf('%d',imgTime)]);
    ax = subplot(2,2,4);
    displayImage(pixImgs(:,:,k), ax, ['Single pix, clks=' sprintf('%d',pixTime)]);
    pause
end

end


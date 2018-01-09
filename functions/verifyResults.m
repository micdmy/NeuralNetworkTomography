function [] = verifyResults( name, testImagesName, isWhole, isPixel )


%LOAD TEST DATA
file = load([testImagesName '.mat']);
orginals = file.imgs;
radons = file.projections;
angles = file.angles;
clear file;
imgSize = [size(orginals,1),size(orginals,2)];

if isWhole
% WHOLE IMAGE NETWORK
file  = load([name 'Results.mat']);
imgNet = file.net;
numTrain = file.numToTrain;
clear file;
[imgImgs, imgTime] = testImgNet(imgNet,radons,imgSize);
imgImgs = normalizeImages(imgImgs);
view(imgNet);
end

if isPixel
% SINGLE PIXEL NETWORK
file  = load([name 'PixResults.mat']);
pixNet = file.net;
clear file;
[pixImgs, pixTimeProc, pixTime] = testPixNet(pixNet,radons,imgSize,angles);
pixImgs = normalizeImages(pixImgs);
view(pixNet);
end

%INVERTED RADON
iradImgs = zeros(size(orginals));
val = tic;
for k = 1 : size(radons,3)
     iradImgs(:,:,k) = iradon(radons(:,:,k), angles,'linear','Ram-Lak',1,imgSize(1));
end
iradTime = toc(val);
iradImgs = normalizeImages(iradImgs);

%DISPLAY RESULTS:


N = size(radons,3);

k = 1;
while 1
    ax = subplot(2,2,1);
    displayImage(orginals(:,:,k), ax, ['Orginal ' sprintf('%d',k) ' out of ' sprintf('%d',N)]);
    ax = subplot(2,2,2);
    displayImage(iradImgs(:,:,k), ax, ['Iradon Ram-Lak, angles=' sprintf('%d',size(radons,2)) ' clks=' sprintf('%d',iradTime)]);
    if isWhole
    ax = subplot(2,2,3);
    displayImage(imgImgs(:,:,k), ax, ['Whole image, train examples=' sprintf('%d',numTrain) ' clks=' sprintf('%d',imgTime)]);
    end
    if isPixel
    ax = subplot(2,2,4);
    displayImage(pixImgs(:,:,k), ax, ['Single pix, NetClks=' sprintf('%d',pixTime) ' ProcClks=' sprintf('%d',pixTimeProc)]);
    end
    user = input('NumberOfPicture = ');
    if isempty(user)
        k=k+1;
    else
        k=user;
    end
    if(k == 0)
        break;
    end
    if (k > N)
        k=1;
    end
end

end


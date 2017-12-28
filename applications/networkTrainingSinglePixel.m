clc;
close all;
clear all;
name = 'Ellipse2x32y32n1000';
file = load([name '.mat']);
imgs = file.imgs;
rads = file.projections;
numAngles = length(file.angles);
angles = file.angles;
clear file;

number = size(imgs, 3);
trainFraction = 9/10;
numToTrain = floor(number * trainFraction);
numToCheck = number - numToTrain;

numPixels = 50;

[shRadsSums, pixels] = preprocessDataForSinglePixel(imgs(:,:,1:numToTrain), rads(:,:,1:numToTrain), numPixels, angles);
columnSamples = true;
inputCA = tonndata(shRadsSums, columnSamples, false);
targetCA = tonndata(pixels, columnSamples, false);

hiddenLayersSizes = [8,4];
net = feedforwardnet(hiddenLayersSizes, 'trainlm');
net = configure(net, inputCA, targetCA);
view(net);

net = train(net, inputCA, targetCA);

testInputs = rads(:,:,numToTrain+1:end);
output = zeros(size(imgs,1), size(imgs,2), numToCheck);
for k = 1 : numToCheck
    projForPixelsInImg = radon2PixelProjections([size(imgs,1), size(imgs,2)], testInputs(:,:,k), angles);
    projForPixelsInImgCA = tonndata(projForPixelsInImg, columnSamples, false);
    rowImgCA  = net(projForPixelsInImgCA);
    output(:,:,k)  = reshape(fromnndata(rowImgCA ,true, true, false), [size(imgs,1), size(imgs,2)]);
end
output = normalizeImages(output);
orginals = imgs(:,:,numToTrain+1:end);

save([name 'PixResults.mat'], 'net', 'orginals', 'output', 'numAngles', 'numToTrain', 'numToCheck');
SuccessSavedTo =  [name 'Results.mat'] % should echo
displayResults([name 'Pix']);

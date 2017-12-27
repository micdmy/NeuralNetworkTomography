clc;
close all;
clear all;
name = 'Ellipse2x10y10n200';
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

orginals = imgs(:,:,numToTrain+1:end);
testInputs = rads(:,:,numToTrain+1:end);
testInputsCA = tonndata(testInputs, columnSamples, false);
for ny = 1 : size(imgs,1)
    for nx = 1 : size(imgs,2)
        pixelCA = net(testInputsCA(ny * nx));
        toMatrix = true;
        columnSample = true;
        pixel = fromnndata(pixelCA,toMatrix, columnSample, false);
    end
end


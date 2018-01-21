clc;
close all;
clear all;
name = 'Ellipse1x32y32n600'; % nazwa pliku z obrazami i ich transformatami
file = load([name '.mat']);
imgs = file.imgs;
rads = file.projections;
numAngles = length(file.angles);
angles = file.angles;
clear file;

number = size(imgs, 3);
trainFraction = 550/600; %okresla ile przykladow uzyjemy do uczenia
numToTrain = floor(number * trainFraction);
numToCheck = number - numToTrain;

numPixels = 700; % okresla ile pikseli z kazdego obrazu uzyjemy do uczenia

[shRadsSums, pixels] = preprocessDataForSinglePixel(imgs(:,:,1:numToTrain), rads(:,:,1:numToTrain), numPixels, angles);
columnSamples = true;
inputCA = tonndata(shRadsSums, columnSamples, false);
targetCA = tonndata(pixels, columnSamples, false);

hiddenLayersSizes = [8,6,4]; %okresla liczbe neuronow w kolejnych warstwach ukrytych
net = feedforwardnet(hiddenLayersSizes, 'trainlm');
net.trainParam.epochs = 10000;
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
SuccessSavedTo =  [name 'PixResults.mat'] % should echo
displayResults([name 'Pix']);

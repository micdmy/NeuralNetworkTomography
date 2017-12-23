clc;
clear all;
close all;

name = 'Ellipse2x10y10n200';
file = load([name '.mat']);
imgs = file.imgs;
rads = file.projections;
numAngles = length(file.angles);
clear file;

number = size(imgs, 3);
trainFraction = 9/10;
numToTrain = floor(number * trainFraction);
numToCheck = number - numToTrain;

inputCA = images2nnData(rads);
targetCA = images2nnData(imgs);


hiddenLayersSizes = [10,10];
net = feedforwardnet(hiddenLayersSizes, 'trainlm');
net = configure(net, inputCA, targetCA);
view(net);

%h = figure;
%displayTwoImages(imgs(:,:,1),imgs(:,:,2),h,'a','b');
net = train(net, inputCA(1:numToTrain), targetCA(1:numToTrain));

outputCA = net(inputCA(numToTrain+1:end));
output = nnData2Images(outputCA, [size(imgs,1),size(imgs,2),numToCheck]);
output = normalizeImages(output);

orginals = imgs(:,:,numToTrain+1:end);

save([name 'Results.mat'], 'net', 'orginals', 'output', 'numAngles', 'numToTrain', 'numToCheck');
SuccessSavedTo =  [name 'Results.mat'] % should echo
displayResults(name);

%TRAINING:
%   FUNCTION: net = train(net,X,T);
%   X - cell array, Ninputs x TimeSteps (Ni x TS)
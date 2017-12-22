function [ nnData ] = images2nnData( imgs )

pixels = size(imgs,1) * size(imgs,2);
timeSteps = size(imgs,3); % number of images

inColumns = reshape(imgs,[pixels, timeSteps]); %matrix of #pixels rows and #timeSteps columns
columnSamples = true;
nnData = tonndata(inColumns, columnSamples, false);
end


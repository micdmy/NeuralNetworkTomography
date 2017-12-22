function [ ] = displayResults( name )

file = load([name 'Results.mat']);
orginals = file.orginals;
calculated = file.output;
numAngles = file.numAngles;
numTrain = file.numToTrain;
numCheck = file.numToCheck;
clear file;

figHandle = figure;
for k = 1 : numCheck
    displayTwoImages(orginals(:,:,k), calculated(:,:,k), figHandle, ['Orginal. ' sprintf('%d',k) ' out of ' sprintf('%d',numCheck)], ['Calculated. Agles=' sprintf('%d',numAngles) ' Train examples=' sprintf('%d',numTrain)]);
    pause
end
end


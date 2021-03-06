function [] = displayInputs( name )

file = load([name '.mat']);
imgs = file.imgs;
rads = file.projections;
angles = file.angles;
tau = file.tau;
clear file;

numAngles = length(angles);
numImgs = size(imgs,3);
figHandle = figure;

for k = 1 : numImgs
    displayImgAndRadon(imgs(:,:,k), rads(:,:,k), angles, tau, figHandle, ['Image ' sprintf('%d',k) ' out of ' sprintf('%d',numImgs)], ['Radon projection. Agles=' sprintf('%d',numAngles)]); 
    pause
end

end


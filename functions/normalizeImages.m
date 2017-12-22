function [ outImgs ] = normalizeImages( imgs )

numberOfImages = size(imgs,3);
outImgs = zeros(size(imgs));
for k = 1 : numberOfImages
   maximum = max(max(imgs(:,:,k)));
   minimum = min(min(imgs(:,:,k)));
   zeroLevel = ones(size(imgs(:,:,k))).*minimum;
   outImgs(:,:,k) = imgs(:,:,k) - zeroLevel;
   outImgs(:,:,k) = imgs(:,:,k) ./ (maximum - minimum); 
end
   toLow = outImgs < 0;
   toHigh = outImgs > 1;
   outImgs(toLow) = 0;
   outImgs(toHigh) = 1;

end


function [ imgs ] = nnData2Images (nnData, outSize)

toMatrix = true;
columnSample = true;
inColumns = fromnndata(nnData, toMatrix, columnSample, false);
imgs = reshape(inColumns, outSize);

end


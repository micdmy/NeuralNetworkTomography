function [] = plotMore(x,y, pattern)
assert(all(size(x) == size(y)), 'x and y must be the same size')
shapes = size(x,1);
for shape = 1 : shapes
   plot(x(shape,:), y(shape,:), pattern);
   hold on;
end
end
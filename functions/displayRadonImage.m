function [ax] = displayRadonImage ( radImg, angles, tau, ax, title )
% Displays grayscale radon image matrix in figure

axes(ax);
%daspect([1,1,1]);
iptsetpref('ImshowAxesVisible','on');
imshow(radImg,[],'Xdata',angles,'Ydata',tau,'InitialMagnification','fit');
imageAxes = gca;
imageAxes.YGrid = 'on';
imageAxes.XGrid = 'on';
imageAxes.GridColor = [0, 1, 0];
imageAxes.Title.String = title;
xlabel('\theta (degrees)');
ylabel('x''');
colorbar;
iptsetpref('ImshowAxesVisible','off');
end
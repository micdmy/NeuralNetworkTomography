function [ax] = displayRadonImage ( radImg, angles, tau, ax, title )
% Displays grayscale radon image matrix in figure

axes(ax);
%daspect([1,1,1]);
iptsetpref('ImshowAxesVisible','on');
imshow(radImg,[],'Xdata',angles,'Ydata',tau,'InitialMagnification','fit');
imageAxes = gca;
set(imageAxes, 'YGrid', 'on');
set(imageAxes, 'XGrid', 'on');
%set(imageAxes, 'GridColor', [0, 1, 0]);
set(imageAxes, 'Title', text('String',title,'Color','k'));
xlabel('\theta (degrees)');
ylabel('x''');
colorbar;
iptsetpref('ImshowAxesVisible','off');
end
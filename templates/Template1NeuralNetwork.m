clc;
clear all;
input = 0 : 0.002 : 1
output = someSystem(input);

plot(input,output,'ro'); %plot training points
hiddenLayersSizes = [5, 5, 5];
net = fitnet(hiddenLayersSizes); %initialise net

net = train(net,input,output); %train net 

realInput = -1 : 0.05 : 2; %some real input values
expectedRealOutput = someSystem(realInput)

realOutput = net(realInput); % calculate real outputs using net
hold on;
plot(realInput, realOutput,'b+'); %plot calculated values
plot(realInput, expectedRealOutput, 'k'); %plot whole function as it should be
legend('training', 'calculated', 'true system function')
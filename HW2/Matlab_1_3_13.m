clear 
close all

load DataEOG.txt
%whos

x = DataEOG;
% figure(1)
% stem(x)

figure(2)
subplot(6,1,1)
length(x)
plot(x)
title('Input Signal x')

%subplot(5,1,2)
h = ones(1,11)/11;
%plot(h)

subplot(6,1,2)
y = conv(x, h);
length(y)
plot(y)
title('Output Signal y ')


subplot(6,1,3)
plot(1:length(x),x,1:length(y),y)
legend('Input signal(x)', 'Output signal(y)')
title('(c) Input(x) Output(y)')

subplot(6,1,4)
y2 = y;
y2(1:5) = [];
y2(end-4:end) = [];
length(y2)
plot(1:length(x),x,1:length(y2),y2)
legend('Input signal(x)', 'Output signal(y2)')
title('(d) Input(x) Output(y2)')

subplot(6,1,5)
h = ones(1,31)/31;
y3 = conv(x, h);
y3(1:15) = [];
y3(end-14:end) = [];
plot(1:length(x),x,1:length(y3),y3)
legend('Input signal(x)', 'Output signal(y3)')
title('(e) Input(x) Output(y3)')

subplot(6,1,6)
h = ones(1,67)/67;
y4 = conv(x, h);
y4(1:33) = [];
y4(end-32:end) = [];
plot(1:length(x),x,1:length(y4),y4)
legend('Input signal(x)', 'Output signal(y4)')
title('(f) Input(x) Output(y4)')

zoom xon

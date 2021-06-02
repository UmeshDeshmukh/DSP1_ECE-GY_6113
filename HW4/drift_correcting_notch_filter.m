close all
clear

% 2) Baseline drift correction using dc notch filter

Fs = 1000;
x = load('ecg_lfn.txt');
n = 0:length(x)-1;
figure(1)
plot(n,x)
title('input signal')
xlim([1 length(x)-1])
b = [1 -1]
a = [1 -0.95]
filter_out = filter(b,a,x)
% figure(2)
% plot(n,filter_out)
xlim([1 length(x)-1])
figure(3)
zplane(b,a)
figure(4)
freqz(b,a)
figure(5)
plot(n,x,n,filter_out)
legend('Input Signal','notch filter output')


clear 
close all 

x = load('ecg2x60.txt')
l = length(x)
n = 1:l
d = (n == 1)
Fs = 200
figure(1)
plot(n,x)
title('Original signal')
%% Second order FIR filter.
% normalized frequency w = (60/100)*Pi
k = (1/exp(2*i*0.6*pi) + 2*exp(i*0.6*pi)*cos(0.6*pi)+1)
b = [k -2*k*cos(0.6*pi) k]
a = [1]
FIR_out = filter(b, a, x)

%subplot(5,1,1)
% plot(n,FIR_out)
% title('FIR filter output')

figure(3)
zplane(b, a)
title('FIR Filter Pole Zero Plot')

imp_resp = filter(b, a, d)
figure(4)
plot(n, imp_resp)
title('FIR filter impulse response')

figure(5)
freqz(b, a)
%subplot(5,1,4)

figure(10)
plot(n,x,n,FIR_out)
legend('Input Signal','FIR filter output')
%% Second order IIR filter.
r = 0.95
k = (1 -2*r*cos(0.6*pi) + r^2)/(1 -2*1*cos(0.6*pi)+1) 
b = [k -2*k*cos(0.6*pi) k]
a = [1 -2*r*cos(0.6*pi) r^2]
IIR_out = filter(b, a, x)

% figure(6)
% plot(n,IIR_out)
% title('IIR filter output')

figure(7)
zplane(b, a)

imp_resp = filter(b, a, d)

figure(8)
plot(n, imp_resp)
title('IIR filter impulse response')

figure(9)
freqz(b, a)

figure(11)
plot(n,x,n,IIR_out)
legend('Input Signal','IIR filter output')
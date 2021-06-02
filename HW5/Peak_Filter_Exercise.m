clear
close all

n = -10:1000
d = (n==0)
%% Peak Filter Exercise
r =0.95
k = (1 -2*cos(pi*0.1)+1)/(1 -2*r*cos(pi*0.1)+r^2)
b = [1 -2*r*cos(pi*0.1) r^2]
a = [1 -2*cos(pi*0.1) 1]
figure(1)
zplane(b,a)
title('Pole Zero plot')
figure(2)
freqz(b,a)
title('Frequency Response')
ylim([-10 50])
figure(3)
impulse_resp = filter(b,a,d)
plot(n,impulse_resp)
title('Impulse Response')
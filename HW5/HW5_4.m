clear
close all

b = [-1/9 -1/9 -1/9 -1/9 1-1/9 -1/9 -1/9 -1/9 -1/9]
a = [1]

figure(1)
freqz(b,a)
figure(2)
zplane(b,a)
clear
close all

n = -10:100
d = (n==0)
%% Fourth-Order Notch Filter Exercise
Rz =1.0
Rp =0.95
r =0.99
Sampl_rt = 8000
om = (500*pi)/(Sampl_rt*0.5)

 
r = 0.95
k = (1 -2*r*cos(om) + r^2)/(1 -2*1*cos(om)+1) 
b = [k -2*k*cos(om) k]
a = [1 -2*r*cos(om) r^2]

b_final = conv(b,b)
a_final = conv(a,a)
% b = [1 -4*Rz*cos(om) 2*Rz^2*cos(2*om) -4*Rz^3*cos(om) (2*Rz^4*cos(2*om)+8*Rz^2*cos(om))]
% a = [1 -4*Rp*cos(om) 2*Rp^2*cos(2*om) -4*Rp^3*cos(om) (2*Rp^4*cos(2*om)+8*Rp^2*cos(om))]

% figure(1)
% zplane(b,a)
% 
% figure(2)
% freqz(b,a)
% 
% figure(3)
% y = filter(b,a,d)
% plot(n,y)

figure(1)
zplane(b_final,a_final)

figure(2)
freqz(b_final,a_final)

figure(3)
y = filter(b_final,a_final,d)
plot(n,y)

%% apply to audio file
[s, Fs] = audioread('clean.wav');     % speech signal

[x, Fs] = audioread('noisy.wav');     % speech signal with tonal noise
[y1, Fs] = audioread('output_IIR.wav');
N = length(x);
t = (0:N-1)'/Fs;

y2 = filter(b_final,a_final,x)
y3 = (y1-y2)
sound(y2,Fs)
audiowrite('FourthOrderOutput.wav',y2,Fs);
figure(4)
clf
plot(t, s+0.1, t, x, t,  y1 - 0.1, t, y2 - 0.2, t, y3-0.25)
xlim([0.5 0.7])
legend('Clean signal','Noisy signal', 'Filtered(second order)', 'Filtered(Fourth order)','difference between filtered signals')
xlabel('Time (sec)')
title('Tonal noise suppression by notch filtering')

orient tall
print -dpdf signals











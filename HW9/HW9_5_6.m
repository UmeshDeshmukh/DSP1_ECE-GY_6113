close all
clear
%% DSP Exercise packet problem 5.6
% x(n) = sin(2*pi*(6.3/128)*n) + 0.001*(2*pi*(56/128)*n)
L = 2^11;
N = 128;
n = 0:N-1;
x = sin(2*pi*(6.3/128)*n) + 0.001*(2*pi*(56/128)*n);
X = fft(x,L);
X_hann = x.*hann(N)';
X_hamming = x.*hamming(N)';
%%
figure(1)
subplot(4,1,1)
stem(x)
subplot(4,1,2)
%stem(X)
plot(0:1/L:1/2,20*log10(abs(X(1:L/2+1))))
subplot(4,1,3)
%stem(X_hamming)
%plot(0:1/N:1/2,20*log10(abs(X_hamming(1:N/2+1))))
stem(20*log10(abs(X_hamming(1:N/2+1))))
subplot(4,1,4)
%stem(X_hann)
plot(0:1/N:1/2,20*log10(abs(X_hann(1:N/2+1))))
% X_hann
% X_hamming
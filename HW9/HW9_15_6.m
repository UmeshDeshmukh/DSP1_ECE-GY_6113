close all
clear

N = 21;
n = 0:N-1;
j = sqrt(-1);
d = 9.3;
%w = 2*pi*[-10:10]*
H1 = exp(-j*d*2*pi*(0:N-1)/N);
H  = [H1 0 conj(H1(N-1:1))];

h = ifft(H);
figure(1)
subplot(2,1,1)
stem(real(h))
title('Real part of h(n)')
xlabel('n')
subplot(2,1,2)
stem(imag(h))
title('Imaginary part of h(n)')
xlabel('n')

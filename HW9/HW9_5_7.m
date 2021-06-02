clear 
close all

load signal2.txt
x = signal2;

X1 = fft(blackmanharris(100).*x);
X2 = fft(rectwin(100).*x);
X3 = fft(flattopwin(100).*x);
figure(1);
subplot(5,1,1)
stem(abs(20*log10(X1)));
subplot(5,1,2)
stem(abs(X2));
subplot(5,1,3)
stem(abs(fft(X3)));
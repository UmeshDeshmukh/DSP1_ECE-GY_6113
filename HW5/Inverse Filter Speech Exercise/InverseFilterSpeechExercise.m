clear 
close all

%% Inverse Filter speech exercise
%h(n)=0.3delta(n)+0.9delta(n - 500)+0.6delta(n - 1500)
b1 = 0.3
b2 = zeros(1,499);
b3 = 0.9;
b4 = zeros(1,999);
b5 = 0.6;
b = horzcat(b1,b2,b3,b4,b5);%[0.3 zeros(499) 0.9 zeros(999) 0.6];
b_flip = flip(b);
a = [1];
zplane(b,a)
[x,Fs] = audioread('distorted.wav');
%sound(x,Fs)
%% compute and play output
x_flip = flip(x);
y_flip = filter(a,b_flip,x_flip);
y = flip(y_flip);
sound(y,Fs)
audiowrite('filtered_output.wav',y,Fs)
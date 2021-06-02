
clear
close all

set(0,'DefaultAxesColorOrder',[0 0 0])  % force all plots to be black
set(0,'DefaultAxesFontSize', 8)  

%%

figure(1)
clf

x = load('signal1.txt');
Fs = 8192;
N = length(x);
t = (0:N-1)/Fs;
subplot(4,1,1)
plot(t, x)
title('signal1')
xlabel('Time (seconds)')
box off
xlim([0 N/Fs])

x = load('signal2.txt');
subplot(4,1,2)
plot(x)
title('signal2')
box off

x = load('signal3.txt');
subplot(4,1,3)
N = length(x);
t = (0:N-1)/Fs;
plot(t, x)
title('signal3')
xlabel('Time (seconds)')
box off
xlim([0 N/Fs])

x = load('signal4.txt');
subplot(4,1,4)
plot(x)
title('signal4')
box off

orient tall
print -dpdf plots1

%%

figure(2)
clf

x = signal5;
subplot(4,1,1)
plot(x)
title('signal5')
box off

[x, Fs] = wavread('arctic_a0001.wav');
N = length(x);
t = (0:N-1)/Fs;
subplot(4, 1, 2)
plot(t, x)
title('arctic\_a0001')
xlabel('Time (seconds)')
box off
xlim([0 N/Fs])

subplot(4, 1, 3)
plot(t, x)
title('arctic\_a0001 (detail)')
xlabel('Time (seconds)')
box off
xlim([0.25 0.55])


x = load('ECG_Fs256.txt');
Fs = 256;
N = length(x);
t = (0:N-1)/Fs;
subplot(4, 1, 4)
plot(t, x);
title('ECG\_Fs256.txt')
xlabel('Time (seconds)')
box off

orient tall
print -dpdf plots2


%%

figure(3)
clf

a = imread('IMG_2616.jpg');
x = rgb2gray(a);
subplot(2, 1, 1);
imagesc(x)
axis image
colormap(gray)
title('IMG\_2616.jpg')

size(x)

subplot(2, 1, 2)
plot(x(600, :))
title('Row 600 of the image')
box off


orient tall
print -dpdf plots3

    
%%

% set(0,'DefaultAxesColorOrder','remove')

set(0,'DefaultAxesFontSize', 'remove')



clear

randn('state', 0);

ecg = ecgsyn(256, 10);

%%

N = 300;

x = ecg(110+(1:N));
y = x + 0.4 * randn(N, 1);

figure(1)
clf
plot(1:N, x, 1:N, y+1)

save dataHW10_15_6.txt y -ascii 





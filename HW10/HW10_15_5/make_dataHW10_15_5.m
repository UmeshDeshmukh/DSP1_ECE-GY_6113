
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

save data_HW10_15_5.txt y -ascii 





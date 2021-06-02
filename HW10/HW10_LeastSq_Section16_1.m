close all
clear
%%
N = 7;%length of signal
lambda = 0.1; % greater than 1
v = ([1 -2 1 zeros(1, N-3)]);
D = toeplitz(v) % second order difference matrix
I = eye(N); % identity matrix of order nxn
n = 0:N-1;
in_2 = (n == 2);
in_0 = (n == 0);
in_4 = (n == 4);
in_1 = (n == 1);
in_3 = (n == 3);
%%
out_2 = (I + lambda.*transpose(D)*D)\transpose(in_2);
out_0 = (I + lambda.*transpose(D)*D)\transpose(in_0);
out_4 = (I + lambda.*transpose(D)*D)\transpose(in_4);
out_1 = (I + lambda.*transpose(D)*D)\transpose(in_1);
out_3 = (I + lambda.*transpose(D)*D)\transpose(in_3);

figure(1)
subplot(3,2,1)
stem(in_2)
title('Input signal x(n-2)')
xlim([-1,N+1])
ylim([-1,2])

subplot(3,2,3)
stem(in_0)
title('Input signal x(n-0)')
xlim([-1,N+1])
ylim([-1,2])

subplot(3,2,5)
stem(in_4)
title('Input signal x(n-4)')
xlim([-1,N+1])
ylim([-1,2])

subplot(3,2,2)
stem(out_2)
xlim([-1,N+1])
ylim([-1,2])

subplot(3,2,4)
stem(out_0)
xlim([-1,N+1])
ylim([-1,2])

subplot(3,2,6)
stem(out_4)
xlim([-1,N+1])
ylim([-1,2])

figure(2)
subplot(2,2,1)
stem(in_1)
xlim([-1,N+1])
ylim([-1,2])

subplot(2,2,3)
stem(in_3)
xlim([-1,N+1])
ylim([-1,2])

subplot(2,2,2)
stem(out_1)
xlim([-1,N+1])
ylim([-1,2])

subplot(2,2,4)
stem(out_3)
xlim([-1,N+1])
ylim([-1,2])


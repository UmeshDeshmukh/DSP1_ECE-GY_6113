clear 
close all

n = -5:5
a = 3.*(n == -2)
b = (n == 1)
c = 2.*(n == 3)

f = a-b+c

d = (n >= -4)
e = (n >= 3)

g = d-e

figure(1)
subplot(3,1,1)
stem(n,f)
title('f(n)')

subplot(3,1,2)
stem(n,g)
title('g(n)')

subplot(3,1,3)
n = -10:10
q = conv(f,g)
stem(n,q)
title('f(n)*g(n)')

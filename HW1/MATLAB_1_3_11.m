clear
close all

n = -5:15 
a = (n >= 0)
b = (n >= 5)
f = a-b
c = (n >= 10)
g = (n.*a)-(2.*n.*b)+(n.*c) 

%%
figure(1)
subplot(7,1,1)

n = -5:15
stem(n,f)
title('f(n)')
grid on

%%

subplot(7,1,2)

n = -5:15
stem(n,g)
title('g(n)')
grid on

%%

subplot(7,1,3)

n = -10:30
q = conv(f, f)
stem(n,q)
title('(a) f(n) ∗ f(n)')
grid on

%%

subplot(7,1,4)
q = conv(f, f)
q_1 = conv(q, f)
n = -15:45
stem(n,q_1)
title('(b) f(n) ∗ f(n) ∗ f(n)')
grid on
%%
subplot(7,1,5)
q = conv(f, g)
n = -10:30
stem(n,q)
title('(c) f(n) ∗ g(n)')
grid on

%%
subplot(7,1,6)
n = -5:15 
d = (n == 0)
q = conv(g, d)
n = -10:30
stem(n,q)
title('(d) g(n) ∗ δ(n)')
grid on

%%
subplot(7,1,7)
q = conv(g, g)
n = -10:30
stem(n,q)
title('(e) g(n) ∗ g(n)')
grid on
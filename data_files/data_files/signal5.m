function x = signal5

n1 = linspace(-1,1,15);
n3 = linspace(-1,1,20);

T1 = [1 0];
T3 = [4 0 -3 0];

v1 = +polyval(T1,n1);
v3 = +polyval(T3,n3);

x = [v1 v3];
L = length(x);


clear 
close all

subplot(3,2,1)
N = 5
h = ones(1,N)/N;
stem(h)
title('h (N=5)')
subplot(3,2,2)
y = conv(h,h);
stem(y)
title('y (N=5)')


subplot(3,2,3)
N = 10
h = ones(1,N)/N;
stem(h)
title('h (N=10)')
subplot(3,2,4)
y = conv(h,h);
stem(y)
title('y (N=10)')


subplot(3,2,5)
N = 20
h = ones(1,N)/N;
stem(h)
title('h (N=20)')
subplot(3,2,6)
y = conv(h,h);
stem(y)
title('y (N=2)')
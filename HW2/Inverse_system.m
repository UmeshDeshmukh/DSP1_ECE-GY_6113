% Inverse System
x= -10:10
unitstep = zeros(length(x));
subplot(3,1,1)
d = (x == 0)
u = (x >= 0)
u1 =(x >= 1)
%x1 = [zeros(9) ones(11)]
h = -1.*d + 2*(1/2).^x .*u
%g = (-1/2).^x *u - (1/2)*(1/2).^(x1).*u1
g = -1.*d + 2*(-1/2).^x.*u
y = conv(h,g)
stem(-20:20,y)
title('1.5.1')

% subplot(3,1,2)
 d1 = (x == 1)
 d2 = (x == 2)
% u =(x >= 0)
% u1=(x >= 1)
% u2=(x >= 2)
% u_1 =(x <= -1)
% u_n_1 = unitstep(x <= -1)
%  h = d + 3.5*d1 + 1.5*d2
%  g = (-6/5).*(-3).^x.*u_n_1 - (1/5)*(-0.5).^x .*u
%  y = conv(h,g)
%  stem(-20:20,y)
 
 

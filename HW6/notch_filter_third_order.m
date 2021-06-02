clear
close all

r = 0.90
Sampl_rt = 8000
om = (0.1*pi)

% k = (1 -2*r*cos(om) + r^2)/(1 -2*1*cos(om)+1) 
% b2 = [k -2*k*cos(om) k]
% a2 = [1 -2*r*cos(om) r^2]
% 
% b1 = [k -2*k*cos(om) k]
% a1 = [1 -2*r*cos(om) r^2]
z1 = exp(0.1*pi)
z2 = 0
p1 = r*exp(0.1*pi)
p2 = 0
b = [1 -(2*z1+z2) (z1^2 + 2*z1*z2) (z1^2*z2)]
a = [1 -(2p1+p2) (p1^2 + 2*p1*p2) (p1^2*p2)]
zplane(b,a)



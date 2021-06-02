close all 
clear 

% WEIGHTED LEAST SQUARE LOWPASS FILTER
% filter length
N = 31;
M = (N-1)/2;
% set band-edges and stop-band weighting
wp = 0.26*pi;
ws = 0.34*pi;
K = 10;
% normalize band-edges for convenience
fp = wp/pi;
fs = ws/pi;
% construct q(k)
q = [fp+K*(1-fs), fp*sinc(fp*[1:2*M])-K*fs*sinc(fs*[1:2*M])];
% construct Q1, Q2, Q
Q1 = toeplitz(q([0:M]+1));
Q2 = hankel(q([0:M]+1),q([M:2*M]+1));
Q = (Q1 + Q2)/2;
% construct b
b = fp*sinc(fp*[0:M]’);
% solve linear system to get a(n)
a = Q\b;
% form impulse response h(n)
h = [a(M+1:-1:2); 2*a(1); a(2:M+1)]/2;
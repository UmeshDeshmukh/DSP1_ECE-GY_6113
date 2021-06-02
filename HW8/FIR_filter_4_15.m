close all
clear 
%% 4.15 Design by DFT-based interpolation (Type II filter)
% A(2*Pi*k/N) = 1  k = 0,1,2
%             = 0  k = 3,4,5,6
N = 12;
M = (N-1)/2;
Ak = [1 1 1 0 0 0 0 0 0 0 -1 -1]; % samples of A(w)
k = 0:N-1;
W = exp(j*2*pi/N);
h = ifft(Ak.*W.^(-M*k));

figure(1)
[A,H,w] = FIR_amp_resp(h,2,12);
p = Ak.*pi;
plot(w/pi,A)
ylabel('A(\omega)')
xlabel('\omega/\pi')
title('Amplitude response of filter')
figure(2)
stem(h);
title('Impulse response of filter')
figure(3)
zplane([h],[1])

function[A,H,w] = FIR_amp_resp(h,type,L)
N = length(h);
M = (N-1)/2;
H = fft([h, zeros(1,L-N)]);
k = 0:L-1;
W = exp(j*2*pi/L);
if type == 1 || type == 2
    A = H.* W.^(M*k);
elseif type == 3 || type == 4
    A = -1j*H.* W.^(M*k);
end  
A = real(A);
w = [0:L-1]*2*pi/L;    
end

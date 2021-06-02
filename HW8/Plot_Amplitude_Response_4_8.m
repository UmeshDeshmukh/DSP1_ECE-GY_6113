close all
clear

L =512;
%% Test for Type I using the following impulse response.
N = 29;
n = 0:N-1;
wo = 0.34*pi;
h1 = (wo/pi)*sinc((wo/pi)*(n-(N-1)/2));
[A,H,w] = FIR_amp_resp(h1,1,L);
figure(1)
subplot(2,1,1)
plot(w/pi,abs(H))
ylabel('|H(\omega)| = |A(\omega)|')
xlabel('\omega/\pi')
title('Type I filter')
subplot(2,1,2)
plot(w/pi,A)
ylabel('A(\omega)')
xlabel('\omega/\pi')


%% Test for Type II using the truncated sinc function again.
N = 28;
n = 0:N-1;
wo = 0.34*pi;
h2 = (wo/pi)*sinc((wo/pi)*(n-(N-1)/2));
[A,H,w] = FIR_amp_resp(h2,2,L);
figure(2)
subplot(2,1,1)
plot(w/pi,abs(H))
ylabel('|H(\omega)| = |A(\omega)|')
xlabel('\omega/\pi')
title('Type II filter')
subplot(2,1,2)
plot(w/pi,A)
ylabel('A(\omega)')
xlabel('\omega/\pi')

%% • Test for Type IV using a differentiator with length 16
N = 8;
ntaps = 8;
L=512;
n = 0:N-1;
u = 1.55;
h4 = (-1).^(n-(N-2)/2)./(pi*(n-(N-1)/2).^2)
N2 = ntaps-1;
n2= -N2-1/2:N2-1/2;
sinc= sin(pi*(n2-u))./(pi*(n2-u))
h5 = conv(sinc,h4);
[A,H,w] = FIR_amp_resp(h5,4,L);
figure(3)
subplot(2,1,1)
plot(w/pi,abs(H))
ylabel('|H(\omega)| = |A(\omega)|')
xlabel('\omega/\pi')
title('Type IV filter')
subplot(2,1,2)
plot(w/pi,A) 
ylabel('A(\omega)')
xlabel('\omega/\pi')
% freqz(h5,[1]);

% ax=get(gcf,'Children'); %get the axes handles
% li=get(ax(1),'Children'); %get the handle for the line object in the first axe
% r=get(ax(1),'YLabel'); %get the annotation handle
% set(r,'String','Magnitude') %set the string to just Magnitude
% ydata=get(li,'Ydata'); %get the log data 
% y=10.^(ydata/20); %the conversion takes place here
% set(li,'Ydata',y); %replace the log Ydata by the linear

%% • Test for Type III using a lowpass differentiator — obtained by con-
% volving the impulse response of a Type II lowpass filter and Type IV differentiator.
h3 = conv(h2,h4);
% if length(h2)>length(h4)
%     h3 = h2 + horzcat([h4 zeros(1,length(h2)-length(h4))]);
% elseif length(h2)<length(h4)
%     h3 = h4 + horzcat([h2 zeros(1,length(h4)-length(h2))]);
% end    
[A,H,w] = FIR_amp_resp(h3,1,L);
figure(4)
subplot(2,1,1)
plot(w/pi,abs(H))
ylabel('|H(\omega)| = |A(\omega)|')
xlabel('\omega/\pi')
title('Type III filter')
subplot(2,1,2)
plot(w/pi,A)
ylabel('A(\omega)')
xlabel('\omega/\pi')


%% Amplitude Response Function
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
% 1.17 DFT and linear convolution

l1 = 8; %length of seqence g
l2 = 12;%length of seqence s
g = 10*rand(1,l1);
s = 10*rand(1,l2);

if(l1 > l2)
 s = [s zeros(1,l1-l2)];
else if(l1 > l2)
 g = [g zeros(1,l2-l1)];
 
%%

subplot(4,1,1)
stem(0:l-1,g)
title("Input signal g")
subplot(4,1,2)
stem(0:l-1,s)
title("Input signal s")
lin_conv_DFT = 0;%lin_conv_by_DFT(g,s);
subplot(4,1,3)
stem(0:length(lin_conv_DFT)-1,lin_conv_DFT)
title("Linear convolution by DFT")
lin_conv_out = 0;%lin_conv(g,s);
subplot(4,1,4)
stem(0:length(lin_conv_out)-1,lin_conv_out)
title("Linear convolution")

% function out = lin_conv(x,y)
% out = conv(x,y);
% end 

% function out = lin_conv_by_DFT(x,y)
% out = ifft(fft(x).*fft(y));
% end 


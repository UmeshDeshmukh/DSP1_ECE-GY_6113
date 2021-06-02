% 1.16 DFT and circular convolution.
l = 8; %length of seqences
g = 10*rand(1,8)
s = 10*rand(1,8)

subplot(4,1,1)
stem(0:l-1,g)
title("input signal g")
subplot(4,1,2)
stem(0:l-1,s)
title("input signal s")
circ_conv_DFT = circ_conv_by_DFT(g,s);
subplot(4,1,3)
stem(0:length(circ_conv_DFT)-1,circ_conv_DFT)
title("circular convolution by DFT")
circ_conv_out = circ_conv(g,s,l);
subplot(4,1,4)
stem(0:length(circ_conv_out)-1,circ_conv_out)
title("circular convolution")

function out = circ_conv_by_DFT(x,y)
out = ifft(fft(x).*fft(y));
end 

function out = circ_conv(x,y,len)
out = cconv(x,y,len);
end 
  
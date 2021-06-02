
clear


%% Load data

[sig, fs] = audioread('Recorded_Audio_Clip_16b_PCM.wav');

N = 1000;
x = 3*sig(20000+(1:N));            % x: signal
n = 0:N-1;


%% Create clippped signal 

T = 0.2;
k = abs(x) > T;            % k: logical vector
L = nnz(k);                % L: number of missing samples

y = x;                     % y: clipped (incomplete) signal
y(k) = nan;

%% Plots

figure(1)
clf
subplot(2,1,1)
plot(x)
title('Speech waveform');

subplot(2,1,2)
plot(y);
title(sprintf('Incomplete signal with %d missing samples', L));

%%

save data.txt y -ascii 





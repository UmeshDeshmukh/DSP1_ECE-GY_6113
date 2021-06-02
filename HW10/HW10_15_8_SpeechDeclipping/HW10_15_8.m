%% Speech de-clipping
% Estimate clipped speech waveform by least squares
%
%  Ivan Selesnick
% selesi@poly.edu

%% Start

clear
close all

%% Load data

load data_HW10_15_8.txt;
whos

y = data_HW10_15_8;                   % y : data value

N = length(y);
n = 1:N;

figure(1)
clf
subplot(2,1,1)
plot(y)
title('Clipped speech waveform');
xlabel('Time (samples)')
ylim([-0.5 0.5])



%% Define matrix D
% D represents the third-order derivitive
% (3rd-order difference).
% D is defined as a sparse matrix so that Matlab
% subsequently uses fast solvers for banded systems.

e = ones(N, 1);
D = spdiags([e -3*e 3*e -e], 0:3, N-3, N);

%%
% Fist corner of D:

full(D(1:6, 1:6))

%%
% Last corner of D:

full(D(end-5:end, end-5:end))

%% Define matrices S and Sc

k = isfinite(y);                    % k : logical vector, indexes known values

S = speye(N);
S(~k, :) = [];                      % S : sampling matrix

Sc = speye(N);                      % Sc : complement of S
Sc(k, :) = [];

L = sum(~k)                         % L : number of missing values

%% Estimate missing data
% Least square estimation of missing data.
% Note that the system matrix is banded so the system
% equations can be solved very efficiently with a fast banded system solver.
% By defining S and D as sparse matrices, Matlab calls a fast
% banded system solver by default.

v = -(Sc * (D' * D) * Sc') \ ( Sc * D' * D * S' * y(k));    % v : estimated samples   

%% Fill in unknown values
% Place the estimated samples into the signal.

x = zeros(N,1);
x(k) = y(k);
x(~k) = v;

% The above 3 lines is a more direct way to implement: 
% x = Sc' * v + S'*y(k);    

figure(1)
clf
subplot(2, 1, 1)
plot(n, y, 'k', n(~k), x(~k) ,'k.')
legend('Known data', 'Estiamted data')
title('Estimated values')

subplot(2, 1, 2)
plot(n, x )
title('Final signal')


%% Banded matrix visualization
% As noted above, the system matrix is banded.
% This can be visualized with the 'spy' command in Matlab:

G = Sc * (D' * D) * Sc';

figure(1)
clf
spy(G)
title('Visualization of banded matrix')

% It can be seen that all the non-zero elements of G lie near the diagonal.

%% Plot

figure(1)
clf
subplot(3, 1, [1 2])

plot(n, x, 'r', n, y, 'blue', 'linewidth', 2)
legend('Reconstructed', 'Clipped data', 'location', 'NorthOutside')

print -dpdf declipping_figure



%% Figures to save

% addpath ../extra_functions
% MyGraphPrefsON

figure(3)
clf

YL1 = [-0.5 0.65];

subplot(3, 1, 1)
plot(n, y)
title(sprintf('Clipped speech with %d missing samples', L));
box off
ylim(YL1)
set(gca, 'xtick', 0:100:N);

subplot(3, 1, 2)
plot(n, y, 'k', n(~k), x(~k) ,'k.')
title('Estimated samples');
box off
ylim(YL1)
set(gca, 'xtick', 0:100:N);

subplot(3, 1, 3)
plot(n, x)
title('Final output');
box off
ylim(YL1)
xlabel(' ')
set(gca, 'xtick', 0:100:N);

set(gcf, 'PaperPosition',[1 1 3.8 2.8*PH])

print -deps fig1

%%

figure(2)
clf
subplot(3, 1, [1 2])

plot(n, x, 'red', n, y, 'blue', 'linewidth', 1)
legend('Filled in (red)', 'Clipped data (blue)', 'location', 'NorthOutside')
xlabel(' ')
set(gca, 'xtick', 0:100:N);
box off
set(gcf, 'PaperPosition',[1 1 3.8 2*PH])
ylim([-0.5 0.7])

print -depsc fig2

%%

% MyGraphPrefsOFF

%%



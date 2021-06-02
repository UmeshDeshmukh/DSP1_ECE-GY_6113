%% Least squares smoothing 
% This example illustrates smooth a noisy ECG waveform
% by least squares.
% This approach regularizes the energy of the second-order derivative.
%
%  Ivan Selesnick
% selesi@poly.edu

%% Start

clear
close all

%% Load data

load data_HW10_15_5.txt;
whos

y = data_HW10_15_5;         % data value
N = length(y);

%% Display data

figure(1)
clf
plot(y)
title('Data')

%% Smoothing (degree = 2)
% D is the second-order difference matrix.
% It approximates the second-order derivative.
% In order to exploit fast banded solvers in Matlab,
% we define D as a sparse matrix using 'spdiags'.

e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N-2, N);
full(D(1:5, 1:5))
full(D(end-4:end, end-4:end))
%% Smoothing (degree = 3)
D3 = spdiags([e -3*e 3*e -e], 0:3, N-3, N);
full(D3(1:6, 1:6))
full(D3(end-5:end, end-5:end))

%%
% Solve the least square problem for second order 

lam1 = 50;
lam2 = 100;
lam3 = 500;
lam4 = 30000;
F1 = speye(N) + lam1 * D' * D;            % F is a banded matrix
F2 = speye(N) + lam2 * D' * D; 
F3 = speye(N) + lam3 * D' * D;
F4 = speye(N) + lam4 * D' * D;
x1 = F1 \ y;                              % Matlab uses a fast solver for banded systems)
x2 = F2 \ y;
x3 = F3 \ y;
x4 = F4 \ y;
% figure(1)
% plot(x)
% % Solve the least square problem for third order 

% lam = 50;
% F3 = speye(N) + lam * D3' * D3;            % F is a banded matrix
% x3 = F3 \ y;                              % Matlab uses a fast solver for banded systems)

%% Figures to file


% addpath ../extra_functions
% MyGraphPrefsON

PH = 1.5;       % plot height

YL1 = [-0.5 1.8];

figure(1)
clf

subplot(5, 1, 1)
plot(y)
box off
title('Noisy data');
ylim(YL1)

subplot(5, 1, 2)
plot(x1)
box off
title('Least squares smoothing second order, {\lambda}= 50');
xlabel(' ')
ylim(YL1)

subplot(5, 1, 3)
plot(x2)
box off
title('Least squares smoothing second order, {\lambda}= 100');
xlabel(' ')
ylim(YL1)

subplot(5, 1, 4)
plot(x3)
box off
title('Least squares smoothing second order, {\lambda}= 500');
xlabel(' ')
ylim(YL1)

subplot(5, 1, 5)
plot(x4)
box off
title('Least squares smoothing second order, {\lambda}= 30000');
xlabel(' ')
ylim(YL1)




set(gcf, 'PaperPosition',[1 1 3.3 2*PH])

print -deps fig1

% MyGraphPrefsOFF


%% Smoothing (degree = 3)

% if 0
%     figure(5)
%     D = spdiags([e -3*e 3*e -e], 0:3, N-3, N);
%     
%     full(D(1:6, 1:6))    
%     full(D(end-5:end, end-5:end))
%         
%     lam = 105;    
%     F = speye(N) + lam * D' * D;
%     x = F \ y;
%     
%     figure(1)
%     plot(x)
    
% end
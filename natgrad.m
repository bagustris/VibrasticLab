% natgrad.m : basic Bell-Sejnowski ICA algorithm demonstrated on 2 speech signals.
% the default value of each parameter is given in [] brackets.
% modified rom the book ICA Tutorial by J.V. Stone
% bagustris@yahoo.com

clear all; close all; clc;
% [0] Set to 1 to hear signals.
listen=0; % set to 1 if have audio.

% [1] Set random number seed.
seed=9; rand('seed',seed); randn('seed',seed);

% [2] M = number of source signals and signal mixtures.
M= 2;
% N = number of data points (samples) per signal.
N= 1e4;

% Load data, each of M=2pi rows contains a different source signal.
% Each row has N columns (signal values).
% Load standard matlab sounds (from MatLab's datafun directory)
% Set variance of each source to unity.
load chirp; s1=y(1:N);
load gong; s2=y(1:N);

s1=s1/std(s1);
s2=s2/std(s2);

% Combine sources into vector variable s.
s=[s1,s2]';
% Make new mixing matrix.
A=randn(M,M)';
% Listen to speech signals ...
% Fs (sample rate) is obtained from data.

if listen 
    soundsc(s(:,1),Fs); 
    soundsc(s(:,2),Fs);
end;

% Plot histogram of each source signal
% this approximates pdf of each source
figure(1); hist(s(1,:),50); drawnow;
figure(2); hist(s(2,:),50); drawnow;

% Make M mixures x from M source signals s.
x = A*s;

% Listen to signal mixtures signals ...
if listen 
    soundsc(x(1,:),Fs); 
    soundsc(x(2,:),Fs); 
end;

% Initialise unmixing matrix W to identity matrix.
W = eye(M,M);
% Initialise y, the estimated source signals.
y = W*x;
% Print out initial correlations between
% each estimated source y and every source signal s.
r=corrcoef([y; s]');
fprintf('Initial correlations of source and extracted signals\n');
rinitial=abs(r(M+1:2*M,1:M))

%% Natural gradient
% define iterations parameters
maxiter=100; % [100] Maximum number of iterations.
eta=0.25; % [0.25] Step size for gradient ascent.
% Make array hs to store values of function and gradient magnitude.
hs=zeros(maxiter,1);
gs=zeros(maxiter,1);

% Begin gradient ascent on h ...
for iter=1:maxiter
% Get estimated source signals, y.
y = W*x; % wt vec in col of W.
% Get estimated maximum entropy signals Y=cdf(y).
Y = tanh(y);
% Find value of function h.
detW = abs(det(W));
h = ( (1/N)*sum(sum(Y)) + 0.5*log(detW) );
% Find matrix of gradients @h/@W_ij ...
g = inv(W') - (2/N)*Y*x';
% Update W to increase h ...
W = W + eta*g;
% Record h and magnitude of gradient ...
hs(iter)=h; 
gs(iter)=norm(g(:));
end;

% Plot change in h and gradient magnitude during optimization.
figure(3); plot(hs); title('Function values - Entropy');
xlabel('Iteration');ylabel('h(Y)');
figure(4);plot(gs);title('Magnitude of Entropy Gradient');
xlabel('Iteration');ylabel('Gradient Magnitude');

% Print out final correlations ...
r=corrcoef([y; s]');
fprintf('Final correlations between source and extracted signals ...\n');
rfinal=abs(r(M+1:2*M,1:M))

% Plot to extracted signals ...
figure(5);
subplot(211); plot(y(1,:)); 
subplot(212); plot(y(2,:));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EOF
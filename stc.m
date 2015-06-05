% Transmission Loss of Muffler
clear all; close all; clc;

rho=6; c= 486; % c [m/s] rho dihitung utk F=600 Fahrenheit

% cross-sectional area of pipe
a1=0.025;    s1=pi*a1^2;   % m
a2=0.055;    s2=pi*a2^2;
a3=0.025;    s3=pi*a3^2;

L1=0.5; % m
L2=0.15;
L3=0.1;

freq=linspace(1,11000,1000);

for ii=1:1000
    w=freq(ii); 
    k=w/c;
    f(ii)=w/(2*pi);
    
    % with muffler
    Tout=[1; 1]; % dummy value
    
    T1=[cos(k*L1)   j*rho*c/s1*sin(k*L1); j*s1/(rho*c)*sin(k*L1)  cos(k*L1)];
    T2=[cos(k*L2)   j*rho*c/s2*sin(k*L2); j*s2/(rho*c)*sin(k*L2)  cos(k*L2)];
    T3=[cos(k*L3)   j*rho*c/s3*sin(k*L3); j*s3/(rho*c)*sin(k*L3)  cos(k*L3)];
    
    T_tot_1= T1 * T2 * T3;
    
    Tin= T_tot_1*Tout;
    
    Powin(ii)= 0.5 * Tin (1,1) * Tin (2,1);
    Powout(ii)= 0.5 * Tout (1,1) * Tout (2,1);    
end

loss = -10*log10(Powout./Powin);

plot(f, loss)
xlabel('Frequency [Hz]')
ylabel('dB')
title('Transmission Loss')
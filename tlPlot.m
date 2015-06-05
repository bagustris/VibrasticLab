% transmission loss
clear all; clc

rho=0.6; c=486; %c[m/s] and rho have been computed
                %for a temperature of 600 fahrenheit
%cross-sectional area of pipe
a1=0.025;S1=pi*a1^2; %m
a2=0.055;S2=pi*a2^2; %m
a3=0.025;S3=pi*a3^2; %m
L1=0.5;L2=0.15; L3=0.1; %m

freq=linspace(1,11000,1000);
for ii=1:1000
    w=freq(ii);k=w/c;
    f(ii)=w/(2*pi);
    
    %with muffler
    Tout = [1;1]; %dummy values which don'nt influence
                  % the final result of the tranmission loss
    T1=[cos(k*L1) j*rho*c/S1*sin(k*L1); j*S1/rho/c*sin(k*L1) cos(k*L1) ];
    T2=[cos(k*L2) j*rho*c/S1*sin(k*L2); j*S2/rho/c*sin(k*L2) cos(k*L2) ];
    T3=[cos(k*L3) j*rho*c/S3*sin(k*L3); j*S1/rho/c*sin(k*L3) cos(k*L3) ];
    
    T_tot_1=T1*T2*T3;
    
    Tin=T_tot_1*Tout;
    
    Powin(ii)=.5*Tin(1,1)*Tin(2,1);
    Powout(ii)=.5*Tout(1,1)*Tout(2,1);
end
loss=-10*log10(Powout./Powin);

plot(f,loss)
xlabel('frequency[Hz]')
ylabel('dB')
title('Trasmission Loss')

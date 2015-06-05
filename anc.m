% plot sederhana untuk active noise cancellation
clear all;

x = linspace(0,4*pi,100);

% Define y as the sine function evaluated at the values in x.

y1 = 0.5*sin(x);
y2 = 0.5*sin(x-pi);
y3 = y1 + y2;


figure(1);
plot(x,y1,x,y2,x,y3)
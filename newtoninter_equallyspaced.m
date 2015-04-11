function run_newtoninter_equallyspaced
% Date: Feb 2007
% Author: Naotoshi Seo <sonots(at)umd.edu>

% sampling points: eqaully spaced
a = -1; b = 1;
n = 10;
h = (b-a)/(n-1);
x = a + (0:n-1)*h;

% interpolation points: eqaully spaced
n = 50;
h = (b-a)/(n-1);
p = a + (0:n-1)*h;

% (1) f(x) = exp(x)
y = exp(x);
truth = exp(p);
f = newtoninter(x,y,p);

hold on;
plot(x,y,'ob');
plot(p,truth,'-b');
plot(p,f,'-r');
title('Newton Interpolation: Uniform spaced nodes');
legend('samples', 'truth', 'interpolation');

% (2) f(x) = 1 / (1 + 25 * x^2)
figure;
y = 1 ./ (1 + 25 .* x.^2);
truth = 1 ./ (1 + 25 .* p.^2);
f= newtoninter(x,y,p);

hold on;
plot(x,y,'ob');
plot(p,truth,'-b');
plot(p,f,'-r');
title('Newton Interpolation: Uniform spaced nodes');
legend('samples', 'truth', 'interpolation');
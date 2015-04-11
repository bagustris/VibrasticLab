function [f, a, d] = newtoninter(x, y, p)
% Newton interpolation
%
%  [f a d] = newtoninter(x, y, p)
%
% Input arguments ([]s are optional):
%  x   (vector) of size 1xN which contains the interpolation nodes.
%  y   (vector) of size 1xN which contains the function values at x
%  p   (vector) of size 1xP which contains points to be interpolated. 
%
% Output arguments ([]s are optional):
%  f   (vector) of size 1xP. The result of interpolation respect to p.
%  [a] (vector) of size 1xN which is leading coefficients genereated by 
%       divided difference method.
%  [d] (matrix) of size NxN (triangular) which is the result of the 
%       divided difference method
%
% Example
% >> x=[1,2,4,7,8]
% >> y=exp(x);
% >> [f a d]= newtoninter(x, y, 5)
%
% Author: Naotoshi Seo <sonots(at)umd.edu>
% Date  : Feb 2007

n = length(x);
d(:,1)=y';
for j=2:n
    for i=j:n
        d(i,j)= ( d(i-1,j-1)-d(i,j-1)) / (x(i-j+1)-x(i));
    end
end
a = diag(d)';

Df(1,:) = repmat(1, size(p));
c(1,:) = repmat(a(1), size(p));
for j = 2 : n
   Df(j,:)=(p - x(j-1)) .* Df(j-1,:);
   c(j,:) = a(j) .* Df(j,:);
end
f=sum(c);
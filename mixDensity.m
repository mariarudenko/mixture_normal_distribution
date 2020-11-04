function f=mixDensity(x, w, a, sigma)
% MIXDENSITY Return value of mixture of normal density
% 
%  Syntax: f=mixDensity(x, w, a, sigma)
%  Input:
%    x - any real number;
%    a - expectation;
%    sigma - dispersion;
%  Output:
%    f - value of mixture of normal density.
%
[m,k]=size(w);
f=0;
for i=1:k
    f=f+w(i)*normalDensity(x,a(i),sigma(i));
end
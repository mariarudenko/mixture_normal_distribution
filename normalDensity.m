function p=normalDensity(x,a,sigma)
% NORMALDENSITY Return value of normal density
% 
%  Syntax: p=normalDensity(x,a,sigma)
%  Input:
%    x - any real number;
%    a - expectation;
%    sigma - dispersion;
%  Output:
%    p - value of normal density.
%
p=(1/(sigma*sqrt(2*pi)))*exp(-((x-a)^2)/(2*sigma^2));
function p=normalDensityMatrix(X, a, sigma)
% NORMALDENSITYMATRIX Calculate values of jth density in ith component of
% sample
%
%  Syntax: p=normalDensityMatrix(X, k, a, sigma)
%  Input:
%    X - sample;
%    a - vector of expectation;
%    sigma - vector of dispersion;
%  Output:
%    p - matrix of values of normal densities.
%

[m,n]=size(X);
[m,k]=size(a);
for i=1:n
    for j=1:k
        p(i,j)=normalDensity(X(i),a(j),sigma(j));
    end
end

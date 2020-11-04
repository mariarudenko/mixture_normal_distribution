function [w, a, sigma]=mixOptimization(X,k)
% MIXOPTIMIZATION Optimize of parameters of mixture of normal
% distributions
%
%  Syntax:
%    [w,theta]=mixOptimization(k)
%
%  Description:  
%    MIXOPTIMIZATION returns optimal parameters of mixture of normal
%    distributions.
%  
%  Input:
%    X - sample;
%    k - number of components of mixture;
%  Output:
%    w - probability of jth component of mixture, j=1:k;
%    a - vector of expectation;
%    sigma - vector of dispersion.
%
%  This function implements the expectation-maximization algorithm(EM)
%

[m,n]=size(X);
eps=10^(-3);
delta=1;

% initial values of parameters
for j=1:k
    a(j)=rand;
    sigma(j)=rand+1;
    w(j)=rand;
end
w=w/sum(w,2);

% initial values of jth density in ith component of sample
p=normalDensityMatrix(X, a, sigma);
% initial values of hidden variables
for i=1:n
    for j=1:k
        g(i,j)=(w(j)*p(i,j))/sum(w.*p(i,1:k),2);
    end
end

% iteration procedure
while delta>eps
    w=(1/n)*sum(g);
    [a, sigma]=calculateNewParam(a, sigma, X, g);
    p=normalDensityMatrix(X, a, sigma);
    for i=1:n
        for j=1:k
            g0(i,j)=g(i,j);
            g(i,j)=(w(j)*p(i,j))/sum(w.*p(i,1:k),2);
        end
    end
    delta=max(max(abs(g-g0)));
end


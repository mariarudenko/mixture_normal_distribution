function f=weightedLikelihood(gColumn, X, a, sigma)
% WEIGHTLIKELIHOOD Calculate value of function of weighted likelihood
%
%  Syntax: f=weightedLikelihood(gColumn, X, a, sigma)
%  Input:
%    gColumn - weight;
%    X - sample;
%    a - expectation;
%    d - dispersion;
%    a0 - initial expectation;
%    d0 - initial dispersion;
%  Output:
%    f - value of likelihood function.
%


[m,n]=size(X);

for i=1:n
%     lnPhi(i)=log(normalDensity(X(i),a,sigma));
    lnPhi(i)=log(sigma)+(X(i)-a)^2/(2*sigma^2);
end

f=lnPhi*gColumn;
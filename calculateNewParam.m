function [a,sigma]=calculateNewParam(a0, sigma0, X, g)
% CALCULATENEWPARAM Find optimal parameters of weighted likelihood
%
%  Syntax: [a,sigma]=calculateNewParam(a0, sigma0, X, g)
%  Input:
%    a0 - initial value of vector of expectation;
%    sigma0 - initial value of vector of dispersion;
%    X - sample;
%    g - matrix of hidden variables;
%  Output:
%    a - optimal vector of expectation;
%    sigma - optimal vector of dispersion;
%

options=optimset('fmincon')
options=optimset('MaxIter',3)
[n,k]=size(g);
A=[-1 0;0 -1];
b=[0;-0.001];

for j=1:k
    x0=[a0(j),sigma0(j)];
    x=fmincon(@(x) weightedLikelihood(g(1:n,j), X, x(1), x(2)),x0, A, b,...
        [],[],[],[],[],options);
    a(j)=x(1);
    sigma(j)=x(2);
end



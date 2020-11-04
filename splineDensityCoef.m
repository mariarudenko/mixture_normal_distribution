function [pp,xmin,xmax]=splineDensityCoef(X)
% SPLINEDENSITYCOEF Return the ppform of a cubic spline reconstructing
% density.
%
%  Syntax: f=splineDensity(X)
%  Input:
%    X - sample;
%  Output:
%    pp - ppform of a cubic spline.
%

[m,n]=size(X);
X=sort(X); %sorting in ascending order
k=floor(1+log2(n));
h=(X(n)-X(1))/k; %step
xmin=X(1)-h/2;
xmax=X(n)+h/2;
Z(1)=X(1);
for j=1:k
    Z(j+1)=Z(j)+h; %edge of histogram
    z(j)=(Z(j)+Z(j+1))/2; %midpoints
    w(j)=0;
end
z=[xmin,z,xmax]; %set of points for interpolation

for i=1:n
    for j=1:k
        if X(i)>=Z(j) && X(i)<=Z(j+1)
            w(j)=w(j)+1; %frequency
        end
    end
end
w=w/n;
y=[0,w,0];
pp=csaps(z,y,1);
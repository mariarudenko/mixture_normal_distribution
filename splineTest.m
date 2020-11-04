% X=densityTest;
% clear x y
[pp,xmin,xmax]=splineDensityCoef(X);
S=quad(@ppval, xmin, xmax,[],[],pp);
% for i=1:10*(xmax-xmin)+1
%     x(i)=xmin+0.1*(i-1);
%     y(i)=(1/S)*ppval(pp,x(i));
% end
pp.coefs=(1/S)*pp.coefs;
fnplt(pp,'g')
% hold on
% plot(x,y,'r')
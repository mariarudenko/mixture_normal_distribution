% Sample
N=1000
a0=[2 3 7];
sigma0=[1 3 4];
w0=[0.2 0.5 0.3];
N1=200
N2=500
N3=300
arr1=sigma0(1)*randn(1,N1)+a0(1)
arr2=sigma0(2)*randn(1,N2)+a0(2)
arr3=sigma0(3)*randn(1,N3)+a0(3)
X=[arr1,arr2,arr1]
% Reconstruction of density
k=3;
[w, a, sigma]=mixOptimization(X,k)

for i=1:291
    x(i)=-10+0.1*(i-1);
    y(i)=mixDensity(x(i), w, a, sigma);
end
hold on
plot(x,y)
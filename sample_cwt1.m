function sample_cwt1()
x=zeros(1,1000);

K=500;
N=200;
h=0.03;
v=0:h:h*2*N;
x(K-N:K+N)=x(K-N:K+N)+sin(v.^2);

K=500;
N=200;
w1=0.1; w2=0.1; w3=100;
[t,tt,z]=mycwt(x(K-N:K+N),1,w1,w2,w3,'mymorlet',1);
figure(2);
plot((w1:w2:w3),abs(z(:,N)),'.-');
function sample_cwt()
x=zeros(1000,1);
N = 200;
w1=0.1; w2=0.1; w3=100;
x(500-N:500+N)=sin(0:0.1:0.1*2*N).*exp(-(-N:N).^2/8000);
[t,tt,z]=mycwt(x(500-N:500+N),1,w1,w2,w3,'mymorlet');
figure(2);
plot((w1:w2:w3),abs(z(:,N)),'.-');
function test_mycwt()
x=sin((1:1000)/10);
N=100;
z=zeros(1,N);
for a=1:N,
    y=mymorlet(-4:0.018+0.000003*a:4);
    y1=real(y);
    y2=imag(y);
    z(a) = (x(1:length(y))*y1')^2+(x(1:length(y))*y2')^2;
end
plot(z);

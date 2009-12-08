function test_mycwt()
x=sin((1:1000)/10);
N=100;
t0=20;
z=zeros(1,N);
for a=1:N,
    y=mymorlet(-4:0.01805+0.000001*a:4);
    y1=real(y);
    y2=imag(y);
    z(a) = (x(1+t0:length(y)+t0)*y1')^2+(x(1+t0:length(y)+t0)*y2')^2;
end
plot(z);

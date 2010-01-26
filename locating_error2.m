function locating_error2()
step=10;
x=real(mymorlet(-(2^8-1)/step:1/step:(2^8)/step));
s1=2*pi/(1.1774*step);
s2=2*pi/(1.1387*step);
s3=2*pi/(1.1887*step);
y1=exp((s1:s1:s1*2^9)*i);
y2=exp((s2:s2:s2*2^9)*i);
y3=exp((s3:s3:s3*2^9)*i);
w1=200;
w2=300;
subplot(3,1,1);
plot(x(w1:w2),'.-');
subplot(3,1,2);
plot(real(y1(w1:w2)),'.-');
subplot(3,1,3);
plot(real(y2(w1:w2)),'.-');
disp([(x*real(y1)')^2+(x*imag(y1)')^2,...
    (x*real(y2)')^2+(x*imag(y2)')^2,...
    (x*real(y3)')^2+(x*imag(y3)')^2,...
    ])

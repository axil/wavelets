function locating_error2()
deg=8;
step=2*pi*10/1.1387;
x=mymorlet(-(2^deg-1)/step:1/step:(2^deg)/step);

s1=2*pi/(1.1774*step);
s2=2*pi/(1.1387*step);
s3=2*pi/(1.1887*step);

y1=exp((s1:s1:s1*2^(deg+1))*i);
y2=exp((s2:s2:s2*2^(deg+1))*i);
y3=exp((s3:s3:s3*2^(deg+1))*i);

w1=length(x)/2-250;
w2=length(x)/2+250;

subplot(3,1,1);
plot(real(x(w1:w2)),'.-');
subplot(3,1,2);
plot(real(y1(w1:w2)),'.-');
subplot(3,1,3);
plot(real(y2(w1:w2)),'.-');

disp([(real(x)*real(y1)')^2+(imag(x)*real(y1)')^2,...
    (real(x)*real(y2)')^2+(imag(x)*real(y2)')^2,...
    (real(x)*real(y3)')^2+(imag(x)*real(y3)')^2,...
    ])

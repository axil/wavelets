function locating_error1()
x=real(mymorlet(-(2^17-1)/10:1/10:2^17/10));
s1=1/(2*pi)*1.1774*10;
s2=1/(2*pi)*1.1387*10;
s3=(s1+s2)/2;
y1=exp((s1:s1:s1*2^18)*i);
y2=exp((s2:s2:s2*2^18)*i);
y3=exp((s3:s3:s3*2^18)*i);
(x*real(y1)')^2+(x*imag(y1)')^2
(x*real(y2)')^2+(x*imag(y2)')^2
(x*real(y3)')^2+(x*imag(y3)')^2

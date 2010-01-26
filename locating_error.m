function locating_error()
x=real(mymorlet(-(2^17-1)/7:1/7:(2^17)/7));
s1=1/(2*pi)*1.1774*7;
s2=1/(2*pi)*1.1387*7;
y1=exp((s1:s1:s1*2^18)*i);
y2=exp((s2:s2:s2*2^18)*i);
(x*real(y1)')^2+(x*imag(y1)')^2
(x*real(y2)')^2+(x*imag(y2)')^2

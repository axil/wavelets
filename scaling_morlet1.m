function scaling_morlet()

y=cos((1:10000)/10);
%y=imag(mymorlet(-4:0.01:4));
c=zeros(size(1:501));
i=1;
m1=2*pi*10/1.1774;%53.3649;
m3=2*pi*10/1.1387;%55.1786;
m2=m3-m1;
m=m1:m2:m3;
for x=m1:m2:m3,
  z=mymorlet(-10:1/x:10);
%  subplot(2,1,1);
%  plot(z);
%  subplot(2,1,2);
%  plot(y(1:length(z)));
  c(i)=1/x*((y(1:length(z))*real(z)')^2+(y(1:length(z))*imag(z)')^2);
  i=i+1;
end
c(1:2)
plot(m,c(1:length(m)))
    
    
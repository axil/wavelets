function scaling_morlet()

yr=cos((1:10000)/10);
yi=sin((1:10000)/10);
%y=imag(mymorlet(-4:0.01:4));
c=zeros(size(1:501));
i=1;
m1=55.17;
m2=0.0001;
m3=55.18;
m=m1:m2:m3;
for x=m1:m2:m3,
  z=imag(mymorlet(-10:1/x:10));
%  subplot(2,1,1);
%  plot(z);
%  subplot(2,1,2);
%  plot(y(1:length(z)));
  c(i)=(yr(1:length(z))*z')^2+(yi(1:length(z))*z')^2;
  i=i+1;
end
plot(m,c(1:length(m)))
    
    
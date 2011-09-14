function cross()

f=[zeros(1,50) sin(0:0.1:3.14).^2 zeros(1,50) sin(0:0.3:3.14).^2/10 zeros(1,50)];
%K=500;
%N=200;
%w1=0.1; w2=0.1; w3=100;
%[t,tt,z]=mycwt(x,1,w1,w2,w3,'mymorlet',1);

c = zeros(300, 100);
for i=1:100,
    x = -i:i;
    g = exp(-x.^2);
    c(100-floor(length(g)/2) : 100+length(f)+floor(length(g)/2)-1, i) = conv(f, g);
end
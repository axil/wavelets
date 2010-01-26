function test_morl1()

q = -4:0.03:4;
w1 = real(mymorlet(q))';
w2 = imag(mymorlet(q))';
x = 1:length(q);

dT = 0.005;
range = 1:1:3000;
r = zeros(1,length(range));

for T = range,
    y = sin(x/(dT*T));
    r(T) = (y*w1)^2 + (y*w2)^2;
end

plot(dT*range,r);
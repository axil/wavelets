function locating_error5()
m = real(mymorlet(-100:0.1/(20*pi):100));
plot(abs(fft(real(m))));
%m = real(mymorlet(-100:1/(20*pi):100));
%plot(abs(fft(real(m))));
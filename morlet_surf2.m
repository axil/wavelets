function morlet_surf2()
xrange=0.01:0.002:0.1;
yrange=0.1:0.003:1;
z=zeros(length(yrange),length(xrange));
xc = 1;
for x = xrange,
    yc = 1;
    for y = yrange,
        m = real(mymorlet(-4:y/(20*pi):4));
%        z(yc,xc)=length(m);
        z(yc, xc) = (sin(x:x:length(m)*x) * m')^2+...
            (cos(x:x:length(m)*x) * m')^2;
%        disp([x,y,length(m),z(yc,xc)]);
        yc = yc + 1;
    end
    xc = xc + 1;
end
surf(z);
        
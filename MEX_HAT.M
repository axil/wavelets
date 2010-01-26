function y=mex_hat(x)
%Generates the ''Mexican hat'' (1-x.^2).*exp(-x.^2/2)
y=(1-x.^2).*exp(-x.^2/2);
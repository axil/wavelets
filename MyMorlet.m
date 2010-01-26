function y=morlet(x)
%Generates the ''Morlet wavelet'' 
%pi^(-.25)*(exp(-(j*f*x))-exp(-(f*f)/2)).*exp(-(x.*x)/2), 
%f=pi*sqrt(2/log(2))
f=pi*sqrt(2/log(2));
y=pi^(-.25)*(exp(-(j*f*x))-exp(-(f*f)/2)).*exp(-(x.*x)/2);
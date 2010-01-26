%Demo of Continuous Wavelet Reco. function-file!
%Call: [t,reco,matrix]=myicwt(matrix,T,start,step,stop);
%T: Sampling distance
%start: smallest scale factor,
%step: scale increment, 
%stop: biggest scale factor
%All scale factors are multiples of T!
%Return values: t: time vector; reco: reconstructed signal; matrix: Sampled CWT
%Last modified: 07.02.04, H.-G. Stark

function [t,reco,matrix]=myicwt(matrix,T,start,step,stop)
close all;

%Preparations
wav=input('Enter wavelet (in quotes): ');
rows=size(matrix,1);
N=size(matrix,2);

%Generation of symmetric time vectors
if floor(N/2)==(N/2),
    t=(-floor(N/2):(floor(N/2)-1))*T; 
else 
    t=(-floor(N/2):(floor(N/2)))*T; 
end

%Initialization of scale factors
a=(start:step:stop)*T;

%Search for non-zero divisor
i=1;
psi_scale=conj(feval(wav,-t./a(i)));      
psi_scale_hat=fft(psi_scale);
check=sum(psi_scale_hat==0);
while((check~=0)&&(i<rows)), 
    i=i+1; 
    psi_scale=conj(feval(wav,-t./a(i)));      
    psi_scale_hat=fft(psi_scale);
    check=sum(psi_scale_hat==0);
end

%Computation of reconstructed signal
B=fft(matrix(i,:));
recoft=sqrt(a(i))*(B./psi_scale_hat);
%Sampling circular frequency
oms=2*pi/T;
%Time translation such that minimal time=0
trans=exp((+j*t(1)*(0:(N-1))*oms/N));
reco=ifft(recoft.*trans);
reco=real(reco);
t=t-t(1);
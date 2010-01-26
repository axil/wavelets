%Demo of Continuous Wavelet Trafo. function-file!
%Call: [t,y,matrix]=mycwt(signal,T,start,step,stop,comment);
%T: sampling distance
%start: smallest scale factor,
%step: scale increment, 
%stop: biggest scale factor
%All scale factors are multiples of T!
%comment: to be included in figure title
%Return values: t: time vector; y: signal; matrix: Sampled CWT
%Last modified: 07.02.04, H.-G. Stark

function [t,y,matrix]=mycwt(y,T,start,step,stop,wav)
%close all;

%Preparations
%wav=input('Enter wavelet (in quotes): ');
comment = '';
N=max(size(y));
if size(y,1)>size(y,2),
    y=y'; 
end
titel=strcat(comment,'. Scale parameters: a_{start}=',sprintf('%d, ',start),'\delta_{a}=',sprintf('%d, ',step),'a_{stop}=',sprintf('%d.',stop));

%Sampling circular frequency
oms=2*pi/T;

%Generation of symmetric time vectors
if floor(N/2)==(N/2),
    t=(-floor(N/2):(floor(N/2)-1))*T; 
else 
    t=(-floor(N/2):(floor(N/2)))*T; 
end

%Initialization of scale factors
a=(start:step:stop)*T;
rows=length(a);

%Initialization of Fourier transforms
yhat=fft(y);

%Matrix-Initialization
matrix=zeros(rows,N);

%Loop for increasing scale factors
for i=1:rows,
      psi_scale=conj(feval(wav,-t./a(i)));
      psi_scale_hat=fft(psi_scale);

      %Fourier transform of wavelet transform; 
      %Time translation such that minimal time=0
      trans=exp((-j*t(1)*(0:(N-1))*oms/N));
      conv_hat=((yhat.*psi_scale_hat).*trans)/sqrt(a(i));

      matrix(i,:)=ifft(conv_hat);
end

%Additional visualization options (surface and contour)
rep_flag=0; %input('Surface and contour visualization (1)? ');
if rep_flag==1,
    figure(1);
    mesh(t-t(1),a,abs(matrix))
    xlabel('t')
    ylabel('a'); 
    title(titel);
    pause
    figure(2);
    subplot(211), plot(t-t(1),y), axis tight;
    title(titel);
    subplot(212), contour(t-t(1),a,abs(matrix))
    xlabel('t')
    ylabel('a'); 
end
flag2=0; %input('Phase diagram (only for complex valued wavelets)? yes=1, no=0: ');
if (flag2==1),
   figure(3)
   subplot(211), plot(t-t(1),y), axis tight;
   title(titel);
   colormap('gray'); 
   subplot(212);
   imagesc(t-t(1),a,abs(angle(matrix))); 
   xlabel('t');
   ylabel('a'); 
   pause
end

%Gray value visualization
figure(4);
subplot(211), plot(t-t(1),y), axis tight;
title(titel);
colormap('gray'); 
subplot(212);
imagesc(t-t(1),a,abs(matrix)); 
xlabel('t');
ylabel('a'); 
t=t-t(1);

%Demo of STFT. script-file!
%Call: [t,y,matrix]=mystft(signal,T,stept,ommin,stepom,ommax,comment); 
%T: sampling distance
%stept: time increment for window shift (multiple of T, default: 1)
%stepom: omega-increment (default: 1), 
%ommin (>=1!), ommax: minimal and maximal omega-values (both <length(signal)/2!!). 
%comment: to be included in figure title
%Return values: t: time vector; y: signal; matrix: Sampled STFT
%Last modified: 07.02.04, H.-G. Stark

function [t,signal,matrix]=mystft(signal,T,stept,ommin,stepom,ommax,comment)
close all

%Preparations
window=input('Enter window (in quotes): ');
N=max(size(signal));
if size(signal,1)>size(signal,2),
    signal=signal'; 
end
sigma=input('Window width: ');

if nargin<3,
    stept=1; 
end

if nargin<4,
    ommin=1; 
end

if nargin<5,
    stepom=1; 
end

if nargin<6,
    ommax=floor(N/2)+1;
end

if nargin<7,
    comment='';
end
titel=strcat(comment,'. Parameters: \delta_{t}=',sprintf('%d, ',stept),'\omega_{min}=',sprintf('%d, ',ommin),'\delta_{\omega}=',sprintf('%d,',stepom),'\omega_{max}=',sprintf('%d,',ommax),'\sigma=',sprintf('%.1f',sigma));

%Time vector, sampling frequency, frequency vector
t=(0:(length(signal)-1))*T;
Nue=1/T;
omind=ommin:stepom:ommax;
om=(omind-1)*Nue/N;

%Matrix-initialization
matrix=zeros(length(omind),N);

%Loop for increasing time
for index=1:stept:N,
    y=feval(window,(t-t(index))/sigma).*signal;
    column=conj((fft(y))');
    column=column(omind);
    ifill=min(stept,N-index+1);
    for i=1:ifill,
        matrix(:,index+i-1)=column; 
    end
end

%Visualization
YText='\nu';
f_flag=input('Frequency (1), or circular frequency (2)? ');
rep_flag=input('Surface and contour visualization (1)? ');
if f_flag==2,
    om=2*pi*om; 
    YText='\omega';
end
if rep_flag==1,
    figure(1)
    mesh(t,om,abs(matrix))
    xlabel('t'),ylabel(YText)
    pause
    figure(2)
    subplot(211), plot(t-t(1),signal), axis tight, title(titel);
    subplot(212), contour(t-t(1),om,abs(matrix)), axis tight
    xlabel('t'),ylabel(YText)
    pause 
end
figure(3)
subplot(211), plot(t-t(1),signal), axis tight, title(titel);
colormap('gray'); 
subplot(212);
imagesc(t-t(1),om,abs(matrix)); axis tight
xlabel('t');
ylabel(YText); 

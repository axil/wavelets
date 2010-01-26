%Demo of Windowed Fourier Reko. script-file!
%Call: [t,reco,matrix]=myistft(matrix,T,stept);
%matrix: STFT-Matrix (N columns,int(N/2)+1 rows)
%T: sampling distance
%stept: length of reconstruction intervals (multiple of T)
%Return values: t: time vector; reco: reconstructed signal; matrix: Sampled STFT
%Last modified: 07.02.04, H.-G. Stark

function [t,reco,matrix]=myistft(matrix,T,stept)

%Defaults
if nargin<3,
    stept=1;
end

%Optional demo-mode
demo_mode=input('Demo-Mode (yes:1, no:0)? ');

%Dimensions and time vector
N=size(matrix,2); rows=size(matrix,1); t=(0:(N-1))*T;

%matrix-extension to full number of rows
puffer=conj(matrix(rows:-1:2,:));
if N/2==floor(N/2),
    puffer(1,:)=[];
end
matrix((rows+1):N,:)=puffer;

%Initializations
reco=zeros(1,N); upper_indexlimit=min(stept,N);
window=input('Enter window (in quotes): ');
sigma=input('Window width: ');
divisor=feval(window,t/sigma);

%reco-loop
for i=1:stept:N,
    reco_actualinterval=ifft(matrix(:,i))';
    actualinterval=((1:N)>=i)&((1:N)<=upper_indexlimit);
    reco_actualinterval=reco_actualinterval.*actualinterval;
    divisor=divisor(1:(upper_indexlimit-i+1));
    reco_actualinterval(i:upper_indexlimit)=reco_actualinterval(i:upper_indexlimit)./divisor;
    reco=reco+reco_actualinterval;
    if demo_mode==1,
        figure(10), plot(t,real(reco)), pause,
    end
    upper_indexlimit=min(upper_indexlimit+stept,N);
end
reco=real(reco);
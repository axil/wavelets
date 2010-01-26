function y=haar(x)
%Generates the Haar-Wavelet. 
y=0.*(x<0)+((0<=x)&(x<.5))-((.5<=x)&(x<=1));
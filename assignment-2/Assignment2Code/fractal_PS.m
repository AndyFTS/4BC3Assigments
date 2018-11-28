function [dim,hurst]=fractal_PS(sig,p)
%Fractal dimension estimation using power spectrum analysis
sig=sig(:);
n=length(sig);
spectrum=fft(sig);
spectrum=abs(spectrum(1:(n/2)));
spectrum=spectrum.^2;
dim=polyfit((log(p-1:n/2-1))',log(spectrum(p:n/2)),1);%the first p-1 points are not used in the fitting
hurst=(1-dim(1))/2;
dim=2-hurst;
end
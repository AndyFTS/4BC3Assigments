function [dim,hurst]=fractal_RD(sig,p)
%Fractal dimension estimation using relative dispersion
n=length(sig);
level=log(n)/log(2);
RD=zeros(1,level);
% mean0=mean(sig);
%the group mean is omitted, since RD/RD_ref will be calculated
for i=0:level-1
    g=n/(2^i);% number of groups
    temp=reshape(sig,2^i,g);
    meant=mean(temp,1);
    RD(i+1)=std(meant,1);
end
dim=polyfit((p-1:level-3),log(RD(p:level-2)./(RD(1)))/log(2),1);%the RDs in this range--- p:level-1 were used in the fitting.The first p-1 and the last two points are not used.
dim=1-dim(1);
hurst=2-dim;
end
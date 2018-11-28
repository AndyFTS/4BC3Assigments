function [filter]= waveletfilterresponse(wname,fs)
% function displays the wavelet filter response for the 
% corresponding wavelet filter, wname 
[~,~,h,~] = wfilters(wname);
figure;
freqz(h,fs); 
title(strcat("Filter Response of "+wname+" Filter"));
filter = h; 
end


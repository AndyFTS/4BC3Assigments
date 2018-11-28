% question 5

close all;
fs = 131; %Hz

%% initialize the filters needed

reqFilters = ["db1","db5","db9"];

for i = reqFilters   
 
 filter = waveletfilterresponse(i,fs);
end
figure; 
k =0;
for i = reqFilters 
    k= k+1;
 subplot(3,1,k);
 [~,wf,x] = wavefun(i,10);
 plot(x,wf);
 title(i);
 xlabel('time');
 ylabel('Amplitude');
end
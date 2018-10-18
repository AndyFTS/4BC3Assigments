clear all;
%% Read Signals
load 'Q7.mat'
addpath('C:\Users\AndyA\OneDrive\Documents\MATLAB\FastICA_25');
%% SHOW PLOTS OF ORIGINAL SIGNALS
t=1:1:500;
L=500;
figure;
% subplot(2,2,1);
plot(t,data(1,:))
hold on
% subplot(2,2,2);
plot(t,data(2,:))
hold on
% subplot(2,2,3);
plot(t,data(3,:))

legend('E1','E2','E3')
% Perform ICA
[icasig1] = fastica(data,'stabilization','on');
%[icasig1] = fastica(data);
figure;
subplot(3,1,1);
plot(t,data(1,:))
subplot(3,1,2);
plot(t,data(2,:))
subplot(3,1,3);
plot(t,data(3,:))
title("");
%% Check normality
h1 = jbtest(data(1,:))
h2 = jbtest(data(2,:))
h3 = jbtest(data(3,:))

%% Fourier transform of signals
sumData1=0;
sumData2=0;
sumData3=0;
for i=1:500
    sumData1 = sumData1+data(1,i);
    sumData2 = sumData2+data(2,i);
    sumData3 = sumData3+data(3,i);
end
meanData1 = sumData1/500;
meanData2 = sumData2/500;
meanData3 = sumData3/500;

for i=1:500
    data1(1,i)=data(1,i)-meanData1;
    data2(1,i)=data(1,i)-meanData2;
    data3(1,i)=data(1,i)-meanData3;
end

ftSignal1 = fft(data1);
ftSignal2 = fft(data2);
ftSignal3 = fft(data3);
% 
ftSignal1 = abs(ftSignal1/500);
ftSignal2 = abs(ftSignal2/500);
ftSignal3 = abs(ftSignal3/500);
% 
P1 = ftSignal1(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P2 = ftSignal2(1:L/2+1);
P2(2:end-1) = 2*P2(2:end-1);
P3 = ftSignal3(1:L/2+1);
P3(2:end-1) = 2*P1(2:end-1);
t= 1000*(0:(L/2))/L;
figure;
subplot(3,1,1);
plot(t,P1)
subplot(3,1,2);
plot(t,P2)
subplot(3,1,3);
plot(t,P3)
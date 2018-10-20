clear all; clc; close all; 
load 'Q7.mat'
addpath('C:\Users\AndyA\OneDrive\Documents\MATLAB\FastICA_25');
% check for normaility in the mixed signals
jb_E1 = jbtest(data(1,:));
jb_E2 = jbtest(data(2,:));
jb_E3 = jbtest(data(3,:));
txt = '\downarrow Jarque-Bera = 0';
% graphs of E1,E2,E3
figure;
subplot(3,1,1);
plot(data(1,:))
title("E1 vs. Time")
xlabel("Time");
ylabel("V");
text(54,5.4,txt)
subplot(3,1,2);
plot(data(2,:))
title("E2 vs. Time")
xlabel("Time");
ylabel("V");
text(54,5.4,txt);
subplot(3,1,3);
plot(data(3,:))
title("E3 vs. Time")
xlabel("Time");
ylabel("V");
text(54,5.4,txt);
% ICA analysis
data_t = data';
ica_data = rica(data_t,3);
unmixed_data = transform(ica_data,data_t);
figure;
subplot(3,1,1);
plot(unmixed_data(:,1))
title("Unmixed E1 vs. Time")
xlabel("Time");
ylabel("V");
subplot(3,1,2);
plot(unmixed_data(:,2))
title("Unmixed E2 vs. Time")
xlabel("Time");
ylabel("V");
subplot(3,1,3);
plot(unmixed_data(:,3))
title("Unmixed E3 vs. Time")
xlabel("Time");
ylabel("V");

%% Fourier transform of signals
% assume each signal has compents of one another convolved inside 
% example e1 = h(*)

E1 = fftshift(abs(fft(data(1,:))));
E2 = fftshift(abs(fft(data(2,:))));
E3 = fftshift(abs(fft(data(3,:))));
f = -249:250;
figure;
subplot(3,1,1);
plot(f,E1)
title("E1 vs. freq")
xlabel("frequency");
ylabel("Magnitude");
%xlim([240,260])
subplot(3,1,2);
plot(f,E2)
title("E2 vs. freq")
xlabel("frequency");
ylabel("Magnitude");
subplot(3,1,3);
plot(f,E3)
title("E3 vs. freq")
xlabel("frequency");
ylabel("Magnitude");
E1M = fftshift(abs(fft(unmixed_data(:,1))));
E2M = fftshift(abs(fft(unmixed_data(:,2))));
E3M= fftshift(abs(fft(unmixed_data(:,3))));
figure;
subplot(3,1,1);
plot(f,E1M)
title("Unmixed E1 vs. freq")
xlabel("Time");
ylabel("Magnitude");
subplot(3,1,2);
plot(f,E2M)
title("Unmixed E2 vs. freq")
xlabel("Time");
ylabel("Magnitude");
subplot(3,1,3);
plot(f,E3M)
title("Unmixed E3 vs. freq")
xlabel("Time");
ylabel("Magnitude");

% plotting dc biased remvoed 
e1 = data(1,:);
e2 = data(2,:);
e3 = data(3,:);
e1 = e1 - mean(e1);
e2 = e2 - mean(e2);
e3 = e3 - mean(e3);

E1 = fftshift(abs(fft(e1)));
E2 = fftshift(abs(fft(e2)));
E3 = fftshift(abs(fft(e3)));
f = -249:250;
figure;
subplot(3,1,1);
plot(f,E1)
title("E1 vs. freq")
xlabel("frequency");
ylabel("Magnitude");
%xlim([240,260])
subplot(3,1,2);
plot(f,E2)
title("E2 vs. freq")
xlabel("frequency");
ylabel("Magnitude");
subplot(3,1,3);
plot(f,E3)
title("E3 vs. freq")
xlabel("frequency");
ylabel("Magnitude");
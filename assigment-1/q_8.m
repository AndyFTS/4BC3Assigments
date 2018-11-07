
load 'Q8.mat';
rows = size(mridata1,1);
columns = size(mridata1,2);
time = size(mridata1,3);
M1 = reshape(mridata1,64*64,180);
M2 = reshape(mridata2,64*64,180);
activation = linspace(0,size(M1,2)-1,size(M1,2));
activation = 0.5*(-square(activation*pi/15)+1);
figure
plot(activation);
title("Activation function");
xlabel("time (s)");
ylim([-0.25,1.25]);
xlim([0 360]);
M1_C = zeros(rows,1);
for i = 1:size(M1,1) 
    temp = corrcoef(M1(i,:),activation);
    M1_C(i) = temp(1,2);
end
M1_C = reshape(M1_C,64,64);
figure 
subplot(1,2,1)
imagesc(M1_C)
colorbar
title('No Motion Correction')
xlabel('X')
ylabel('Y')
M2_C = zeros(rows,1); 
for i = 1:size(M2,1) 
    temp = corrcoef(M2(i,:),activation);
    M2_C(i) = temp(1,2);
end
M2_C = reshape(M1_C,64,64);

subplot(1,2,2) 
imagesc(M2_C)
colorbar
title('Motion Correction')
xlabel('X')
ylabel('Y')
N = length(activation);
activation_fft = abs(fft(activation)/N);
figure
Fs = 0.5;
f = linspace(-Fs,Fs,N);
plot(f, activation_fft)
title('Activation Function Frequency Spectrum')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
xlim([0 0.5])
M1_FFT = zeros(size(M1,1),size(M1,2));
M2_FFT = zeros(size(M2,1),size(M2,2));
M1_FFT_C = zeros(size(M1,1),1);
M2_FFT_C = zeros(size(M2,1),1); 
for i = 1:size(M2,1) 
   M1_FFT(i,:) = M1(i,:)-mean(M1(i,:)); %remove DC
   M1_FFT(i,:) = abs(fft(M1_FFT(i,:),time,2)/time);
   temp = corrcoef(M1_FFT(i,:),activation_fft);
   M1_FFT_C(i) = temp(1,2);
   
   
   M2_FFT(i,:) = M2(i,:)-mean(M2(i,:)); %remove DC
   M2_FFT(i,:) = abs(fft(M2_FFT(i,:),time,2)/time);
   temp = corrcoef(M2_FFT(i,:),activation_fft);
   M2_FFT_C(i) = temp(1,2);
end
M1_FFT_C = wrapmri(M1_FFT_C,rows,columns);
M2_FFT_C = wrapmri(M2_FFT_C,rows,columns);
figure
subplot(1,2,1)
imagesc(M1_FFT_C)
title('No Motion Correction')
colorbar
xlabel('X')
ylabel('Y')
subplot(1,2,2)
imagesc(M2_FFT_C)
title('Motion Correction')
colorbar
xlabel('X')
ylabel('Y')
[coeff1,score1,latent1,~,explained1,mu1] = pca(M1);
figure
for i = 1:6
    subplot(2,3,i)
    A = reshape(score1(:,i),rows,columns);
    imagesc(A)
    colorbar
    title(['Principal Component ', num2str(i)])
end
[coeff2,score2,latent2,~,explained2,mu2] = pca(M2);
figure
for i = 1:6
    subplot(2,3,i)
    A = reshape(score2(:,i),rows,columns);
    imagesc(A)
    colorbar
    title(['Principal Component ', num2str(i)])
end

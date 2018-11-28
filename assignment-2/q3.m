clc;clear;
load dataQ3.mat

item = dce;
time = pow2(floor(log2(length(item(1,1,:))))); % calculates closest power of 2 for time dimension, allows fractal_RD to work
len = length(item(:,:,1)); %single slice matrix bounds

% RELATIVE DISPERSION 
%256: dce , 112: bold 
fd_RD = zeros(len,len,2); 


%change loops to 112 for bold, 256 for dce
for i = 1 : len
    for j = 1 : len
pixel_RD = item(i,j,1:time); % dce(i,j,1:32) for dce, 1:2048 for bold
pixels_RD = reshape(pixel_RD, [1 length(pixel_RD)]);
[dim_RD,hurst_RD] = fractal_RD(pixels_RD,1);
fd_RD(i,j,1) = dim_RD; 
fd_RD(i,j,2) = hurst_RD; 
    end 
end 

figure
image(fd_RD(:,:,1),'CDataMapping','scaled')
title('Pixelwise Fractal Dimension - Relative Dispersion - DCE')
colorbar


% POWER SPECTRUM


fd_PS = zeros(len,len,2);

for i = 1 : len
    for j = 1 : len
pixel_PS = item(i,j,1:length(item(1,1,:))); %can use full time length
pixels_PS = reshape(pixel_PS, [1 length(pixel_PS)]);
[dim_PS,hurst_PS] = fractal_PS(pixels_PS,2);
fd_PS(i,j,1) = dim_PS; 
fd_PS(i,j,2) = hurst_PS; 
    end 
end 

figure
image(fd_PS(:,:,1),'CDataMapping','scaled')
title('Pixelwise Fractal Dimension - Power Spectrum - DCE')
colorbar
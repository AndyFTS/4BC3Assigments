% question 4
close all;
data = load("dataQ3.mat");
addpath("Assignment2Code");
% find the prostate 
% how ot detemrine embedding params 
% m = 2*D values which D = true dimensions of system , chose a value under
% 3 can use PCA to determine how many principal componens you need 
%tau is the delay , can be any number 
%% Lyapunov Exponential
lyp_pic = ones(112,112); 
oneD = ones (1,2400);
fs = 4; %hz
%from croping the image as much as i could
% coordinates of the prostate. 
% due to long comuptational time we have to cut down the data we are
% searching through
height = 43:75; 
width = 43:75;
depth = 1:2400;
figure; 
imshow3D(data.bold(height,width,:),[]);
for i = height
    for j = width
        oneD(1,:) = data.bold(i,j,:);
        [lambda, linear_end] = max_lyp(oneD,3,30,fs);
        lyp_pic(i,j) = lambda;
    end
end
 
figure; 
pcolor(lyp_pic(height,width));
c = colorbar;
c.Label.String = 'Maximum Lyapunov Exponent';
title('Maximum Lyapunov Exponent Of Prostate Region');
shading flat;

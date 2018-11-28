% q1
clc; close all;
data = load("dataQ1.mat");
x1 = data.urea(:,1);
x2 = data.urea(:,2);
x3 = data.urea(:,3);
x4 = data.urea(:,4);
x5 = data.urea(:,5);
x6 = data.urea(:,6);


time = linspace(0,24*10,length(data.urea(:,1))); % hours

cosinor(time',x1,180,0.05); 
cosinor(time',x2,180,0.05); 
cosinor(time',x3,180,0.05); 
cosinor(time',x4,180,0.05); 
cosinor(time',x5,180,0.05); 
cosinor(time',x6,180,0.05); 

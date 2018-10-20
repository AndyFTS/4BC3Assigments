function [A] = flattenmri(mridata)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

y = size(mridata,1); %number of rows
x = size(mridata,2); %number of columns
t = size(mridata,3); %number of time same

A = zeros(x*y, t);
for T = 1:t %for all time
    for col = 1:x %for all columns
        A( 1+y*(col-1): y*col , T) = mridata ( : , col, T);
    end
end

function [A] = unflattenmri(mridata,rows,columns)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

t = size(mridata,2);

A = zeros(rows ,columns , t);
for T = 1:t %for all time
    for col = 1:columns %for all columns
         A ( : , col, T) = mridata( 1+rows*(col-1): rows*col , T);
    end
end


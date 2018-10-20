function [A] = wrapmri(M,rows,columns)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A = zeros(rows ,columns);

    for col = 1:columns %for all columns
         A ( : , col) = M(1+rows*(col-1): rows*col);
    end
    
end

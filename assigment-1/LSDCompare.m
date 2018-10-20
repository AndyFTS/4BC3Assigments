function [base,calc] = LSDCompare(mean1,mean2, ErrorDf,MSError, alpha, n1,n2)
%LSDCompare 
%   this function runs LSD test on two means with 2 degrees of freedom at
%   an alpha value and MSError defined bt the folowing function
base = tinv(1.00-alpha/2,ErrorDf)*sqrt(MSError*(1/n1 +1/n2));
calc = abs(mean1-mean2); 

end


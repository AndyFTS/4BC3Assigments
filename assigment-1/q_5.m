%% Question 5

data = importdata('Q5.txt');
[~,~,stats] = anova2(data,86,'on');
%c = multcompare(stats);
% group two or treatment B shows the highest significant tumor reduction
% percentage out of all groups 
means = stats.colmeans; 

% calculate fischers LSD intervals for each test
% lsdtable = zeros(5,5);
for n=1:6
    for j = 2:7
        [base,calc] = LSDCompare(means(1,n),means(1,j),stats.df,stats.sigmasq,0.05,86,86);
        lsdtable(n,j) = calc;
    end
end
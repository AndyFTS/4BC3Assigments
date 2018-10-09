%% Question 5

data = importdata('Q5.txt');
[~,~,stats] = anova2(data,86,'on');
c = multcompare(stats);
% group two or treatment B shows the highest significant tumor reduction
% percentage out of all groups 
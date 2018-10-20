%% Question 2
%  The data Q2.txt has 6 columns of values representing the following 
% treatments for intractable temporal lobe epilepsy:phenytoin, vagal nerve 
% stimulation, gyrectomy, phenobarbital, Ginko biloba, visual biofeedback. 
% At a certain time following therecommended treatment protocol, patients 
% were tested using an epilepsy-inducing visual paradigm(note: each value 
% is from a different patient).The values in thetable are EEG frequencies 
% recorded during the paradigm from electrode T5 (based on the 10-20 system).
% Do the appropriate statistical analysis and post hoc testing using
% contrast.

data = importdata('Q2.txt');
[~,~,stats] = anova2(data,15,'on');
c = multcompare(stats);
means = stats.colmeans; 

% calculate fischers LSD intervals for each test
lsdtable = zeros(5,5);
for n=1:5
    for j = 2:6
        [base,calc] = LSDCompare(means(1,n),means(1,j),stats.df,stats.sigmasq,0.05,15,15);
        lsdtable(n,j) = calc;
        base
    end
end


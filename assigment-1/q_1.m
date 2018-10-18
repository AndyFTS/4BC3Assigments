%% Q_1
% (15 Marks) Consider the data Q1.txt. This data was taken from 54 patients
% who underwent liver resection for  hepatocarcinoma.  Prior to the operation 
% measurements of blood clotting time (CLOT), liver enzyme glutamate:oxaloacetate transaminase (GOT) 
% functional test, a functional liver score (LIV) and a prognostic index (PROG) were all performed.  
% These 4 variables were assessed as a possible predictor of the number of days (TIME) survived after surgery.  
% Assuming normality in this data, what statistical analysis should be performed to 
% assess which variable(s) are most important in determining survival?  
% Perform the analysis.Include residual analysis and comment on the 
% appropriate (or not) nature of the model

% multiple linear regression model should indicate most important factors
syms CLOT GOT LIV PROG ; 
data = importdata('Q1.txt');
% linear
y = data(:,6);
X = [ones(54,1) data(:,2) data(:,3) data(:,4) data(:,5)]; % matlab help says to put a column of ones in the matrix idno why
[blin,bintlin,rlin,rintlin,statslin] = regress(y,X);
lintable =table(X(:,2),X(:,3),X(:,4),X(:,5),y,'VariableNames',{'CLOT','GOT','LIV','PROG','TIME'});
linearm = fitlm(lintable,'TIME~CLOT+GOT+LIV+PROG');
x = [1 CLOT GOT LIV PROG]; 
mltipleRegressionLinModel = x*blin;
% because CLOT has the largest coefficient b1 we can infer that CLOT has
% the most impact on post-operation survivial 
%logarithmic 

[blog,bintlog,rlog,rintlog,statslog] = regress(log(y),X);
logtable =table(X(:,2),X(:,3),X(:,4),X(:,5),log(y),'VariableNames',{'CLOT','GOT','LIV','PROG','TIME'});
logm = fitlm(logtable,'TIME~CLOT+GOT+LIV+PROG');
mltipleRegressionLogModel = x*blog;
% compare residuals
figure(1);
plotResiduals(linearm,'fitted');
xlabel('Y')
ylabel('Residual')
title("Residual Plots");
figure(2);
plotResiduals(logm,'fitted');
xlabel('Y')
ylabel('Residual LOG(DATA)')
title("Residual Plots LOG(DATA)");
figure(3);
plot(linearm);
xlabel('X')
ylabel('Time (Number of days)')
title("Regressional Analysis on DATA");
figure(4);
plot(logm);
xlabel('X')
ylabel('LOG(Time (Number of days))')
title("Regressional Analysis on LOG(DATA)");
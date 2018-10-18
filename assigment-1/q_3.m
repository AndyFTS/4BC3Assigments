%% Question 3 
%Consider the data in Q3.txt.  This has 2 columns: the first is a measure 
% of the concentration of a compound in the blood after it was injected 
% into the antecubital vein.  Measurements were taken almost every minute 
% up to 100 minutes (the second column is time, in minutes).  This compound
% is leaving the blood stream via the kidneys (the faster route of elimination)
%and it is also getting up taken by muscle cells.  Decide on an appropriate
% model for this situation.  Write a matlab program to do the following:
%(a)Fit the data to the appropriate model.  What are the rate constants 
%   for elimination from the blood to each compartment?  Plot the data and the
%   fit through the model.For best visualization of these types of problems use a log transformed y-axis.
%(b)How much of the compound was given at time=0 (i.e. the injection)?
%(c)Why does the data look the way it does at later time points?
%(d)  List any assumptions.

data = importdata('Q3.txt');
concentration = data(:,1);
time = data(:,2);
exp_fit = fit(time,concentration,'exp2');
log_fit = fit(time,log(concentration),'poly1');
figure(1);
plot(exp_fit,time,concentration);
title('concentration vs time fit with exponential');
xlabel('time (m)');
ylabel('concentration');
figure(2);
plot(log_fit,time,log(concentration));
title('log(concentration) vs time fit with linear polynomial');
xlabel('time (m)');
ylabel('log(concentration)');
exp_fit 
log_fit
concentration_at_zero = 22.39 + 4.183;
concentration_at_zero
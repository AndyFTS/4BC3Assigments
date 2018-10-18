%% Question 6
%  Consider the data in Q6.mat.  The data is an 80x7 matrix, where each column
%  represents EMG power output (from this experiment it was unitless) from a 
%  specific quadriceps task, given pre-treatment of a unique cocktail of performance
%  enhancing ‘vitamins’.  The individual cocktails (treatments)are listed as A to G,
%  which correspond to each of the 7 columns. Perform the following analysis:a) 
%  Assume the experiment was done at 8 different sites, every 10 rows of the 
%  data being from a different site. Set this up as a RCBD experiment, where every 
%  value represents an individual person’s power, following a single treatment.  
%  State the null and alternative hypothesis. Decide whether you need to perform 
%  a post hoc test to discern whether any of the treatments are different 
% (and do the test if needed).Determine where variance is coming from in the  design and describe.
%  b)  Assume that this was all done at one site, by the same researchers.  
%      However, this time the experiment was repeated 10 times on each person (on different days).
%      Each persongot the same treatment, but ten separate times.  Perform the appropriate analysis. 
%      State assumptions.  Are any of the treatments differentin this case (find out via post hoc testing)?
%      Perform an assessment of the sources of variance in the model and describe where they come from.  
%      What are different between this approach and that done in (a
close all; 
%% a) assume 8 different locations RCBD
data = importdata('Q6.mat');
% create the sub matrixes
[p,tbl,stats] = anova2(data,10);
figure();
c2 = multcompare(stats,'Estimate','row');
figure();
c3 = multcompare(stats,'Estimate','column');

%% b) assume it was all done on one site 10 different days 
[p2,tbl2,stats2] = anova2(data,8);

figure();
c4 = multcompare(stats2,'Estimate','row');
figure();
c5 = multcompare(stats2,'Estimate','column');
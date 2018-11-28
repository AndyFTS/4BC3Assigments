%question 6 
close all;
syms Pt C;
Ck = 5; P0 = 0.55; 
f = @(P)4*Ck*P.^3 -6*P.^2 + (1-2*Ck).*P;
% f = @(P) Ck.*P.*(1-P); 
% point is fixed in a difference equation if x[n+1] = x[n] = f{x[n]}
% a) fixed points 
fpoints = 4*C*Pt^3 -6*Pt^2 + (1-2*C)*Pt == Pt; 
[sol1, params1, conds1] = solve([fpoints, Pt >= 0, Pt <= 1], Pt, 'ReturnConditions', true);

% b) stablility of fixed points 

points = subs(diff(lhs(fpoints),Pt),Pt,sol1); 
%disregard points [1,2] because the solution for c is negative
stability =  solve( [abs(points(1)) < 1],C,'ReturnConditions', true);
% c) plot Pt+1 as func of Pt 
funct = 4*5*Pt^3 -6*Pt^2 + (1-2*5)*Pt == Pt;
max_min =  solve(diff(lhs(funct),Pt) == 0);
inflec =  solve(diff(diff(lhs(funct),Pt),Pt) == 0);
figure;
x = linspace(-1,1,200);
plot(x,f(x)); 
xlabel("P_t");
ylabel("P_{t+1}");
title("f(P_t)");
hold on;
plot(max_min, subs(lhs(funct),Pt,max_min),'+');
plot(inflec, subs(lhs(funct),Pt,inflec),'o');
text(max_min(1) - 0.25,subs(lhs(funct),Pt,max_min(1)) +1,strcat('maxima [ ',char(max_min(1)),', ',char(subs(lhs(funct),Pt,max_min(1))),' ]'));
text(max_min(2) - 0.25,subs(lhs(funct),Pt,max_min(2)) -1,strcat('minima [ ',char(max_min(2)),', ',char(subs(lhs(funct),Pt,max_min(2))),' ]'));
text(inflec - 0.25,subs(lhs(funct),Pt,inflec) +1,strcat('inflection [ ',char(inflec),', ',char(subs(lhs(funct),Pt,inflec)),' ]'));
hold off;
figure;
cobweb(f,-15,15,P0,200,3);
xlabel("P_t");
ylabel("P_{t+1}");
title("cobweb plot of P_{t+1}");
legend("P_{t+1} vs. P_t","P_{t+1}=P_t","lines");
% Ck = 0.5; 
% f2 = @(P)4*0*P.^3 -6*P.^2 + (1-2*0).*P;
% for a = [0.2 0.5 0.9]
%     figure;
%     cobweb(f2,-15,15,a,200,10);
% end
%% this system will allways be unstable because the line will allways intersect the plane exactly if c>0

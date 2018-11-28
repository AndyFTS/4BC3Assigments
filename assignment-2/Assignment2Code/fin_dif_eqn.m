% Fun little program to look at varying values of R
% with linear and nonlinear (quadratic) finite difference eqns
L=input('linear (L) or nonlinear (N)? ','s');
if L=='L',
% Linear Finite difference equations
% Nt=R^t*No
for q=1:100,
R=input('Set value of R ');
Nt=100
for t=1:40
    if t==1, 
        Ntnew(t)=Nt; 
    else,
        Ntnew(t)=Nt*R;
        Nt=Ntnew(t);
        time(t)=t-1;
    end;
end
plot(time,Ntnew,'square',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10); hold on; pause;
plot(time,Ntnew,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10);
xlabel('Time');
ylabel('Nt');
pause;
clf
clear R t Ntnew Nt time
end;



else,
    
% Nonlinear finite difference equations
% Nt=R(1-Xt)Xt
for q=1:100,
R=input('Set value of R ');
Xt=0.1
for t=1:40
    if t==1,
        Xtnew(t)=Xt;
    else,
        Xtnew(t)=R*(1-Xt)*Xt;
        Xt=Xtnew(t);
        time(t)=t-1;
    end;
end
plot(time,Xtnew,'square',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10);  axis([0 40 0 1]); hold on; pause;
plot(time,Xtnew,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10);
  
xlabel('Time');
ylabel('Xt');
pause;
clf
clear R t Ntnew Nt time
end;


end;

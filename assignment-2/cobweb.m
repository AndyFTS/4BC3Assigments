function cobweb(f,a,b,x0,N1,N2)
% generate N linearly space values on (a,b)
x=linspace(a,b,N1);  
% which we use to plot the function y=f(x)
y=f(x);
% turn hold on to gather up all plots in one
hold on;
plot(x,y,'k'); % plot the function
plot(x,x,'r'); % plot the straight line
x(1)=x0; % plot orbit starting at x0
for i=1:N2
    x(i+1)=f(x(i));
    line([x(i),x(i)],[x(i),x(i+1)]);
    line([x(i),x(i+1)],[x(i+1),x(i+1)]);
end
xlim([-4,4]);
ylim([-100 100]);
hold off;


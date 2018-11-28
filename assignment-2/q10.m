clc; clear; close all;

syms xnext(xt) xnext1(xt)

xnext1(xt) = 200 - 20*exp(xt/62);
xnext2 = 40;

xnext(xt) = piecewise(0<=xt<=128,xnext1(xt),128<xt<=200,xnext2);

%Part A

syms f(xt) 

f(xt) = 200 - 20*exp(xt/62);

df(xt) = diff(f(xt),xt);
d2f(xt) = diff(df(xt),xt);

maxormin_point = simplify(subs(solve(df(xt)==0,xt)))
inflection_point = subs(solve(d2f(xt)==0,xt))

%Part B

xt = 1:1:200;
plot(double(xnext(xt)),'g')
ylim([30 190])
xlim([0 200])
% title('f(x_t)');
% xlabel('x_t');
% ylabel('x_{t +1}');

%Part C 
clear xt
syms xnext(xt) xnext1(xt) xfixed(xt)
xnext1(xt) = 200 - 20*exp(xt/62);
xnext2 = 40;
xnext(xt) = piecewise(0<=xt<=128,xnext1(xt),128<xt<=200,xnext2);

[xfixed,~,~] = solve(xnext(xt) == xt, xt, 'ReturnConditions', true);
xfixed = double(xfixed)


%Part D 

R = double(df(xfixed))


%Part E 

hold on
plot(1:1:200,'r')
hold off
x(1) = 100;
for i=1:50
    x(i+1)=xnext(x(i));
    line([x(i),x(i)],[x(i),x(i+1)]);
    line([x(i),x(i+1)],[x(i+1),x(i+1)]);
end
title('cobweb plot of f(x_t) x0 = 100');
xlabel('x_t');
ylabel('x_{t +1}');

figure; 
plot(x);
title('Plot of difference equation. x0 = 100');
xlabel('t');
ylabel('x_{t}');
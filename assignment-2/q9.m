syms E C1 x
close all;
% xode = diff(x,t) == 1/E * (y - (x.^3)/12 + x);
% yode = diff(y,t) == -E * (2*x + y - 8/3);

y = (x.^3)/12 - x + C1;

dy = diff(y,x);
d2y = diff(dy,x); 

maxormin_point = simplify(subs(solve(dy==0,x)));
inflection_point = subs(solve(d2y==0,x))

x = maxormin_point(1);
temp = subs(y);
x = maxormin_point(2);
% finding the max and min points
if (temp-subs(y))>0
    max_x = maxormin_point(1);
    min_x = maxormin_point(2);
else
    max_x = maxormin_point(2);
    min_x = maxormin_point(1);
end

C1 =  0;
x = max_x;
max_y = subs(y);
x = min_x;
min_y = subs(y);

maxima = [max_x max_y]
minima = [min_x min_y]

figure;
x = -6:0.01:6;
plot(x,subs(y))
hold on;
title('x - Isocline'); 
xlabel('x');
ylabel('y');
plot(minima(1),minima(2),'o');
plot(maxima(1),maxima(2),'o');
plot(inflection_point,inflection_point,'o');
text(maxima(1) - 0.25,maxima(2) +1,strcat('maxima [ ',char(maxima(1)),', ',char(maxima(2)),' ]'));
text(minima(1) - 0.25,minima(2) +1,strcat('minima [ ',char(minima(1)),', ',char(minima(2)),' ]'));
text(inflection_point - 0.25,inflection_point +1,strcat('POI [ ',char(inflection_point),', ',char(inflection_point),' ]'));
hold off;
figure
x = -6:0.01:6;
plot(x,subs(y))
title('x,y Phase Plane Epsilon = 0.1'); 
xlabel('x');
ylabel('y');
%Part B 
%approximate nonlinear ODEs by linearization at some fixed point
%dx/dt = Ax + By = f, dy/dt = Cx + Dy = g
syms E x y
f = 1/E * (y - (x.^3)/12 + x);
g = -E * (2*x + y - 8/3);
A = diff(f,x);
B = diff(f,y);
C = diff(g,x);
D = diff(g,y);

x = 2; y = -4/3;
Beta = subs(A) + subs(D);
gamma = subs(A)*subs(D) - subs(B)*subs(C); 

%Stable node since Beta < 0 and gamma > 0
%also aslong as Beta^2 < 4gamma, givenn Beta<0 then it is a stable signal


%Part C using Quiver

[x,y] = meshgrid(-6:0.5:6);
E = 0.1;
Dx =  1/E * (y - (x.^3)/12 + x);
Dy = -E * (2*x + y - 8/3);

hold on
quiver(x,y,subs(Dx),subs(Dy)); 

hold off
xlim([-6 6])
ylim([-6 6])
% % using cone plot 
% z = meshgrid(-6:0.5:6);
% Dz = zeros(size(z));
% coneplot(x,y,z,subs(Dx),subs(Dy),Dz);

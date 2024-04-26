% Copyright(C), 2024

%%% Test#15.1:  Compute the equation used by 
%%%             Finite-Difference-Method

% Author:       YANG Yk    #8211221221
% Class:        2201, Geophysics
% Advisor:      TONG Xz
% Date:         2024/04/26 08:39
%

% clear
clear;

% define
T = 1;
X = 1;
a = 1;
m = 100;
n = 10;
dt = T/m;
dx = X/n;

lambda = a^2 * dt^2 /dx^2;

t = zeros(1,m+1);
x = zeros(1,n+1);
u = zeros(n+1,m+1);

% initial
for i = 1:n+1
    x(i) = (i-1) * dx;
    u(i,1) = 2*sin(pi*x(i));
    u(i,2) = 2*sin(pi*x(i))-dt*sin(2*pi*x(i));
end

% boundary
for k = 1:m+1
    u(1,k) = 0;
    u(n+1,k) = 0;
    t(k) = (k-1)*dt;
end

% explict FDM
for k = 2:m
    for i = 2:n
        u(i,k+1) = lambda*(u(i-1,k)+u(i+1,k))+2*(1-lambda)*u(i,k)-u(i,k-1);
    end
end

% analysis
u_a = zeros(n+1,m+1);
[xx,tt] = meshgrid(x,t);
for k = 1:m+1
    for i = 1:n+1
        u_a(i,k) = cos(pi*t(k))*sin(pi*x(i))+0.5*sin(2*pi*t(k))*sin(2*pi*x(i)) / pi;
    end
end

figure;
surf(x,t,u');
xlabel('x');
ylabel('t');
zlabel('u');
title('test15.1')

figure;
subplot(1,3,1);
contourf(x,t,u');
xlabel('x');
ylabel('t');
title('差分近似解');

subplot(1,3,2);
contourf(x,t,u_a');
xlabel('x');
ylabel('t');
title('解析解');

subplot(1,3,3);
contourf(x,t,abs(u'-u_a'));
xlabel('x');
ylabel('t');
title('绝对误差');

colorbar;
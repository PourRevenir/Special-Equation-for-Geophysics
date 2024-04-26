% Copyright(C), 2024

%%% Test#14.2:  Compute the equation of heat used by 
%%%             Finite-Difference-Method

% Author:       YANG Yk    #8211221221
% Class:        2201, Geophysics
% Advisor:      TONG Xz
% Date:         2024/04/12 03:09
%

% clear
clear;

% define parameter
X = 3;
T = 0.4;          % computational domain
M = 50;
N = 20;        % number of divided grids
dt = T/M;
dx = X/N;       % difference
lambda = 1;
alpha = lambda*dt/dx^2;
u = zeros(N+1,M+1);

% initial conditions
x = zeros(N+1,1);
for i = 1:N+1
    x(i) = (i-1)*dx;
    u(i,1) = x(i);      % u(x,0)=x(pi-x)
end

% boundary conditions
t = zeros(M+1,1);
for j = 1:M+1
    t(j) = (j-1)*dt;
    % u'x(0,t)=0
    % u'x(3,t)=0
end

% explicit difference method
for j = 1:M
    for i = 2:N
        u(1,j) = u(2,j);
        u(N+1,j) = u(N,j);      % boundary conditions
        u(i,j+1) = u(i,j)+alpha*(u(i-1,j)+u(i+1,j)-2*u(i,j));
    end
end
u(1,M+1) = u(2,M+1);
u(N+1,M+1) = u(N,M+1);          % boundary conditions

% figure
figure;
surf(x,t,u');
xlabel('x');
ylabel('t');
zlabel('u');
title('explicit difference method');
colorbar;
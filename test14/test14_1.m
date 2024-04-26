% Copyright(C), 2024

%%% Test#14.1:  Compute the equation of heat used by 
%%%             Finite-Difference-Method

% Author:       YANG Yk    #8211221221
% Class:        2201, Geophysics
% Advisor:      TONG Xz
% Date:         2024/04/12 03:09
%

% clear
clear;

% define parameter
X = pi;
T = 0.8;          % computational domain
M = 50;
N = 10;        % number of divided grids
dt = T/M;
dx = X/N;       % difference
lambda = 3;
alpha = lambda*dt/dx^2;
u = zeros(N+1,M+1);

% initial conditions
x = zeros(N+1,1);
for i = 1:N+1
    x(i) = (i-1)*dx;
    u(i,1) = x(i)*(pi-x(i));      % u(x,0)=x(pi-x)
end

% boundary conditions
t = zeros(M+1,1);
for j = 1:M+1
    t(j) = (j-1)*dt;
    u(1,j) = 0;             % u(0,t)=0
    u(N+1,j) = 0;           % u(pi,t)=0
end

% explicit difference method
for j = 1:M
    for i = 2:N
        u(i,j+1) = u(i,j)+alpha*(u(i-1,j)+u(i+1,j)-2*u(i,j));
    end
end

% figure
surf(x,t,u');
xlabel('x');
ylabel('t');
zlabel('u');
colorbar;
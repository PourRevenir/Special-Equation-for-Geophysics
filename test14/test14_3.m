% Copyright(C), 2024

%%% Test#14.3:  Compute the equation of heat used by 
%%%             Finite-Difference-Method

% Author:       YANG Yk    #8211221221
% Class:        2201, Geophysics
% Advisor:      TONG Xz
% Date:         2024/04/12 04:01
%

% clear
clear;

% define parameter
X = 3;
T = 0.4;          % computational domain
M = 50;
N = 15;        % number of divided grids
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
%u(1,1) = u(2,1);
%u(N+1,1) = u(N,1);  % boundary conditions

% operator
aa(1:N) = -alpha;
bb(1:N+1) = 1+2*alpha;
A = diag(bb,0)+diag(aa,-1)+diag(aa,1);
A(1,1) = 1;     % boundary conditions
A(1,2) = -1;
A(2,1) = 0;
A(N+1,N+1) = 1;
A(N+1,N) = -1;
A(N,N+1) = 0;

% implicit difference method
for j = 2:M+1
    b = u(1:N+1,j-1);
    b(1) = 0;
    b(N+1) = 0;
    u(1:N+1,j) = A\b;
end    

% figure
figure;
surf(x,t,u');
xlabel('x');
ylabel('t');
zlabel('u');
title('implicit difference method');
colorbar;
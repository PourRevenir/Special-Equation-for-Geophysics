%%% EX1#1
% author:   YANG Yk
% date:     2024/04/17 08:16

clc;
clear;

% define
X = 1;
N = 100;
dx = X/N;
x = 0:dx:X;

% operator
A = sparse(N+1,N+1);
b = zeros(N+1,1);

A(1,1) = 1;
A(N+1,N+1) = 1;
b(1,1) = 0;
b(N+1,1) = 0;

d = 1/dx^2;
for i = 2:N
    A(i,i) = -2*d;
    A(i,i-1) = d;
    A(i,i+1) = d;
    b(i,1) = -pi^2*sin(pi*i*dx);
end

u = A\b;

% figure
figure;
plot(x,u,'ro');
xlabel('x');
ylabel('u');
title('Ex1');
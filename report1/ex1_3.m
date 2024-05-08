%%% EX1#3
% author:   YANG Yk
% date:     2024/04/17 08:39

clc;
clear;

% define
X = 2;
Y = 1;
N = 50;
M = 50;
dx = X/N;
dy = Y/M;
x = 0:dx:X;
y = 0:dy:Y;

% operator
A = sparse((N+1)*(M+1),(N+1)*(M+1));
b = zeros((N+1)*(M+1),1);

p = 1/dx^2;
q = 1/dy^2;
for i = 1:M+1
    for j = 1:N+1
    k = (j-1)*(M+1)+i;
    if(i==1||i==M+1)
        A(k,k) = 1;
        b(k,1) = 0;
    elseif(j==1)
        A(k,k) = 1;
        b(k,1) = sin(pi*i*dy);
    elseif(j==N+1)
        A(k,k) = 1;
        b(k,1) = exp(2)*sin(pi*i*dy);
    else
        A(k,k) = -2*p-2*q;
        A(k,k-1) = q;
        A(k,k+1) = q;
        A(k,k+(M+1)) = p;
        A(k,k-(M+1)) = p;
        b(k,1) = (1-pi^2)*exp(j*dx)*sin(pi*i*dy);
    end
    end 
end

uij = A\b;
u = reshape(uij,M+1,N+1);

% figure
figure;
surf(x,y,u);
xlabel('x');
ylabel('y');
zlabel('u');
title('Ex3');
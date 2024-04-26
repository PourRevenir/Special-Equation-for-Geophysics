% Copyright(C), 2024

%%% Test#12:    Compute the Poisson equation definite solution problem 
%%%             used by Finite-Difference-Method

% Author:       YANG Yk    #8211221221
% Class:        2201, Geophysics
% Advisor:      TONG Xz
% Date:         2024/04/05 05:18
%

% clear
clear;

% definition
a = 1;
n = 100;
dx = a/n;
x = 0:dx:a;
A = sparse(n+1,n+1);
b = sparse(n+1,1);

% boundary conditions
A(1,1) = -1;
A(1,2) = 1;
A(n+1,n+1) = 1;
b(1) = 0;
b(n+1) = 0;

% operator
dx2 = dx^2;
k1 = 1/dx2;
k2 = -2*k1;
for i = 2:n
    A(i,i-1:i+1) = [k1 k2 k1];
    b(i) = exp(x(i));
end

% solute
u = A\b;

% figure
figure;
plot(x,u,'ro');grid on
xlabel('x');
ylabel('u');
legend('Solution of FDM')
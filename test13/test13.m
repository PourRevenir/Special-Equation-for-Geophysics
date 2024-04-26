% Copyright(C), 2024

%%% Test#13:    Compute the Poisson equation definite solution problem 
%%%             used by Finite-Difference-Method

% Author:       YANG Yk    #8211221221
% Class:        2201, Geophysics
% Advisor:      TONG Xz
% Date:         2024/04/05 05:18
%

% clear
clear;

% define parameter
X = 10;
Y = 10;         % computational domain
M = 25;
N = 25;         % number of divided grids
dx = X/M;
dy = Y/N;       % difference
x = 0:dx:X;     
y = 0:dy:Y;     

% define operator
A = sparse((M+1)*(N+1),(N+1)*(M+1));    % left matrix(operator)
b = zeros((M+1)*(N+1),1);               % right vector

p = 1/dx^2;
q = 1/dy^2;

for i = 1:N+1               % i in y-axis
    for j = 1:M+1           % j in x-axis
    k = (j-1)*(N+1)+i;      % rownum of u(i,j)

    % boundary conditions
        if(i==1||j==1||j==M+1)
            A(k,k) = 1;     % u(0,y)=u(y,0)=u(x,0)=0
            b(k,1) = 0;
        elseif(i==N+1)
            A(k,k) = 1;     % u(x,10)=100
            b(k,1) = 100;
        else
            A(k,k) = -2*p-2*q;  % u(i,j)
            A(k,k-1) = q;       % u(i,j-1)
            A(k,k+1) = q;       % u(i,j+1)
            A(k,k-(N+1)) = p;   % u(i-1,j)
            A(k,k+(N+1)) = p;   % u(i+1,j)
            b(k,1) = 1;
        end
    end
end

% solute system of linear equations
uij = A\b;
u = reshape(uij,N+1,M+1);

% figure
figure;
surf(x,y,u);
xlabel('x');
ylabel('y');
zlabel('z');
colorbar;
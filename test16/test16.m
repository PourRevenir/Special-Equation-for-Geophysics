% Copyright(C), 2024
%%% Assignment 16
% Author:       YANG Yk https://github.com/PourRevenir/
% Institution:  Department of Applied Geophysics, CSU
% Advisor:      Dr.TONG Xz
% Date:         2024/05/36 06:09
%

% clear
clear;
close all;
clc;

% definition
s1 = 0.1;
s2 = 0.01;
mu = 4*pi*10^(-7);
h = 1000;

Z = 3000;
N = 300;
dz = Z/N;
z = 0:dz:Z;

% initial
s = zeros(N,1);
s(1:h/dz) = s1;
s(h/dz+1:N) = s2;

b = zeros(N+1,1);
b(1) = 1;

m = 14;
pa = zeros(2*m+1,1);
phase = zeros(2*m+1,1);
w = zeros(2*m+1,1);
for j = -m:m
    w(j+m+1) = 1.5^j;

    % operator
    A = sparse(N+1,N+1);
    A(1,1) = 1;
    A(N+1,N)=-1/dz;
    A(N+1,N+1)=-1/dz+sqrt(-1i*w(j+m+1)*mu*s(N));
    a = 1/dz^2;q = 0.5*1i*w(j+m+1)*mu;r=-2*a;
    for i = 2:N
        A(i,i-1) = a;
        A(i,i+1) = a;
        A(i,i) = q*(s(i-1)+s(i))+r;
    end
    E = A\b;

    Z = E(1)/((-11*E(1)+18*E(2)-9*E(3)+2*E(4))/(6*dz*1i*w(j+m+1)*mu));
    pa(j+m+1) = abs(Z)^2/(w(j+m+1)*mu);
    phase(j+m+1) = rad2deg(atan(imag(Z)/real(Z)));
end

% figure
figure;
subplot(2,1,1);
semilogx(w,pa,'r-');grid on
xlabel('频率/Hz');
ylabel('视电阻率/Ωm');
subplot(2,1,2);
semilogx(w,phase,'b-');grid on
xlabel('频率/Hz');
ylabel('相位/(°)');
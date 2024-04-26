% 分离变量法求解位势方程图示
clear;

U0 = 100;
x = 0:0.1:10;
y = 0:0.1:10;
[X,Y] = meshgrid(x,y);
N = 100;

uxy = zeros(length(y),length(x));
for n = 1:2:N
    uxy = (1/(n*sinh(n*pi)))*sin(n*pi*X/10).*sinh(n*pi*Y/10)+uxy;
end
uxy = 4*U0*uxy/pi;

% 绘制图像
contourf(X,Y,uxy,20);
xlabel('x');
ylabel('y');
colorbar;
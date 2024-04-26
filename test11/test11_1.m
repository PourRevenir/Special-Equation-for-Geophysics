% 问题1结果图示
clear;

x = -1:0.02:1;
t = 0:0.02:1;
[X,T] = meshgrid(x,t);

k = 1/(4*pi);
uxt = -sin(4*pi*T).*sin(2*pi*X)*k;

% 绘制图像
figure;
surf(X,T,uxt);
xlabel('x');
ylabel('t');
zlabel('u');
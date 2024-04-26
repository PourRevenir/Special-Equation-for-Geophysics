% 问题2结果图示
clear;

x = -1:0.02:1;
t = 0:0.001:0.01;
[X,T] = meshgrid(x,t);

k = 5*pi;
uxt = exp(-k*k*T).*sin(k*X);

% 绘制图像
figure;
surf(X,T,uxt);
xlabel('x');
ylabel('t');
zlabel('u');
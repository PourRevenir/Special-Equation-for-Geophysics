% 图示求解结果
clear;
    
% 定义参数
x = 0:0.01:1;
t = 0:0.001:0.014;
[X,T]=meshgrid(x,t);

uxt = 3*sin(5*pi*X).*exp(-(5*pi)^2*T)+100;

% 绘制图像
figure;
surf(x,t,uxt);
colorbar;
xlabel('x');
ylabel('t');
zlabel('u');
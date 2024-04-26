% 图示求解结果
clear;
    
% 定义参数
x = 0:0.1:1;
t = 0:0.1:1;
[X,T]=meshgrid(x,t);

uxt = 3*sin(5*pi*X).*exp(-(5*pi)^2*T)+100;

% 绘制图像
figure;
contourf(X,T,uxt,20);
colorbar;
xlabel('x');
ylabel('t');

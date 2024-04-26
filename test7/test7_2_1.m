 % 问题2.1达朗贝尔解图示
clear;

x = -4:0.1:4;
t = 0:0.1:2.5;
[X,T] = meshgrid(x,t);
uxt = 1.5*(exp(-(X+T).^2)+exp(-(X-T).^2));

% 绘制图像
figure;
surf(X,T,uxt);
xlabel('x');
ylabel('t');
zlabel('u');
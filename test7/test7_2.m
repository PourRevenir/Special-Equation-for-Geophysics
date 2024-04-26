% 问题2.2达朗贝尔解图示
clear;

x = -10:0.5:10;
t = 0:0.1:2;
[X,T] = meshgrid(x,t);
uxt = -(exp(-(X+3*T).^2)-exp(-(X-3*T).^2))/12;

% 绘制图像
figure;
surf(X,T,uxt);
xlabel('x');
ylabel('t');
zlabel('u');
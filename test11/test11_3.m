% 问题3结果图示
clear;

x = 0:0.05:1;
y = 0:0.05:1;
[X,Y] = meshgrid(x,y);

uxy = X.*Y+X+Y;

% 绘制图像
figure;
surf(X,Y,uxy);
xlabel('x');
ylabel('t');
zlabel('u');
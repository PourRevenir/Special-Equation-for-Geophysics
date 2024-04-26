% 一维无限长杆热传导问题结果图示
clear;

x = -10:0.01:10;
a = [1 3 5];
for i = 1:size(a,2)
    u(i, : ) = 0.25*(erf(0.5*(x+a(i)))-erf(0.5*(x-a(i))))/a(i);
end

% 绘制图像
plot(x,u);
xlabel('x');
ylabel('y');
legend('a=1','a=3','a=5');
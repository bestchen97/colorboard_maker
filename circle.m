m = 250;                                %设置图片大小
n = 250;
a = zeros(m,n,3);

x = linspace(-n,n,n);                   %建立图片坐标
y = linspace(m,-m,m);
[X,Y] = meshgrid(x,y);

theta = atan2(-X,-Y);                   %计算坐标点对应的角度，转化到0~1范围作为h分量
theta = theta - min(min(theta));
theta = theta/max(max(theta));

radius = sqrt(X.^2 + Y.^2);             %计算坐标点对应的径向坐标
rmax = radius(round(n/8),round(m/2));   %选取最大半径值
radius(radius>rmax) = 0;                %最大半径以外赋值为0,即外圈饱和度为0
r = radius/rmax;                        %转换到0~1范围作为s分量

value = 1;                            %设置亮度值范围0~1，亮度只针对园形区域范围内
v = ones(m,n);
v(r>0) = value;

figure(1);
subplot(1,3,1),imshow(theta),title('h'),colorbar;
subplot(1,3,2),imshow(r),title('s'),colorbar;
subplot(1,3,3),imshow(v),title('v'),colorbar;

a(:,:,1) = theta;
a(:,:,2) = r;
a(:,:,3) = v;

a = hsv2rgb(a);                         %赋值三个分量后转换为rgb
figure(2);
imshow(a);
imwrite(a,'circle.bmp');
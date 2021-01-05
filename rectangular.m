m = 200;                            %设置图片大小为m*n
n = 250;
a = zeros(m,n,3);

x = linspace(0,1,n);
y = linspace(1,0,m);
[X,Y] = meshgrid(x,y);              %按照坐标生成分量

h = X;
s = Y;
value = 1;                          %设置亮度分量的值，范围0~1,此时为全图统一亮度情况
v = ones(m,n)*value;

% x = linspace(0,1,n);              %此段四行注释为设置亮度分量为渐变值，范围0.4~1,
% y = linspace(1,0.4,m);            %此时为全图不统一亮度情况
% [X,Y] = meshgrid(x,y);
% v = ones(m,n).*Y;                 

figure(1);
subplot(1,3,1),imshow(h),title('h'),colorbar;
subplot(1,3,2),imshow(s),title('s'),colorbar;
subplot(1,3,3),imshow(v),title('v'),colorbar;

a(:,:,1) = h;
a(:,:,2) = s;
a(:,:,3) = v;
a = hsv2rgb(a);                     %赋值三个分量后转换为rgb
figure(2);
imshow(a);
imwrite(a,'rectangular.bmp');
m = 200;                            %����ͼƬ��СΪm*n
n = 250;
a = zeros(m,n,3);

x = linspace(0,1,n);
y = linspace(1,0,m);
[X,Y] = meshgrid(x,y);              %�����������ɷ���

h = X;
s = Y;
value = 1;                          %�������ȷ�����ֵ����Χ0~1,��ʱΪȫͼͳһ�������
v = ones(m,n)*value;

% x = linspace(0,1,n);              %�˶�����ע��Ϊ�������ȷ���Ϊ����ֵ����Χ0.4~1,
% y = linspace(1,0.4,m);            %��ʱΪȫͼ��ͳһ�������
% [X,Y] = meshgrid(x,y);
% v = ones(m,n).*Y;                 

figure(1);
subplot(1,3,1),imshow(h),title('h'),colorbar;
subplot(1,3,2),imshow(s),title('s'),colorbar;
subplot(1,3,3),imshow(v),title('v'),colorbar;

a(:,:,1) = h;
a(:,:,2) = s;
a(:,:,3) = v;
a = hsv2rgb(a);                     %��ֵ����������ת��Ϊrgb
figure(2);
imshow(a);
imwrite(a,'rectangular.bmp');
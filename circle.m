m = 250;                                %����ͼƬ��С
n = 250;
a = zeros(m,n,3);

x = linspace(-n,n,n);                   %����ͼƬ����
y = linspace(m,-m,m);
[X,Y] = meshgrid(x,y);

theta = atan2(-X,-Y);                   %����������Ӧ�ĽǶȣ�ת����0~1��Χ��Ϊh����
theta = theta - min(min(theta));
theta = theta/max(max(theta));

radius = sqrt(X.^2 + Y.^2);             %����������Ӧ�ľ�������
rmax = radius(round(n/8),round(m/2));   %ѡȡ���뾶ֵ
radius(radius>rmax) = 0;                %���뾶���⸳ֵΪ0,����Ȧ���Ͷ�Ϊ0
r = radius/rmax;                        %ת����0~1��Χ��Ϊs����

value = 1;                            %��������ֵ��Χ0~1������ֻ���԰������Χ��
v = ones(m,n);
v(r>0) = value;

figure(1);
subplot(1,3,1),imshow(theta),title('h'),colorbar;
subplot(1,3,2),imshow(r),title('s'),colorbar;
subplot(1,3,3),imshow(v),title('v'),colorbar;

a(:,:,1) = theta;
a(:,:,2) = r;
a(:,:,3) = v;

a = hsv2rgb(a);                         %��ֵ����������ת��Ϊrgb
figure(2);
imshow(a);
imwrite(a,'circle.bmp');
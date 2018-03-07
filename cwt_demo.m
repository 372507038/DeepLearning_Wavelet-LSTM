fs=1024;
t=1/fs:1/fs:1;
f1=100;f2=200;f3=300;
s=sin(2*pi*f1*t.*(t>=0&t<0.3))+2*sin(2*pi*f2*t.*(t>=0.3&t<0.8))+3*sin(2*pi*f3*t.*(t>=0.8&t<=1));

figure(1)
plot(t,s)
figure;

%% %%%%%%%%%%%%%%%С��ʱƵͼ����%%%%%%%%%%%%%%%%%%
wavename='cmor3-3'; %ѡ�ô������������Ƶ�ʾ�Ϊ3�ĸ�morletС��
totalscal=256;      %�߶����еĳ��ȣ���scal�ĳ���
fc=centfrq(wavename);   %С��������Ƶ��
cparam=2*fc*totalscal;  %Ϊ�õ����ʵĳ߶�������Ĳ���
a=totalscal:-1:1;
scal=cparam./a;         %�õ������߶ȣ���ʹת���õ�Ƶ������Ϊ�Ȳ�����

coefs=cwt(s,scal,wavename);     %�õ�С��ϵ��
f=scal2frq(scal,wavename,1/fs);    %���߶�ת��ΪƵ��

figure(2)
imagesc(t,f,abs(coefs));            %����ɫ��ͼ
colorbar;
xlabel('ʱ�� t/s');
ylabel('Ƶ�� f/Hz');
title('С��ʱƵͼ(��ά)');

%%
figure(3)
mesh(t,f,abs(coefs)); 
axis tight; 
colorbar;
xlabel('ʱ�� t/s');
ylabel('Ƶ�� f/Hz'); 
title(['С��ʱƵͼ����ά��','(',num2str(wavename),')']);
%%
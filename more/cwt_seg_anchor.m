
%% ��ȡ����
buf = load('data.txt');
s = buf';
buf_long = size(s,2);
t=1/buf_long:1/buf_long:1;

figure(1) % ����ԭʼͼ��
plot(t,s)


%% %%%%%%%%%%%%%%%С��ʱƵͼ����%%%%%%%%%%%%%%%%%%
wavename='cmor3-3'; %ѡ�ô������������Ƶ�ʾ�Ϊ3�ĸ�morletС��
totalscal=128 ;      %�߶����еĳ��ȣ���scal�ĳ���
fc=centfrq(wavename);   %С��������Ƶ��
% fc = 730;
cparam=2*fc*totalscal;  %Ϊ�õ����ʵĳ߶�������Ĳ���
a=totalscal:-1:1;       %�߶�����
scal=cparam./a;         %�õ������߶ȣ���ʹת���õ�Ƶ������Ϊ�Ȳ�����

delta = 500000;         %����Ƶ��

coefs=cwt(s,scal,wavename);     %�õ�С��ϵ��
f=scal2frq(scal,wavename,1/delta);    %���߶�ת��ΪƵ��

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
f=fitsread('E:\FITS\20140421_180444797.fit');
E_a=mean(f(:));%����
D_a=std2(f);%������
%*******ȥ����********
s=ones(1024)*(E_a+D_a);
s1=f-s;
s2=abs(s1);
image=(s1+s2)*0.5;%ȥ�������ͼƬ 
E_i=mean(image(:));%��ʵͼƬ������
[xi,yi]=find(image==max(max(image)));%���ֵ���ڵ������
p=55;%ѡȡ���������ĵ��߽�ľ���  �������ֶ�ѡȡ
imagem=image(xi-p:xi+p,yi-p:yi+p);%ѡȡ������

 a=fitsread('E:\FITS\20140421_130433528.fit');
[m,n]=size(a);
 max=a(1,1);%�ҵ�ͼ������ֵ
 for i=1:m
    for j=1:n
        if a(i,j)>max   max=a(i,j);
        end
    end
 end
[x,y]=find(a==max);%���ֵ���ڵ������
p=7;%ѡȡ���������ĵ��߽�ľ���
a1=a(x-p:x+p,y-p:y+p);%ѡȡ������
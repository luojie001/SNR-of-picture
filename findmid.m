function [fz] = findmid( f )
%����ͼ���лҶ�ֵ��6500-8000Ϊ��ֵ�������snr
fb=removeb(f);
[m,n]=find(6500<f&f<8000);
num=size(m);
%��ȥ�߽��
f3=zeros(1024,1024);
for i=1:num(1,1)
    if 100<m(i)&m(i)<924
        if 100<n(i)&n(i)<924
        f3(m(i),n(i))=1;
        end
    end
end
[x,y]=find(f3==1);
num1=size(x);%�ҳ����������ĵ�ĸ���
k=15;%�������ҵ�����Ĵ�СΪ2*k+1
j=1;
fz=f(x(j)-k:x(j)+k,y(j)-k:y(j)+k);%���ҵ�����
fbz=fb(x(j)-k:x(j)+k,y(j)-k:y(j)+k);
fbo=fbz;
fbo(5:25,5:25)=0;
%����������������
while  f(x(j),y(j))~=max(max(fz))&j<num1(1,1)&(max(max(fbo))~=0) 
     j=j+1;
     fo=fb(x(j)+8,y(j)-8);
     fz=f(x(j)-k:x(j)+k,y(j)-k:y(j)+k);  
     fbz=fb(x(j)-k:x(j)+k,y(j)-k:y(j)+k);
     fbo=fbz;
     fbo(5:25,5:25)=0;
end
imshow(fbz)
end


function [fz] = findmid_newdate( f )
%����ͼ���лҶ�ֵ��E_f+3*D_f��f_max-2*D_fΪ��ֵ�������snr
fb=removeb_newdate(f);
f_max=max(max(f));
E_f=mean2(f);
D_f=std2(f);
[m,n]=find(E_f+3*D_f<f&f<f_max-2*D_f);
num=size(m);
%��ȥ�߽��
[M,N]=size(f);
f3=zeros(M,N);
s_bor=100;
for i=1:num(1,1)
    if s_bor<m(i)&m(i)<M-s_bor
        if s_bor<n(i)&n(i)<N-s_bor
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
fbo(10:20,10:20)=0;
%����������������
while  f(x(j),y(j))~=max(max(fz))&j<num1(1,1)&(max(max(fbo))~=0) 
     j=j+1;
     fz=f(x(j)-k:x(j)+k,y(j)-k:y(j)+k);  
     fbz=fb(x(j)-k:x(j)+k,y(j)-k:y(j)+k);
     fbo=fbz;
     fbo(10:10,10:20)=0;
end
%imshow(fbz)
end


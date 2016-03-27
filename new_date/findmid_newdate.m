function [fz] = findmid_newdate( f )
%计算图像中灰度值以E_f+3*D_f到f_max-2*D_f为峰值的区域的snr
fb=removeb_newdate(f);
f_max=max(max(f));
E_f=mean2(f);
D_f=std2(f);
[m,n]=find(E_f+3*D_f<f&f<f_max-2*D_f);
num=size(m);
%除去边界点
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
num1=size(x);%找出满足条件的点的个数
k=15;%设置所找的区域的大小为2*k+1
j=1;
fz=f(x(j)-k:x(j)+k,y(j)-k:y(j)+k);%所找的区域
fbz=fb(x(j)-k:x(j)+k,y(j)-k:y(j)+k);
fbo=fbz;
fbo(10:20,10:20)=0;
%所找区域满足条件
while  f(x(j),y(j))~=max(max(fz))&j<num1(1,1)&(max(max(fbo))~=0) 
     j=j+1;
     fz=f(x(j)-k:x(j)+k,y(j)-k:y(j)+k);  
     fbz=fb(x(j)-k:x(j)+k,y(j)-k:y(j)+k);
     fbo=fbz;
     fbo(10:10,10:20)=0;
end
%imshow(fbz)
end


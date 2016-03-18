function [fz] = findmid( f )
%计算图像中灰度值以6500-8000为峰值的区域的snr
fb=removeb(f);
[m,n]=find(6500<f&f<8000);
num=size(m);
%除去边界点
f3=zeros(1024,1024);
for i=1:num(1,1)
    if 100<m(i)&m(i)<924
        if 100<n(i)&n(i)<924
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
fbo(5:25,5:25)=0;
%所找区域满足条件
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


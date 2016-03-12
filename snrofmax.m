clear;
clear all;
clc;

f=fitsread('E:\FITS\20140421_130433528.fit');
E_a=mean(f(:));%期望
D_a=std2(f);%均方差
%*******去背景********
s=ones(1024)*(E_a+D_a);
s1=f-s;
s2=abs(s1);
image=(s1+s2)*0.5;%去背景后的图片 
E_i=mean(image(:));%真实图片的期望
%*******最亮点所在的区域********
[xi,yi]=find(image==max(max(image)));%最大值所在点的坐标
n=0;s=0;w=0;e=0;
while (image(xi-n,yi))>0
    n=n+1;
end
while (image(xi+s,yi))>0
    s=s+1;
end
while (image(xi,yi-w))>0
    w=w+1;
end
while (image(xi,yi+e))>0
    e=e+1;
end
imagemax=f(xi-n:xi+s,yi-w:yi+e);%选取的区域
S=zeros(3,3);%取3*3的模板
ph=zeros(n+s-2,w+e-2);%用ph来存放 所求的std
for k=1:n+s-2
    for l=1:w+e-2
    S=imagemax(k:k+2,l:l+2);
    c=std(S(:));
     ph(k,l)=c;
    end
end
phmax=max(max(ph));
phmin=min(min(ph));
snr=10*log(phmax/phmin);
snr



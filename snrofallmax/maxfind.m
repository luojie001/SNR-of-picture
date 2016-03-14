function [ imagem] = maxfind(f)
%寻找最大值所在的区域
E_a=mean(f(:));%期望
D_a=std2(f);%均方差
%*******去背景********
s=ones(1024)*(E_a+D_a);
s1=f-s;
s2=abs(s1);
image=(s1+s2)*0.5;%去背景后的图片 
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
imagem=f(xi-n:xi+s,yi-w:yi+e);%选取的区域
end


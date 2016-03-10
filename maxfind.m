f=fitsread('E:\FITS\20140421_180444797.fit');
E_a=mean(f(:));%期望
D_a=std2(f);%均方差
%*******去背景********
s=ones(1024)*(E_a+D_a);
s1=f-s;
s2=abs(s1);
image=(s1+s2)*0.5;%去背景后的图片 
E_i=mean(image(:));%真实图片的期望
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
imagem=image(xi-n:xi+s,yi-w:yi+e);%选取的区域

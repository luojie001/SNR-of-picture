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
p=55;%选取的区域中心到边界的距离  这里先手动选取
imagem=image(xi-p:xi+p,yi-p:yi+p);%选取的区域

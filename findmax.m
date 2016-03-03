 a=fitsread('E:\FITS\20140421_130433528.fit');
[m,n]=size(a);
 max=a(1,1);%找到图像的最大值
 for i=1:m
    for j=1:n
        if a(i,j)>max   max=a(i,j);
        end
    end
 end
[x,y]=find(a==max);%最大值所在点的坐标
p=7;%选取的区域中心到边界的距离
a1=a(x-p:x+p,y-p:y+p);%选取的区域
# remove background
a=fitsread('E:\FITS\20140421_130433528.fit');
E_a=mean(a(:));%期望
D_a=std2(a);%均方差
k=E_a+D_a;
for i=1:1024    %
    for j=1:1024
        if a(i,j)<=k;
            a(i,j)=0;
        end
    end
end


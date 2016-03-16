function [snr] = snrback(inputf)
%无星象图像的信噪比
[m,n]=size(inputf);
E_a=mean(inputf(:));%期望
D_a=std2(inputf);%均方差
s1=ones(m,n)*(E_a-D_a);
s2=ones(m,n)*(E_a+D_a);
k=50;
a=zeros(k+1);
while mean(a(:))==0;
x=round((1024-k)*rand(1));
y=round((1024-k)*rand(1));
f1=inputf(x:x+k,y:y+k);
if max(max(f1))<s2
    %if min(min(f1))>s1
        a=f1;
    %end
end
end
snr=snrmy(a);
end


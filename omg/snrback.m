function [snr] = snrback(f)
%������ͼ��������
[m,n]=size(f);
E_a=mean(f(:));%����
D_a=std2(f);%������
s1=ones(m,n)*(E_a-D_a);
s2=ones(m,n)*(E_a+D_a);
k=50;
a=zeros(k+1);
while mean(a(:))==0;
x=floor((1024-k)*rand(1));
while x==0
    x=floor((1024-k)*rand(1));
end
 y=floor((1024-k)*rand(1));
 while y==0
    y=floor((1024-k)*rand(1));
 end
    
f1=f(x:x+k,y:y+k);
if max(max(f1))<s2
        a=f1;
end
end
snr=snrmy(a);
end


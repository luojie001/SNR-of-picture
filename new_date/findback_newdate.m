function [a] = findback_newdate(f)
%������ͼ��������
[m,n]=size(f);
E_a=mean(f(:));%����
D_a=std2(f);%������
s2=ones(m,n)*(E_a+3*D_a);
k=25;
a=zeros(k+1);
while mean(a(:))==0;
x=floor((m-k)*rand(1));
while x==0
    x=floor((m-k)*rand(1));
end
 y=floor((n-k)*rand(1));
 while y==0
    y=floor((n-k)*rand(1));
 end
    
f1=f(x:x+k,y:y+k);
if max(max(f1))<s2
        a=f1;
end
end
end


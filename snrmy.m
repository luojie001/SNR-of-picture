function [snr] =snrmy(f)
x=8;%�ֲ�������ѡ�Ĵ�С
S=zeros(x+1,x+1);%ȡ3*3��ģ��
[m,n]=size(f);
ph=zeros(m-x,n-x);%��ph����� �����std
for k=1:m-x
    for l=1:n-x
    S=f(k:k+x,l:l+x);
     ph(k,l)=std(S(:));
    end
end
phmax=max(max(ph));
phmin=min(min(ph));
snr=10*log(phmax/phmin);
end


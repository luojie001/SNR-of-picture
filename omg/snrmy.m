function [snr] =snrmy(f)
%�������
x=8;%�ֲ�������ѡ�Ĵ�С
[m,n]=size(f);
ph=zeros(m-x,n-x);%��ph����� �����std
for k=1:m-x
    for l=1:n-x
    s=f(k:k+x,l:l+x);
     ph(k,l)=std(s(:));
    end
end
phmax=max(max(ph));
phmin=min(min(ph));
snr=10*log(phmax/phmin);
end

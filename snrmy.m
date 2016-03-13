function [snr] =snrmy(f)
x=8;%局部区域所选的大小
S=zeros(x+1,x+1);%取3*3的模板
[m,n]=size(f);
ph=zeros(m-x,n-x);%用ph来存放 所求的std
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


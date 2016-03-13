function [snr] =snrmy(f)
S=zeros(3,3);%取3*3的模板
[m,n]=size(f);
ph=zeros(m-2,n-2);%用ph来存放 所求的std
for k=1:m-2
    for l=1:n-2
    S=f(k:k+2,l:l+2);
     ph(k,l)=std(S(:));
    end
end
phmax=max(max(ph));
phmin=min(min(ph));
snr=10*log(phmax/phmin);
end


function [image ] = removeb(  image )
E_a=mean(image(:));%����
D_a=std2(image);%������
s=ones(1024)*(E_a+D_a);
s1=image-s;
s2=abs(s1);
image=(s1+s2)*0.5;
end


file_path='E:\FITS';
%450��ͼ���������ĵ�Ĺ켣
img_path_list=dir(fullfile(file_path,'*.fit'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
new=zeros(1024);
if img_num>0 %����������ͼ��
img=zeros(1024,1024,450);
for j=1:img_num
image_name=img_path_list(j).name;%ͼ����
image=fitsread(fullfile(file_path,image_name));
E_a=mean(image(:));%����
D_a=std2(image);%������
s=ones(1024)*(E_a+D_a);
s1=image-s;
s2=abs(s1);
img=(s1+s2)*0.5;
[rows,cols]=find(img==max(max(img)));
new(rows,cols)=1;
%fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));
%��ʾ���ڴ����ͼ����
end
end
imshow(new)
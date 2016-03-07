 function [img] =OpfitsRemoveb( file_path)
%函数运行需要一分多钟，去背景后的图片可以调用
img_path_list=dir(fullfile(file_path,'*.fit'));
%获取该文件夹中所有的fit格式的图像
img_num=length(img_path_list);
%获取图像总数量
if img_num>0 %满足条件的图像
img=zeros(1024,1024,450); %定义三维数组
for j=1:img_num
image_name=img_path_list(j).name;%图像名
image=fitsread(fullfile(file_path,image_name));
E_a=mean(image(:));%期望
D_a=std2(image);%均方差
s=ones(1024)*(E_a+D_a);
s1=image-s;
s2=abs(s1);
img(:,:,j)=(s1+s2)*0.5;

%fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));
%显示正在处理的图像名
end
end
end

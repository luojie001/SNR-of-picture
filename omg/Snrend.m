function [c] = Snrend( file_path )
%读取图片，并计算信噪比
img_path_list=dir(fullfile(file_path,'*.fit'));
%获取该文件夹中所有的fit格式的图像
img_num=length(img_path_list);
%获取图像总数量
  c=zeros(3,img_num);
 if img_num>0 %满足条件的图像
        for j=1:img_num
        image_name=img_path_list(j).name;%图像名
        image=fitsread(fullfile(file_path,image_name));
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
%*******最亮的星所在的区域***
         [m,n]=size(image);
         img1(:,:,j)=zeros(m,n);
         img1(:,:,j)=image;
         imgm=maxfindf(img1(:,:,j));
        c(1,j)= round(snrmy(imgm));
%****灰度值在在6500-8000的
        img=findmid(image);
        c(2,j)=round(snrmy(img));
%*****背景区域***********
        c(3,j)=round(snrback(image));
        end
    else fprintf('error------no *.fits in this file') ;   
 end

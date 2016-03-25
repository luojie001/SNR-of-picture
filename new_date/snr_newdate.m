function [ c] = snr_newdate( file_path )
%读取图片，并计算信噪比
img_path_list=dir(fullfile(file_path,'*.fits'));
%获取该文件夹中所有的fit格式的图像
img_num=length(img_path_list);
%获取图像总数量
  %c=zeros(3,img_num);
  k=0;
 if img_num>0 %满足条件的图像
        for j=1:img_num
        image_name=img_path_list(j).name;%图像名
        image=fitsread(fullfile(file_path,image_name));
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
        if max(max(removeb_newdate(image)))~=0
            k=k+1;
%*******最亮的星所在的区域***
         [m,n]=size(image);
         img1(:,:,j)=zeros(m,n);
         img1(:,:,j)=image;
         imgm=findmax_newdate(img1(:,:,j));
        c(1,k)= round(snrmy_newdate(imgm));
%****灰度值在在E_f+3*D_f到f_max-2*D_f
        img=findmid_newdate(image);
        c(2,k)=round(snrmy_newdate(img));
%*****背景区域***********
        back=findback_newdate(image);
        c(3,k)=round(snrmy_newdate(back));
%******剔除无效数据*****
        while c(1,k)==0||c(2,k)==0||c(3,k)==0||c(1,k)<c(2,k)||c(2,k)<c(3,k)
            k=k-1;
        end
        else   
       fprintf('无效图片\n');
        end
        end
    else fprintf('error------no *.fits in this file') ;   
 end
end


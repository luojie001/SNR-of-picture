function [img] =openfits( file_path)
%读取制定路径下的*.fit文件
img_path_list=dir(fullfile(file_path,'*.fit'));
%获取该文件夹中所有的fit格式的图像
img_num=length(img_path_list);
%获取图像总数量
    if img_num>0 %满足条件的图像
        for j=1:img_num
        image_name=img_path_list(j).name;%图像名
        image=fitsread(fullfile(file_path,image_name));
        [m,n]=size(image);
        img(:,:,j)=zeros(m,n);
        img(:,:,j)=image;
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
        %显示正在处理的图像名
        end
    else fprintf('error------no *.fits in this file') ;   
    end
end
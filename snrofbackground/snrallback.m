function [d]=snrallback( file_path)
%读取图片，寻找最大值所在区域，并计算信噪比
img_path_list=dir(fullfile(file_path,'*.fit'));
%获取该文件夹中所有的fit格式的图像
img_num=length(img_path_list);
%获取图像总数量
d=zeros(1,img_num);
    if img_num>0 %满足条件的图像
        for j=1:img_num
        image_name=img_path_list(j).name;%图像名
        image=fitsread(fullfile(file_path,image_name));
        d(1,j)=snrback(image);
       fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
        %显示正在处理的图像名
        end
    else fprintf('error------no *.fits in this file') ;   
    end
end
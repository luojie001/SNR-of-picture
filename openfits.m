function [img] =openfits( file_path)
%������������  ����Ҳ��ʵ��  ̫�� Ҫ��������
img_path_list=dir(fullfile(file_path,'*.fit'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
if img_num>0 %����������ͼ��
for j=1:img_num
image_name=img_path_list(j).name;%ͼ����
image=fitsread(fullfile(file_path,image_name));
img(:,:,j)=image;
%fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));
%��ʾ���ڴ����ͼ����
end
end
end


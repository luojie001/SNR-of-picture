function [d]=snrallback( file_path)
%��ȡͼƬ��Ѱ�����ֵ�������򣬲����������
img_path_list=dir(fullfile(file_path,'*.fit'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
d=zeros(1,img_num);
    if img_num>0 %����������ͼ��
        for j=1:img_num
        image_name=img_path_list(j).name;%ͼ����
        image=fitsread(fullfile(file_path,image_name));
        d(1,j)=snrback(image);
       fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
        %��ʾ���ڴ����ͼ����
        end
    else fprintf('error------no *.fits in this file') ;   
    end
end
function [c] = Snrend( file_path )
%��ȡͼƬ�������������
img_path_list=dir(fullfile(file_path,'*.fit'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
  c=zeros(3,img_num);
 if img_num>0 %����������ͼ��
        for j=1:img_num
        image_name=img_path_list(j).name;%ͼ����
        image=fitsread(fullfile(file_path,image_name));
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
%*******�����������ڵ�����***
         [m,n]=size(image);
         img1(:,:,j)=zeros(m,n);
         img1(:,:,j)=image;
         imgm=maxfindf(img1(:,:,j));
        c(1,j)= round(snrmy(imgm));
%****�Ҷ�ֵ����6500-8000��
        img=findmid(image);
        c(2,j)=round(snrmy(img));
%*****��������***********
        c(3,j)=round(snrback(image));
        end
    else fprintf('error------no *.fits in this file') ;   
 end

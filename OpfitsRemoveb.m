 function [img] =OpfitsRemoveb( file_path)
%����������Ҫһ�ֶ��ӣ�ȥ�������ͼƬ���Ե���
img_path_list=dir(fullfile(file_path,'*.fit'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
    if img_num>0 %����������ͼ��
        for j=1:img_num
        image_name=img_path_list(j).name;%ͼ����
        image=fitsread(fullfile(file_path,image_name));
        [m,n]=size(image);
        img(:,:,j)=zeros(m,n);
        E_a=mean(image(:));%����
        D_a=std2(image);%������
        s=ones(1024)*(E_a+D_a);
        s1=image-s;
        s2=abs(s1);
        img(:,:,j)=(s1+s2)*0.5;
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
        %��ʾ���ڴ����ͼ����
        end
    else
     fprintf( 'error------no *.fit in this file\n');
    end
end
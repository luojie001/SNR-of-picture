function [ c] = snr_newdate( file_path )
%��ȡͼƬ�������������
img_path_list=dir(fullfile(file_path,'*.fits'));
%��ȡ���ļ��������е�fit��ʽ��ͼ��
img_num=length(img_path_list);
%��ȡͼ��������
  %c=zeros(3,img_num);
  k=0;
 if img_num>0 %����������ͼ��
        for j=1:img_num
        image_name=img_path_list(j).name;%ͼ����
        image=fitsread(fullfile(file_path,image_name));
        fprintf('%d %d %s\n',1i,j,strcat(file_path,image_name));
        if max(max(removeb_newdate(image)))~=0
            k=k+1;
%*******�����������ڵ�����***
         [m,n]=size(image);
         img1(:,:,j)=zeros(m,n);
         img1(:,:,j)=image;
         imgm=findmax_newdate(img1(:,:,j));
        c(1,k)= round(snrmy_newdate(imgm));
%****�Ҷ�ֵ����E_f+3*D_f��f_max-2*D_f
        img=findmid_newdate(image);
        c(2,k)=round(snrmy_newdate(img));
%*****��������***********
        back=findback_newdate(image);
        c(3,k)=round(snrmy_newdate(back));
%******�޳���Ч����*****
        while c(1,k)==0||c(2,k)==0||c(3,k)==0||c(1,k)<c(2,k)||c(2,k)<c(3,k)
            k=k-1;
        end
        else   
       fprintf('��ЧͼƬ\n');
        end
        end
    else fprintf('error------no *.fits in this file') ;   
 end
end


clear all;
clc;
close all;
%path_img='C:\Users\Nicky Nirlipta\Desktop\IITM 2nd sem\Advanced Signal And system\Assignment\Assignment1\Matlab Programs\Middle burry 2005';
% img_folder=dir(path_mb_2005);
path_img='C:\Users\Nicky Nirlipta\Desktop\IITM 2nd sem\Advanced Signal And system\Assignment\Assignment1\Matlab Programs\Rectified_stereoscopic_img';
img_folder=dir(path_img);
% blockSize=8;
maxd=50;
avgerr=[];
bad4_arr=[];
for i=3:4%length(dir(path_img))
    for bl=100:10:200
    image_sub_fold=dir(strcat(path_img,'\',(img_folder(i).name)));
    left_img=imread(strcat(path_img,'\',img_folder(i).name,'\',image_sub_fold(end-1).name));
    right_img=imread(strcat(path_img,'\',img_folder(i).name,'\',image_sub_fold(end).name));
 
   
 %  block matching 

    disp1=(blockmatching(left_img,right_img,bl,maxd));
    dispG=imread(strcat(path_img,'\',img_folder(i).name,'\',image_sub_fold(end-4).name));
    [a b]=size(dispG);
    d1=disp1(20:a-20,20-15:b-20-15);
    dG=double(dispG(20:a-20,20:b-20));
    avgerr=[avgerr,mean(mean(abs(dG-d1)))];
    bad4_temp=(abs(dG-d1));
    bad4=sum(bad4_temp(bad4_temp>4))/sum(sum(bad4_temp))*100;
    bad4_arr=[bad4_arr,bad4];
    

%     disp1_grey = rescale(disp1,0,1);

    end
   

 end

% % read ground truth disparity image
% 
% figure;imagesc(dispG);

 plot(10:5:50,avgerr)
 label()
% title('Ground Truth Image');
% 
% 
% 
% % error calculation
% [a b]=size(dispG);
% d1=disp1(20:a-20,20-15:b-20-15);
% 
% dG=double(dispG(20:a-20,20:b-20));
% 
% c1=corr(dG(:),d1(:));
% 
% fprintf('Correlation coef for Simple block matching:%f\n',c1);
%     







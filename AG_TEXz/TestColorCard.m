clc;clear all;
[im_data im_data_path] = uigetfile('c:\AGTEX_FILES\*.*','All files');
[img_temp map]= imread(fullfile(im_data_path,im_data));
if ~isempty(map)
    img_temp = ind2rgb(img_temp,map);
end

j = reshape(img_temp, [], 3);
[color, k, idx] = unique(reshape(img_temp, [], 3), 'rows');
% select color now..
color;
choosen_index = 1;% color to change 
choosen_color = [0 0 0];%color(choosen_index,:);
for i=1:length(idx)
    if(idx(i)==choosen_index)
       j(i,:)= choosen_color;
    end
end
recodedimg = reshape(j, [size(img_temp,1), size(img_temp,2),3]);
imshow(recodedimg);

% if length(size(img_temp))==3
%     figure(202);
%     color_pick = impixel(img_temp(:,:,:));
%     for c=1:1:length(img_temp(1,:,:))
%         for r=1:1:length(img_temp(:,1,:))
%             if img_temp(r,c,1)==color_pick(1,1)&& img_temp(r,c,2)==color_pick(1,2)&&img_temp(r,c,3)==color_pick(1,3)
%                 img_temp(r,c,:)=0;
%             else
%                 img_temp(r,c,:)=255;
%             end
%         end
%     end
%     img_temp = img_temp(:,:,1);
% end
% imshow(img_temp);
% A={};
% A{1}=squeeze(img_temp(1,1,:));
% count_unique=1;
% for co=1:1:length(img_temp(1,:,:))
%         for ro=1:1:length(img_temp(:,1,:))
%             isunique = true;
%             for i=1:1:length(A)
%                 unique_check = A{i}==squeeze(img_temp(ro,co,:));
%                 if (unique_check(1)&& unique_check(2)&&unique_check(3))
%                    isunique=false;
%                    break;
%                 end
%             end 
%             if(isunique)
%              count_unique=count_unique+1;
%              A{count_unique}=squeeze(img_temp(ro,co,:));
% %             A=[A;squeeze(img_temp(ro,co,:))];
%             end
%         end
% end

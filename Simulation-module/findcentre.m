function [uc,vc] = findcentre(ogj)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[centre_label,centre_m]=ilabel(ogj);%STEP1:labeled the B picture into m types.

cen_reg1=(centre_label==1);%if the label equals to 1 we classify it into reg1
cen_reg2=(centre_label==2);%likewise we got reg2,reg3....
cen_reg3=(centre_label==3);
cen_reg4=(centre_label==4);
cen_reg5=(centre_label==5);
cen_reg6=(centre_label==6);

centre_num=[sum(cen_reg1(:)),sum(cen_reg2(:)),sum(cen_reg3(:)),sum(cen_reg4(:)),sum(cen_reg5(:)),sum(cen_reg6(:))];
%we use a matrix num to store the num of the regions.

[centre_Max_num,centre_index]=max(centre_num,[],2);%we find the max of the members in num and its index.

centre_ROI=(centre_label==centre_index);

m00=mpq(centre_ROI,0,0);
uc=mpq(centre_ROI,1,0)/m00;
vc=mpq(centre_ROI,0,1)/m00;
end


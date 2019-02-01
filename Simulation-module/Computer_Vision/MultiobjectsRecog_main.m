%%%%%%%%%%%
%种类1为橙色大三角形
%种类2为红色小三角形
%种类3为绿色大三角形
%种类4为黄色平行四边形
%种类5为紫色小三角形
%种类6为粉色小三角形
%%%%%%%%%%%
clc;
clear;
random=iread('random.jpg','double');%random is the input of the function
ROI=iroi(random,[1,2418;1,2750]);%the area deleted fron random is useless.

T=ROI+(1-ROI).*ROI;%图像增强
J=imadjust(T,[0.2 0.8],[]);%图像增强

gROI=imono(J);%gROI is the greyscale of the random picture

k2=kgauss(5);%%使用高斯模糊去噪声

im1=iconv(k2,gROI,'valid');
im2=inormhist(im1);

clean=(im2>=0.47);%选取阈值
%ithresh(gROI);

[label, m, parents, cls]=ilabel(clean);%区域标签化
num=[0,0,0,0,0,0,0,0,0,0];
reg1=(label==1);
num(1)=sum(reg1(:));

reg2=(label==2);
num(2)=sum(reg2(:));

reg3=(label==3);
num(3)=sum(reg3(:));

reg4=(label==4);
num(4)=sum(reg4(:));

reg5=(label==5);
num(5)=sum(reg5(:));

reg6=(label==6);
num(6)=sum(reg6(:));

reg7=(label==7);
num(7)=sum(reg7(:));

reg8=(label==8);
num(8)=sum(reg8(:));

reg9=(label==9);
num(9)=sum(reg9(:));

reg10=(label==10);
num(10)=sum(reg10(:));

reg=[0,0,0,0,0,0,0];
    j=1;
for i=1:10
if (num(i)>100000)&&(num(i)<=1000000)
    reg(j)=i;
    j=j+1;
end
end

obj1=(label==reg(1));
[v1,u1]=find(obj1);
u1min=min(u1);
u1max=max(u1);
v1min=min(v1);
v1max=max(v1);

obj2=(label==reg(2));
[v2,u2]=find(obj2);
u2min=min(u2);
u2max=max(u2);
v2min=min(v2);
v2max=max(v2);

obj3=(label==reg(3));
[v3,u3]=find(obj3);
u3min=min(u3);
u3max=max(u3);
v3min=min(v3);
v3max=max(v3);

obj4=(label==reg(4));
[v4,u4]=find(obj4);
u4min=min(u4);
u4max=max(u4);
v4min=min(v4);
v4max=max(v4);

obj5=(label==reg(5));
[v5,u5]=find(obj5);
u5min=min(u5);
u5max=max(u5);
v5min=min(v5);
v5max=max(v5);

obj6=(label==reg(6));
[v6,u6]=find(obj6);
u6min=min(u6);
u6max=max(u6);
v6min=min(v6);
v6max=max(v6);

imshow(clean);
plot_box(u1min,v1min,u1max,v1max,'r');
plot_box(u2min,v2min,u2max,v2max,'r');
plot_box(u3min,v3min,u3max,v3max,'r');
plot_box(u4min,v4min,u4max,v4max,'r');
plot_box(u5min,v5min,u5max,v5max,'r');
plot_box(u6min,v6min,u6max,v6max,'r');


CROI1=iroi(ROI,[u1min,u1max;v1min,v1max]);
CROI2=iroi(ROI,[u2min,u2max;v2min,v2max]);
CROI3=iroi(ROI,[u3min,u3max;v3min,v3max]);
CROI4=iroi(ROI,[u4min,u4max;v4min,v4max]);
CROI5=iroi(ROI,[u5min,u5max;v5min,v5max]);
CROI6=iroi(ROI,[u6min,u6max;v6min,v6max]);

ROI1=~(iroi(clean,[u1min,u1max;v1min,v1max]));
ROI2=~iroi(clean,[u2min,u2max;v2min,v2max]);
ROI3=~iroi(clean,[u3min,u3max;v3min,v3max]);
ROI4=~iroi(clean,[u4min,u4max;v4min,v4max]);
ROI5=~iroi(clean,[u5min,u5max;v5min,v5max]);
ROI6=~iroi(clean,[u6min,u6max;v6min,v6max]);

[ROI_uc1,ROI_vc1]=findcentre(ROI1);
[ROI_uc2,ROI_vc2]=findcentre(ROI2);
[ROI_uc3,ROI_vc3]=findcentre(ROI3);
[ROI_uc4,ROI_vc4]=findcentre(ROI4);
[ROI_uc5,ROI_vc5]=findcentre(ROI5);
[ROI_uc6,ROI_vc6]=findcentre(ROI6);

uc=[ROI_uc1+u1min;ROI_uc2+u2min;ROI_uc3+u3min;ROI_uc4+u4min;ROI_uc5+u5min;ROI_uc6+u6min;];
vc=[ROI_vc1+v1min;ROI_vc2+v2min;ROI_vc3+v3min;ROI_vc4+v4min;ROI_vc5+v5min;ROI_vc6+v6min;];

imshow(ROI);
hold on
plot(uc,vc,'gx');
plot(uc,vc,'go');
%K=ones(21,21)/21^2;
%idisp(iconv(K,gROI));
%{
g1=imadjust(ROI,[0.45 0.85],[1 0]);
g2=imono(g1);
g3=inormhist(gROI);
im=igamma(g3,1/0.45);
idisp(im/64);
%imshow(g3);

%}
%{
S=kcircle(9);
closed=iopen(g2,S);
clean=iclose(closed,S);
bw1=edge(clean,'roberts');
%}
        
%{
S=kcircle(3);
closed=iopen(gROI,S);
clean=iclose(closed,S);
%eroded=imorph(clean,kcircle(1),'min');
bw1=edge(clean,'log');
%}

%clc;
%clear;
article=CROI2;%iread('1.jpg','double');%更改此处读取的图像。
%%%%%%%%%%%
%种类1为橙色大三角形,图片对应为1.jpg
%种类2为红色小三角形,图片对应为2.jpg
%种类3为绿色大三角形,图片对应为3.jpg
%种类4为黄色平行四边形,图片对应为4.jpg
%种类5为紫色小三角形,图片对应为5.jpg
%种类6为粉色小三角形,图片对应为6.jpg
%%%%%%%%%%%
ptn1=iread('orange.jpg','double');
ptn2=iread('scarlet.jpg','double');
ptn3=iread('green.jpg','double');
ptn4=iread('yellow.jpg','double');
ptn5=iread('purple.jpg','double');
ptn6=iread('pink.jpg','double');


T=article+(1-article).*article;
J=imadjust(T,[0.2 0.8],[],1.1);

cxy=[0.3892,0.4104,0.3255,0.3851,0.3232,0.3180,0.3023;0.3643,0.3345,0.4102,0.4707,0.2699,0.3187,0.3290];

cls=colorkmeans(J,cxy);
cls1=(cls==1);
cls2=(cls==2);
cls3=(cls==3);
cls4=(cls==4);
cls5=(cls==5);
cls6=(cls==6);
cls7=(cls==7);

num=[sum(cls1(:)),sum(cls2(:)),sum(cls3(:)),sum(cls4(:)),sum(cls5(:)),sum(cls6(:))];
%sum1=max(num);
[Max_num,index]=max(num,[],2);

index

subplot(1,2,1);
imshow(article);
title('待识别对象');

subplot(1,2,2);
if(index==1)
imshow(ptn1);
title('种类1，橙色大三角形');
elseif(index==2)
imshow(ptn2);
title('种类2，红色小三角形');
elseif(index==3)
imshow(ptn3);
title('种类3，绿色大三角形');
elseif(index==4)
imshow(ptn4);
title('种类4，黄色平行四边形');
elseif(index==5)
imshow(ptn5);
title('种类5，紫色小三角形');
elseif(index==6)
imshow(ptn6);
title('种类6，粉色小三角形');
end

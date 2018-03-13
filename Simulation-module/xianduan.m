
%imm=iread('obj1.jpg','double');
%2,-0.2,5
%3,0.3,5
%4,0.3,5
%5,0.3,5
%6,-0.3,8
imm=obj6;
im=irotate(imm,-0.3);
edges=icanny(im);
h=Hough(edges,'suppress',8);
lines=h.lines()
idisp(im)
hold on
h.plot('b')
lines=lines.seglength(edges);
k=find(max(lines.length));
lines(k).plot('g')
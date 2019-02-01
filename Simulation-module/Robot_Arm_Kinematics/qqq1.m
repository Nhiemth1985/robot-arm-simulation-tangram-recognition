clc;
clear;

t=0:0.2:5;%时间常数的选择，用于后面的插值处理。这里的选择为0至5秒，每0.2秒计算一次。
S=[3 3];
E=[5 -4.5];
L(1) = Link([0,4,0,pi/2,0]);%%第一个关节DH
L(2) = Link([0 0 4.55 0 0]);%%关节2DH
L(3) = Link([0 0.1 0.35 -pi/2 0]);%%关节3DH
L(4) = Link([0 4.2 0 pi/2 0]);%%关节4DH
L(5) = Link([0 0 0 -pi/2 0]);%%关节5DH
L(6) = Link([0 0.8 0 0 0]);%%关节6DH
kuka6link = SerialLink(L, 'name', 'kuka6link');%将关节串联后取名为kuka6link
kuka6link.base=transl(0,0,2);

PZ=[5 0 5];
TZ=transl(PZ)*trotx(pi);%TS为起始位置PS的坐标转移矩阵。
qz=kuka6link.ikine6s(TZ);%关节角qs
R=[0 0 0 0 0 pi/2];
%kuka6link.plot(qz);

PS=[S(1) S(2) 1];
PE=[E(1) E(2) 1];%place of end


TS=transl(PS)*trotx(pi);%TS为起始位置PS的坐标转移矩阵。
TE=transl(PE)*trotx(pi);%TE为中点位置PE的坐标转移矩阵。


qs=kuka6link.ikine6s(TS);%关节角qs
qe=kuka6link.ikine6s(TE)+R;%关节角矩阵qe


Track1=jtraj(qz,qs,t);%此矩阵为第一段轨迹，即qs-qm位置的轨迹参数。
Track2=jtraj(qs,qz,t);%此矩阵为第一段轨迹，即qs-qm位置的轨迹参数。
Track3=jtraj(qz,qe,t);%此矩阵为第二段轨迹，即qm-qe位置的轨迹参数。
Track4=jtraj(qe,qz,t);%此矩阵为第二段轨迹，即qm-qe位置的轨迹参数。

T11=kuka6link.fkine(Track1);
p11=transl(T11);

T14=kuka6link.fkine(Track4);
p14=transl(T14);

%rectangle('Position',[-7.1,-7.1,14.2,14.2],'Curvature',[1,1]);
%rectangle('Position',[-1,-1,2,2],'Curvature',[1,1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
e1=(E(1)-1):.1:(E(1)+1);
e2=(E(2)-1):.1:(E(2)+1);
[E1,E2]=meshgrid(e1,e2);
s1=(S(1)-1):.01:(S(1)+1);
s2=(S(2)-1):.01:(S(2)+1);
[S1,S2]=meshgrid(s1,s2);
%}

trix1=[(S(1)-1.4),(S(1)+0.6),(S(1)+0.6)]';
triy1=[(S(2)-0.6),(S(2)-0.6),(S(2)+1.4)]';
dt = DelaunayTri(trix1,triy1);
hold on
tri = dt(:,:);
triplot(dt);

%mesh(S1,S2,zeros(size(S1)),'facecolor','green');
text(S(1)+2,S(2)+2,'原重心点坐标(3,3)');

trixe=[(E(1)-0.6),(E(1)-0.6),(E(1)+1.4)]';
triye=[(E(2)+1.4),(E(2)-0.6),(E(2)-0.6)]';
dte = DelaunayTri(trixe,triye);
hold on
trie = dte(:,:);
triplot(dte,'--');
fill(trix1,triy1,'g');
%fill(trixe,triye,'w');


%{
rectangle('position',[S(1)-1,S(2)-1,2,2],'edgecolor','r');
plot(S(1),S(2),'ro');
plot(S(1),S(2),'rx');
rectangle('position',[E(1)-1,E(2)-1,2,2],'edgecolor','w');
plot(E(1),E(2),'wo');
plot(E(1),E(2),'wx');
%}
kuka6link.plot(qz);
axis([-10 10 -10 10 0 10]);
kuka6link.plot(Track1);
plot3(p11(:,1),p11(:,2),p11(:,3),'y','Linewidth',5);
fill(trix1,triy1,'w');
%mesh(S1,S2,zeros(size(S1)),'facecolor','white');
%{
rectangle('position',[S(1)-1,S(2)-1,2,2],'edgecolor','w');
plot(S(1),S(2),'wo');
plot(S(1),S(2),'wx');
%}

axis([-10 10 -10 10 0 10]);
kuka6link.plot(Track2);
axis([-10 10 -10 10 0 10]);
%plot3(p11(:,1),p11(:,2),p11(:,3));

kuka6link.plot(Track3);
axis([-10 10 -10 10 0 10]);
fill(trixe,triye,'g');
plot3(p14(:,1),p14(:,2),p14(:,3),'y','Linewidth',5);
hold on

%shadedplot(E(1)-1,E(1)+1,E(2)-1,E(2)+1);
%rectangle3('position',[E(1)-1,E(2)-1,2,2],'facecolor','r','edgecolor','r');
%mesh(E1,E2,zeros(size(E1)),'facecolor','r');
text(E(1)-1,E(2)-2,'新重心点坐标(5,-4.5)')
%plot(E(1),E(2),'ro');
%plot(E(1),E(2),'rx');

kuka6link.plot(Track4);
%plot3(p14(:,1),p14(:,2),p14(:,3));

%rectangle('position',[S(1)-1,S(2)-1,2,2]);
%mesh(S1,S2,zeros(size(S1)),'facecolor','b');
%text(S(1)+1,S(2)+2,'原重心点坐标(3,3)');
%plot(S(1),S(2),'go');
%plot(S(1),S(2),'gx');

axis([-10 10 -10 10 0 10]);
axis([-10 10 -10 10 0 10])


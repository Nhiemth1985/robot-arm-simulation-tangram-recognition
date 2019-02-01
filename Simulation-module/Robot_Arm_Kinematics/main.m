clc;
clear;

t=0:0.2:5;
S=[3 3];
E=[-4 5];
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
kuka6link.plot(qz);

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

rectangle('Position',[-7.1,-7.1,14.2,14.2],'Curvature',[1,1]);
rectangle('Position',[-1,-1,2,2],'Curvature',[1,1]);
hold on
rectangle('position',[S(1)-1,S(2)-1,2,2],'edgecolor','r');
plot(S(1),S(2),'ro');
plot(S(1),S(2),'rx');
rectangle('position',[E(1)-1,E(2)-1,2,2],'edgecolor','w');
plot(E(1),E(2),'wo');
plot(E(1),E(2),'wx');

axis([-10 10 -10 10 0 10]);

for q1=Track1'
    kuka6link.plot(q1');
end

rectangle('position',[S(1)-1,S(2)-1,2,2],'edgecolor','w');
plot(S(1),S(2),'wo');
plot(S(1),S(2),'wx');

axis([-10 10 -10 10 0 10]);
for q2=Track2'
    kuka6link.plot(q2');
end
axis([-10 10 -10 10 0 10]);
for q3=Track3'
    kuka6link.plot(q3');
end
axis([-10 10 -10 10 0 10]);

hold on
rectangle('position',[E(1)-1,E(2)-1,2,2],'edgecolor','r');
plot(E(1),E(2),'ro');
plot(E(1),E(2),'rx');

for q4=Track4'
    kuka6link.plot(q4');
end
rectangle('position',[S(1)-1,S(2)-1,2,2]);
plot(S(1),S(2),'go');
plot(S(1),S(2),'gx');

axis([-10 10 -10 10 0 10]);
axis([-10 10 -10 10 0 10])


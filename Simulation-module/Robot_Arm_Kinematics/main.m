clc;
clear;

t=0:0.2:5;
S=[3 3];
E=[-4 5];
L(1) = Link([0,4,0,pi/2,0]);%%��һ���ؽ�DH
L(2) = Link([0 0 4.55 0 0]);%%�ؽ�2DH
L(3) = Link([0 0.1 0.35 -pi/2 0]);%%�ؽ�3DH
L(4) = Link([0 4.2 0 pi/2 0]);%%�ؽ�4DH
L(5) = Link([0 0 0 -pi/2 0]);%%�ؽ�5DH
L(6) = Link([0 0.8 0 0 0]);%%�ؽ�6DH
kuka6link = SerialLink(L, 'name', 'kuka6link');%���ؽڴ�����ȡ��Ϊkuka6link
kuka6link.base=transl(0,0,2);



PZ=[5 0 5];
TZ=transl(PZ)*trotx(pi);%TSΪ��ʼλ��PS������ת�ƾ���
qz=kuka6link.ikine6s(TZ);%�ؽڽ�qs
R=[0 0 0 0 0 pi/2];
kuka6link.plot(qz);

PS=[S(1) S(2) 1];
PE=[E(1) E(2) 1];%place of end


TS=transl(PS)*trotx(pi);%TSΪ��ʼλ��PS������ת�ƾ���
TE=transl(PE)*trotx(pi);%TEΪ�е�λ��PE������ת�ƾ���


qs=kuka6link.ikine6s(TS);%�ؽڽ�qs
qe=kuka6link.ikine6s(TE)+R;%�ؽڽǾ���qe


Track1=jtraj(qz,qs,t);%�˾���Ϊ��һ�ι켣����qs-qmλ�õĹ켣������
Track2=jtraj(qs,qz,t);%�˾���Ϊ��һ�ι켣����qs-qmλ�õĹ켣������
Track3=jtraj(qz,qe,t);%�˾���Ϊ�ڶ��ι켣����qm-qeλ�õĹ켣������
Track4=jtraj(qe,qz,t);%�˾���Ϊ�ڶ��ι켣����qm-qeλ�õĹ켣������

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


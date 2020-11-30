clear
clc

load('exdata.mat');

XX=p;
yy=t;

x1 = XX(1,yy(1,:)==1);
y1 = XX(2,yy(1,:)==1);
z1 = XX(3,yy(1,:)==1);
x2 = XX(1,yy(1,:)==2);
y2 = XX(2,yy(1,:)==2);
z2 = XX(3,yy(1,:)==2);

figure(2);
plot3(x1,y1,z1,'ro');
hold on;
plot3(x2,y2,z2,'b*');
grid on;
grid minor;
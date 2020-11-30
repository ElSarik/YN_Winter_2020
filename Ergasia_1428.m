clear
clc

load('exdata.mat');

% 1, -1.5, 0.5, -1.5
a = 1;
b = -1.5;
c = 0.5;
d = -1.5;

%a = 1;
%b = 1;
%c = 0.3;
%d = -1.5;

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
hold on;
Decision(a,b,c,d);
grid on;
grid minor;

clear
clc

load('exdata.mat');
%% Decision plane - Initial values
% 1, -1.5, 0.5, -1.5
a = 1;
b = 1;
c = 1;
d = 0;

%%
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
plot3(x2,y2,z2,'m*');
hold on;
%% Plot 3D axis (optional)
% point1 = [10,0,0];
% point2 = [0,10,0];
% point3 = [0 0 10];
% point4 = [-10,0,0];
% point5 = [0,-10,0];
% point6 = [0 0 -10];
% 
% origin = [0,0,0];
% 
% plot3([origin(1) point1(1)],[origin(2) point1(2)],[origin(3) point1(3)],'LineWidth',2);
% plot3([origin(1) point2(1)],[origin(2) point2(2)],[origin(3) point2(3)],'LineWidth',2);
% plot3([origin(1) point3(1)],[origin(2) point3(2)],[origin(3) point3(3)],'LineWidth',2);
% plot3([origin(1) point4(1)],[origin(2) point4(2)],[origin(3) point4(3)],'LineWidth',2);
% plot3([origin(1) point5(1)],[origin(2) point5(2)],[origin(3) point5(3)],'LineWidth',2);
% plot3([origin(1) point6(1)],[origin(2) point6(2)],[origin(3) point6(3)],'LineWidth',2);
%%
hold on;
Decision(a,b,c,d);
grid on;
grid minor;

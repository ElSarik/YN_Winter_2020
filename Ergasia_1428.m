%% Sarikakis Ilias - Ioannis:1428
%%
clear
clc

load('exdata.mat','p','t'); % Loading of exdata.mat
%%
x1 = p(1,t(1,:)==1);
y1 = p(2,t(1,:)==1);    % Separating the pattern coordinates
z1 = p(3,t(1,:)==1);    % x1,y1,z1 and x2,y2,z2 based on the their category.
x2 = p(1,t(1,:)==2);    % They will be used in order to plot the data.
y2 = p(2,t(1,:)==2);
z2 = p(3,t(1,:)==2);

X1 = p(1,:);    
X2 = p(2,:);    % Creating the inputs X1,X2,X3 and the expected output Y
X3 = p(3,:);    % in order to feed them to the perceptron.
Y = t(1,:);
%% Changing the classification of the second class from 2 to -1 (rename)
for i=1:size(Y,2)
    if Y(1,i) ~= 1      % An optional step, but I wanted to follow the
        Y(1,i) = -1;    % way the classes were shown inside the lesson notes.
    end
end
%% Creating a figure and displaying the data.
figure(1);
plot3(x1,y1,z1,'ro');
hold on;
plot3(x2,y2,z2,'m*');
hold on;
grid on;
grid minor;
hold on;
%% Execution the Perceptron algorithm
% Perceptron(X1,X2,X3,Y);
PerceptronV2(X1,X2,X3,Y);
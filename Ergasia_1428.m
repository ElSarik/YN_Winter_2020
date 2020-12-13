%% Sarikakis Ilias - Ioannis:1428
%% Main executable file
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

W1 = -1+rand(1,1)*2;
W2 = -1+rand(1,1)*2;    % Weights initialization with random values.
W3 = -1+rand(1,1)*2;
W0 = -1+rand(1,1)*2;

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
Perceptron(X1,X2,X3,Y,W1,W2,W3,W0);
PerceptronV2(X1,X2,X3,Y,W1,W2,W3,W0);

%% Results Section:
%% NOTES: epsilon is located in line 9 of PerceptronV2.m

% P1 = Is the original Perceptron algorithm.
% P2 = Has the weight distance as a terminal condition.

% Same dataset, same initial weights, same learning rate, different epsilon value.

%% Observations:
% - Since ||w(k)-w(k+1)|| < epsilon, epsilon must be > 0

% - Second perceptron will always finish 1 or 2 epochs faster than the
% first perceptron, since P2 doesn't go through all the patterns to check
% whether weight changes are required or not. P2 simply checks the weight
% distance at the end of each epoch.

% - An epsilon that is bellow a certain threshold is guaranteed to find the
% solution to a linear separable problem. Here the threshold is the
% learning rate.

% - If epsilon > learning rate, there is a big chance that P2 will stop
% without managing to find the linear solution.

%% Conclusions:
% - Epsilon greatly depends on the learning rate. If epsilon < learning rate,
% then a solution will always be achieved. If epsilon > learning rate, then
% depending on how much larger epsilon is, a solution might never be
% reached.

% - I believe that P2 is capable of coming really close to a solution for
% non-linear separable problems, thanks to the weight distance calculation.